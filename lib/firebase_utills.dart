import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diet_planner/home_screen/home_screen.dart';
import 'package:diet_planner/meal_screen/components/recipe.dart';
import 'package:diet_planner/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<List<Recipe>> getRecipes() async {
  List<Recipe> recipes = [];
  try {
    // Fetch breakfast recipes from the server
    QuerySnapshot<Map<String, dynamic>> recipeSnapshot =
        await FirebaseFirestore.instance.collection('Recipes-1').get();
    if (kDebugMode) {
      print("length: ${recipeSnapshot.docs.length}");
    }
    for (var recipeDoc in recipeSnapshot.docs) {
      Recipe recipeData = Recipe.fromMap(recipeDoc.data());
      recipes.add(recipeData);
    }
    if (kDebugMode) {
      print("breakfastRecipes: ${recipes.length}");
    }
  } catch (e) {
    if (kDebugMode) {
      print(e.toString());
    }
  }
  // print("breakfastRecipes hhh.....: ${breakfastRecipes}");
  return recipes;
}

List<Recipe> getRecipesByCategory(String category, List<Recipe> recipes) {
  return recipes.where((recipe) => recipe.category.contains(category)).toList();
}
Future<void> updateUserData(String name, String value) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;
    // Reference to the 'users' collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Reference to the document of the specific user based on UID
    DocumentReference userDoc = users.doc(uid);

    // Update the data using the update method
    await userDoc.update({name: value});

    print('User data updated successfully.');
  } catch (e) {
    // Handle errors
    print('Error updating user data: $e');
  }
}
Future<void> addRecipeIdToMeal(String recipeId) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;

    // Reference to the 'users' collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    // Reference to the document of the specific user based on UID
    DocumentReference userDoc = users.doc(uid);

    // Update the 'mealIds' array field using arrayUnion
    await userDoc.update({
      'mealIds': FieldValue.arrayUnion([recipeId]),
    });

    print('Recipe ID added to mealIds array successfully.');
  } catch (e) {
    // Handle errors
    print('Error updating user data: $e');
  }
}


Future<void> addData(String name) async {
  try {
    FirebaseAuth auth = FirebaseAuth.instance;
    String uid = auth.currentUser!.uid;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    await users.doc(uid).set({
      'full_name': name,
    });

    print('Data added successfully!');
  } catch (e) {
    print('Error adding data: $e');
    // Handle the error as needed, e.g., show an error message to the user
  }
}


Future signIn(String email, String password, BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (context.mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
      await getUserData();
  } on FirebaseAuthException catch (e) {
    String message = "There is not Internet";
    switch (e.code) {
      case "invalid-email":
        message = "The email you entered is invalid";
        break;
      case "user-disabled":
        message = "The user you tried to log into is disabled";
        break;
      case "user-not-found":
        message = "The user you tried to log into was not find";
        break;
      case "wrong-password":
        message = "Incorrect Password";
        break;
    }
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Sign in failed"),
              content: Text(e.code),
            ));
  }
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
    print('User logged out successfully');
  } catch (e) {
    print('Error logging out: $e');
    // Handle the error as needed
  }
}

User? getCurrentUser() {
  return FirebaseAuth.instance.currentUser;
}

Future<void> getUserData() async {
  try {
    User? user = getCurrentUser();
    if (user != null) {
      String userId = user.uid;
      // Reference to the 'users' collection
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .get();

      // Check if the user exists
      if (snapshot.exists) {
        // Convert to UserData object
        UserDataSingleton userDataSingleton = UserDataSingleton();
        userDataSingleton.fullName = snapshot.get('full_name');
        print("User data: ${userDataSingleton.fullName} ");
      } else {

      UserDataSingleton userDataSingleton = UserDataSingleton();
      userDataSingleton.fullName = null;
      }

    }
  } catch (e) {
    // Handle errors
    print("Error getting user data: $e");
    return null;
  }
}
