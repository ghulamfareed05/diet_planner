
import 'package:diet_planner/size_config.dart';
import 'package:flutter/material.dart';

class NutritionProgressCard extends StatelessWidget {
  final double carbProgress; // Range: 0.0 (empty) to 1.0 (full)
  final double proteinProgress;
  final double fatProgress;
  final String carbLabel;
  final String proteinLabel;
  final String fatLabel;
  final int carbObtainedGrams;
  final int proteinObtainedGrams;
  final int fatObtainedGrams;
  final int carbTotalGrams;
  final int proteinTotalGrams;
  final int fatTotalGrams;
  final Color carbColor; // Customize as needed
  final Color proteinColor; // Customize as needed
  final Color fatColor; // Customize as needed
  final bool showTooltips; // Optional

  const NutritionProgressCard({
    super.key,
    required this.carbProgress,
    required this.proteinProgress,
    required this.fatProgress,
    required this.carbLabel,
    required this.proteinLabel,
    required this.fatLabel,
    required this.carbObtainedGrams,
    required this.proteinObtainedGrams,
    required this.fatObtainedGrams,
    required this.carbTotalGrams,
    required this.proteinTotalGrams,
    required this.fatTotalGrams,
    this.carbColor = Colors.orange, // Example customization
    this.proteinColor = Colors.blue, // Example customization
    this.fatColor = Colors.green, // Example customization
    this.showTooltips = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2.0,
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(carbLabel),

                    showTooltips
                        ? Tooltip(
                            message:
                                'Carbohydrates provide energy for your body.',
                            child: IconButton(
                              icon: const Icon(Icons.info_outline),
                              onPressed: () {},
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(proteinLabel),

                    showTooltips
                        ? Tooltip(
                            message:
                                'Proteins are the building blocks of your body.',
                            child: IconButton(
                              icon: const Icon(Icons.info_outline),
                              onPressed: () {},
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(fatLabel),

                    showTooltips
                        ? Tooltip(
                            message:
                                'Fats provide energy and support cell function.',
                            child: IconButton(
                              icon: const Icon(Icons.info_outline),
                              onPressed: () {},
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: getProportionateScreenHeight(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: carbProgress,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(carbColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: SizedBox(
                  height: getProportionateScreenHeight(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: proteinProgress,

                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(proteinColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: SizedBox(
                  height: getProportionateScreenHeight(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: fatProgress,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(fatColor),
                    ),
                  ),
                ),
              ),
            ],
          ),SizedBox(height: getProportionateScreenHeight(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child:Text(
                  "$carbObtainedGrams/$carbTotalGrams g",
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: Text(
                  "$proteinObtainedGrams/$proteinTotalGrams g",
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(10)),
              Expanded(
                child: Text(
                  "$fatObtainedGrams/$fatTotalGrams g",
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
//
// class NutritionProgressCard extends StatelessWidget {
//   final double carbsProgress;
//   final double proteinProgress;
//   final double fatProgress;
//
//   const NutritionProgressCard({
//     super.key,
//     required this.carbsProgress,
//     required this.proteinProgress,
//     required this.fatProgress,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               NutritionProgressBar(
//                 label: 'Carbs',
//                 progress: carbsProgress,
//                 color: Colors.blue, // Customize color for carbs
//               ),
//               // NutritionProgressBar(
//               //   label: 'Protein',
//               //   progress: proteinProgress,
//               //   color: Colors.green, // Customize color for protein
//               // ),
//               // NutritionProgressBar(
//               //   label: 'Fat',
//               //   progress: fatProgress,
//               //   color: Colors.red, // Customize color for fat
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class NutritionProgressBar extends StatelessWidget {
//   final String label;
//   final double progress;
//   final Color color;
//
//   const NutritionProgressBar({
//     Key? key,
//     required this.label,
//     required this.progress,
//     required this.color,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         LinearProgressIndicator(
//           value: progress,
//
//           backgroundColor: Colors.grey[300],
//           valueColor: AlwaysStoppedAnimation<Color>(color),
//         ),
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }
