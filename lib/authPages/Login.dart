import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/authPages/ForgetPassword.dart';
import 'package:pjc_empire/authPages/Register.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authentication = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
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
                  //       margin: const EdgeInsets.only(bottom: 50.0, left: 10.0),
                  //       child: IconButton(
                  //           icon: Icon(
                  //             Icons.arrow_back_ios,
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
                        'Sign in to continue',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF0272BA), fontSize: 20.0),
                      ),
                      SizedBox(
                          height: orientation == Orientation.portrait
                              ? 20.0
                              : 10.0),
                      _inputText(
                          ctl: _usernameController,
                          labelText: 'Enter your Email',
                          icon: Icons.person,
                          obscure: false),
                      SizedBox(height: 10.0),
                      _inputText(
                          ctl: _passwordController,
                          labelText: 'Enter your password',
                          icon: Icons.lock,
                          obscure:
                              Provider.of<Controller>(context, listen: true)
                                  .isObsure,
                          context: context,
                          iconP: Provider.of<Controller>(context, listen: true)
                                  .isObsure
                              ? FontAwesome.eye
                              : FontAwesome.eye_slash),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Get.to(() => ForgetPassword()),
                          child: Text(
                            'Forgot Password?',
                            style: GoogleFonts.montserrat(
                                fontSize: 15, color: Color(0xFF0272BA)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: Provider.of<Controller>(context, listen: true)
                                .isLoading
                            ? CircularProgressIndicator()
                            : MaterialButton(
                                onPressed: () {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  Provider.of<Controller>(context,
                                          listen: false)
                                      .validateData(
                                          _usernameController.text.trim(),
                                          _passwordController.text.trim(),
                                          context);
                                },
                                height: 50.0,
                                color: Color(0xFF0272BA),
                                textColor: Colors.white,
                                minWidth: MediaQuery.of(context).size.width,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.0)),
                                child: Text(
                                  'Sign In',
                                  style: GoogleFonts.montserrat(fontSize: 15),
                                ),
                              ),
                      ),
                      SizedBox(height: 25.0),
                      Provider.of<Controller>(context, listen: true)
                              .canCheckBiometric
                          ? Provider.of<Controller>(context, listen: true)
                                  .isEnable
                              ? Provider.of<Controller>(context, listen: true)
                                      .isLoading
                                  ? Container()
                                  : GestureDetector(
                                      onTap: () {
                                        isAuthorized(context);
                                      },
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color(0xFF0272BA).withOpacity(.2),
                                        radius: 30,
                                        child: Icon(
                                          MaterialIcons.fingerprint,
                                          size: 30,
                                          color: Color(0xFF0272BA),
                                        ),
                                      ),
                                    )
                              : Container()
                          : Container(),
                      SizedBox(height: 25.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account? ',
                              style: GoogleFonts.montserrat(fontSize: 14.5)),
                          GestureDetector(
                            child: Text(
                              'Sign up',
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF0272BA),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () => Get.to(() => Register()),
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

  void isAuthorized(context) async {
    bool isAuthorized = false;
    const iosStrings = const IOSAuthMessages(
        cancelButton: 'cancel',
        goToSettingsButton: 'settings',
        goToSettingsDescription: 'Please set up your Touch ID.',
        lockOut: 'Please reenable your Touch ID');
    try {
      isAuthorized = await _authentication.authenticateWithBiometrics(
          localizedReason: "Please Authentication to continue",
          useErrorDialogs: true,
          stickyAuth: true,
          iOSAuthStrings: iosStrings);
    } on PlatformException catch (e) {
      print(e);
    }
    if (isAuthorized) {
      Provider.of<Controller>(context, listen: false).getOnFingerPrint(context);
    } else
      Get.snackbar('error', 'Authorization Not Successful',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
  }

  Widget _inputText({ctl, labelText, icon, iconP, obscure, context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Color(0xFF0272BA).withOpacity(.6), width: 1.5),
              borderRadius: BorderRadius.circular(8.0)),
          height: 45.0,
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
                  enableInteractiveSelection: false,
                  obscureText: obscure,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: labelText,
                    hintStyle: GoogleFonts.montserrat(
                        fontSize: 14.0, color: Colors.grey),
                    suffixIcon: IconButton(
                        icon: Icon(
                          iconP,
                          color: Colors.grey,
                          size: 15,
                        ),
                        onPressed: () =>
                            Provider.of<Controller>(context, listen: false)
                                .changeObscure()),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.9, horizontal: 2.0),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value) {},
                ),
              ),
            ],
          ),
        ),
      );
}
