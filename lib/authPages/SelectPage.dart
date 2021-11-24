import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/authPages/Login.dart';
import 'package:pjc_empire/authPages/Register.dart';

class SelectState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: Container(
          child: orientation == Orientation.portrait
              ? _forgotPassword(context)
              : SingleChildScrollView(
                  child: _forgotPassword(context),
                )),
    );
  }

  Widget _forgotPassword(context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 200,
            height: 200,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text('Let\'s Get You Started',
              style: GoogleFonts.montserrat(
                  fontSize: 20.0, color: Color(0xFF0272BA))),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: MaterialButton(
              onPressed: () => Get.to(() => Register()),
              height: 50.0,
              color: Color(0xFF0272BA),
              textColor: Colors.white,
              minWidth: MediaQuery.of(context).size.width,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                'Register',
                style: GoogleFonts.montserrat(fontSize: 15),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: MaterialButton(
              onPressed: () => Get.to(() => LoginPage()),
              height: 50.0,
              color: Colors.white,
              textColor: Colors.black,
              minWidth: MediaQuery.of(context).size.width,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0)),
              child: Text(
                'Sign In',
                style: GoogleFonts.montserrat(fontSize: 15),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}
