import 'package:flutter/material.dart';
import 'package:pjc_empire/components/CustomOtp.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/DashBoard.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreatePin extends StatelessWidget {
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
      title: "Create your New 4 Pin",
      subTitle:
          "It's important to protect your information against unknown logins and suspicious activity.",
      icon: Image.asset(
        'assets/logo.png',
        fit: BoxFit.fill,
      ),
    );
  }

  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConfirmPin()));
  }

  Future<String> validateOtp(String otp, context) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp.length == 4) {
      Provider.of<Controller>(context, listen: false).createPin(otp);
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }
}

class ConfirmPin extends StatelessWidget {
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
      title: "Confirm your New 4 Pin",
      subTitle:
          "It's important to protect your information against unknown logins and suspicious activity.",
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
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == Provider.of<Controller>(context, listen: false).myPin) {
      sharedPref
          .setString("userpin", otp)
          .then((value) => print(value.toString() + "pin saved"));
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }
}
