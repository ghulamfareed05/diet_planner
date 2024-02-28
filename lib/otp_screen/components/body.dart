import 'package:diet_planner/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../components/default_button.dart';
import '../../constants.dart';
import '../../home_screen/home_screen.dart';
import '../../provider/auth_provider.dart';
import '../../size_config.dart';
import '../../utilities.dart';

class Body extends StatefulWidget {
  const Body({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  String? otpCode;

  // void verifyOtp(){
  //   Utilities utilities = Utilities();
  //   utilities.verifyOtp(context, widget.verificationId, otpCode!);
  // }
  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );
    return SafeArea(
        child: SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Pinput(
              controller: pinController,
              focusNode: focusNode,
              length: 6,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              validator: (value) {
                return value == '2222' ? null : 'Pin is incorrect';
              },
              // onClipboardFound: (value) {
              //   debugPrint('onClipboardFound: $value');
              //   pinController.setText(value);
              // },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                setState(() {
                  otpCode = pin;
                });
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  borderRadius: BorderRadius.circular(19),
                  border: Border.all(color: focusedBorderColor),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent),
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(28),
            ),
            DefaultButton(
              text: "Verify Number",
              press: () {
                if (otpCode != null) {
                  verifyOtp(context,otpCode!);
                } else {
                  showSnackBar(context, "Enter 6-Digit code");
                }
              },
            )
          ],
        ),
      ),
    ));
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        // checking whether user exists in the db
        // ap.checkExistingUser().then(
        //       (value) async {
        //     if (value == true) {
        //       // user exists in our app
        //       ap.getDataFromFirestore().then(
        //             (value) => ap.saveUserDataToSP().then(
        //               (value) => ap.setSignIn().then(
        //                 (value) => Navigator.pushAndRemoveUntil(
        //                 context,
        //                 MaterialPageRoute(
        //                   builder: (context) => const HomeScreen(),
        //                 ),
        //                     (route) => false),
        //           ),
        //         ),
        //       );
        //     } else {
        // new user
        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => const UserInfromationScreen()),
        //         (route) => false);
        // }
      },
      // );
      // },
    );
  }
}
