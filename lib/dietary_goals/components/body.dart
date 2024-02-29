import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_planner/quick_track/quick_track.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../components/nutrition_circular_bar.dart';
import '../../components/nutrition_progress_card.dart';
import '../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  Future<Map<String, dynamic>> getTotalNutrientsByCategory(String category) async {
    try {
      final userId = FirebaseAuth.instance.currentUser!.uid;
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('users')
          .doc(userId)
          .collection('nutrient_data_$category')
          .get();

      print('Number of documents for $category: ${querySnapshot.size}');

      int totalKcal = 0;
      int totalCarbs = 0;
      int totalFat = 0;
      int totalProtein = 0;
      bool isGlutenFree ;
      bool isVegetarian ;

      String documentId = ''; // Initialize document ID

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in querySnapshot.docs) {
        print("erererer");
        totalKcal += (doc['kcal'] as num).toDouble().toInt();
        totalCarbs += (doc['carbs'] as num).toDouble().toInt();
        totalFat += (doc['fat'] as num).toDouble().toInt();
        totalProtein += (doc['protein'] as num).toDouble().toInt();
        isGlutenFree = doc['isGlutenFree'] ;
        isVegetarian = doc['isVegetarian'] ;

        // Get the document ID (use the last one as an example)
        documentId = doc.id;
      }

      print("Total Kcal: $totalKcal Total Carbs: $totalCarbs Total Fat: $totalFat Total Protein: $totalProtein");

      return {
        'id': documentId,
        'totalKcal': totalKcal,
        'totalCarbs': totalCarbs,
        'totalFat': totalFat,
        'totalProtein': totalProtein,
      };
    } catch (e) {
      print("Error fetching and aggregating nutrient data: $e");
      throw e;
    }
  }
  Future<void> editData(String category ,  Map<String, dynamic>? nutrientData) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => QuickTrack(category: category,
      documentId: nutrientData?['id'] ?? '',
      totalKcal: nutrientData?['totalKcal'] ?? 0,
      totalCarbs: nutrientData?['totalCarbs'] ?? 0,
      totalFat: nutrientData?['totalFat'] ?? 0,
      totalProtein: nutrientData?['totalProtein'] ?? 0,
      isGlutenFree: nutrientData?['isGlutenFree'] ?? false,
      isVegetarian: nutrientData?['isVegetarian'] ?? false,    )));
    print("Editing data for $category");
  }

  // Function to reset the data
  Future<void> resetData(String category) async {
    // Implement logic to reset the data, e.g., set all values to 0 in the Firestore document.
    print("Resetting data for $category");
  }

  Widget buildMealContent(String category) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            '$category Goal',
            style: TextStyle(fontSize: 24),
          ),

          FutureBuilder<Map<String, dynamic>>(
            future: getTotalNutrientsByCategory(category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                // Extract nutrient data from snapshot
                Map<String, dynamic> nutrientData = snapshot.data!;
                return Column(
                  children: [
                    NutritionCircularBar(
                      eatenValue: 10,
                      burnedValue: 0,
                      totalCalories: nutrientData['totalKcal'],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(25),
                    ),
                    NutritionProgressCard(
                      carbProgress: nutrientData['totalCarbs']/1000 , // Adjust if needed
                      proteinProgress: nutrientData['totalProtein']/1000, // Adjust if needed
                      fatProgress: nutrientData['totalFat']/1000 , // Adjust if needed
                      carbLabel: "Carbs",
                      proteinLabel: "Protein",
                      fatLabel: "Fat",
                      carbObtainedGrams: 72,
                      proteinObtainedGrams: 50,
                      fatObtainedGrams: 20,
                      carbTotalGrams: nutrientData['totalCarbs'] as int,
                      proteinTotalGrams: nutrientData['totalProtein'] as int,
                      fatTotalGrams: nutrientData['totalFat'] as int,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () => editData(category , snapshot.data),
                          child: Text('Edit'),
                        ),
                        ElevatedButton(
                          onPressed: () => resetData(category),
                          child: Text('Reset'),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Text('No data available.');
              }
            },
          ),


        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: [
                    buildMealContent('breakfast'),
                    buildMealContent('lunch'),
                    buildMealContent('dinner'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}