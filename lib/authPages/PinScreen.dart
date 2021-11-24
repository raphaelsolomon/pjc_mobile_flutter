import 'package:flutter/material.dart';
import 'package:pjc_empire/components/CustomOtp.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/DashBoard.dart';
import 'package:provider/provider.dart';

class PinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomOtp.withGradientBackground(
      topColor: Color(0xFFFFFFFF),
      bottomColor: Color(0xFFFFFFFF),
      otpLength: 4,
      validateOtp: (otp) => validateOtp(otp, context),
      routeCallback: moveToNextScreen,
      titleColor: Color(0xFF0272BA),
      themeColor: Colors.black,
      title: "Enter your 4 Digit Pin",
      subTitle:
          "Using a secure PIN is crucial to preventing unauthorized access to your information, accounts, and assets.",
      icon: Image.asset(
        'assets/logo.png',
        fit: BoxFit.fill,
      ),
    );
  }

  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DashBoard()));
  }

  Future<String> validateOtp(String otp, context) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == Provider.of<Controller>(context, listen: false).isPinEnabled) {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }
}
