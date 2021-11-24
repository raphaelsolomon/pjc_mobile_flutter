import 'dart:ui';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/authPages/Login.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  final _scaffold = GlobalKey<ScaffoldState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _conPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        key: _scaffold,
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFF0272BA),
        body: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: orientation == Orientation.portrait ? 155 : 110,
              child: Stack(
                children: [
                  // Align(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Container(
                  //       margin: const EdgeInsets.only(bottom: 40.0, left: 10.0),
                  //       child: IconButton(
                  //           icon: Icon(
                  //             Icons.null,
                  //             size: 17.0,
                  //             color: Colors.white,
                  //           ),
                  //           onPressed: () => Get.back())),
                  // ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0, left: 20.0),
                        child: Text(
                          'Welcome',
                          style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: 25),
                        )),
                  ),
                  Align(
                    child: Container(
                      height: 90.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0.0),
                              bottomLeft: Radius.circular(80.0),
                              bottomRight: Radius.circular(55.5))),
                    ),
                    alignment: Alignment.topRight,
                  ),
                  Align(
                    child: Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      height: 90.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(500.0),
                              bottomLeft: Radius.circular(500.0),
                              bottomRight: Radius.circular(0.0),
                              topRight: Radius.circular(0.0))),
                    ),
                    alignment: Alignment.topRight,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(0.0),
                        bottomRight: Radius.circular(0.0),
                        topRight: Radius.circular(20.0))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: orientation == Orientation.portrait
                              ? 30.0
                              : 12.0),
                      Text(
                        'Create an Account',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF0272BA), fontSize: 20.0),
                      ),
                      SizedBox(
                          height: orientation == Orientation.portrait
                              ? 20.0
                              : 10.0),
                      _inputText(
                          ctl: _emailController,
                          labelText: 'Enter your Email',
                          icon: Icons.person,
                          label: 'Email',
                          obscure: false),
                      SizedBox(height: 10.0),
                      _inputText(
                          ctl: _passwordController,
                          labelText: 'Enter your password',
                          icon: Icons.lock,
                          label: 'Password',
                          context: context,
                          obscure:
                              Provider.of<Controller>(context, listen: true)
                                  .isObsure,
                          iconP: Provider.of<Controller>(context, listen: true)
                                  .isObsure
                              ? FontAwesome.eye
                              : FontAwesome.eye_slash),
                      SizedBox(height: 10.0),
                      _inputText(
                          ctl: _conPasswordController,
                          labelText: 'Confirm password',
                          icon: Icons.lock,
                          context: context,
                          label: 'Confirm Password',
                          obscure:
                              Provider.of<Controller>(context, listen: true)
                                  .isObsure,
                          iconP: Provider.of<Controller>(context, listen: true)
                                  .isObsure
                              ? FontAwesome.eye
                              : FontAwesome.eye_slash),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Provider.of<Controller>(context, listen: true)
                                .isLoading
                            ? CircularProgressIndicator()
                            : MaterialButton(
                                onPressed: () => Provider.of<Controller>(
                                        context,
                                        listen: false)
                                    .validateDetails(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                        _conPasswordController.text.trim(),
                                        _scaffold.currentState),
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
                      SizedBox(height: 35.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account? ',
                              style: GoogleFonts.montserrat(fontSize: 14.5)),
                          GestureDetector(
                            child: Text(
                              'Login',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF0272BA), fontSize: 17),
                            ),
                            onTap: () => Get.to(() => LoginPage()),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 65,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget _inputText({ctl, labelText, icon, label, iconP, obscure, context}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 14.5,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color(0xFF0272BA).withOpacity(.6), width: 1.5),
                  borderRadius: BorderRadius.circular(8.0)),
              height: 45.0,
              margin: const EdgeInsets.only(top: 8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 4.0),
                    child: Icon(
                      icon,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: ctl,
                      obscureText: obscure,
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                      decoration: InputDecoration(
                          hintText: labelText,
                          hintStyle: GoogleFonts.montserrat(
                              fontSize: 14.0, color: Colors.grey),
                          suffixIcon: IconButton(
                              icon: Icon(
                                iconP,
                                color: Colors.grey,
                                size: 15,
                              ),
                              onPressed: () => Provider.of<Controller>(context,
                                      listen: false)
                                  .changeObscure()),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.9, horizontal: 2.0),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (value) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
