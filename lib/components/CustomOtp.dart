library otp_screen;

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class CustomOtp extends StatefulWidget {
  final String title;
  final String subTitle;
  final Future<String> Function(String) validateOtp;
  final void Function(BuildContext) routeCallback;
  Color topColor;
  Color bottomColor;
  final Color titleColor;
  final Color themeColor;
  final Color keyboardBackgroundColor;
  final Widget icon;

  /// default [otpLength] is 4
  final int otpLength;

  CustomOtp({
    Key key,
    this.title = "Verification Code",
    this.subTitle = "please enter the OTP sent to your\n device",
    this.otpLength = 4,
    @required this.validateOtp,
    @required this.routeCallback,
    this.themeColor = Colors.black,
    this.titleColor = Colors.black,
    this.icon,
    this.keyboardBackgroundColor,
  });

  CustomOtp.withGradientBackground(
      {Key key,
      this.title = "Verification Code",
      this.subTitle = "please enter the OTP sent to your\n device",
      this.otpLength = 4,
      @required this.validateOtp,
      @required this.routeCallback,
      this.themeColor = Colors.white,
      this.titleColor = Colors.white,
      @required this.topColor,
      @required this.bottomColor,
      this.keyboardBackgroundColor,
      this.icon});

  @override
  _CustomOtpState createState() => new _CustomOtpState();
}

class _CustomOtpState extends State<CustomOtp>
    with SingleTickerProviderStateMixin {
  Size _screenSize;
  int _currentDigit;
  List<int> otpValues;
  bool showLoadingButton = false;

  @override
  void initState() {
    otpValues = List<int>.filled(widget.otpLength, null, growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _screenSize = MediaQuery.of(context).size;
    return new Scaffold(
      backgroundColor: Color(0xFF0272BA),
      resizeToAvoidBottomInset: true,
      // body: Container(
      //     padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
      //     height: MediaQuery.of(context).size.height,
      //     decoration: widget._isGradientApplied
      //         ? BoxDecoration(
      //             gradient: LinearGradient(
      //             colors: [widget.topColor, widget.bottomColor],
      //             begin: FractionalOffset.topLeft,
      //             end: FractionalOffset.bottomRight,
      //             stops: [0, 1],
      //             tileMode: TileMode.clamp,
      //           ))
      //         : BoxDecoration(color: Colors.white),
      //     width: _screenSize.width,
      //     child: _getInputPart),
      body: Column(
        children: [
          Container(
            color: Colors.transparent,
            height: 135,
            child: Stack(
              children: [
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
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, bottom: 20.0),
                              child: _getTitleText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: _getSubtitleText,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 20.0),
                              child: _getInputField,
                            ),
                            SizedBox(
                              height: 9.0,
                            ),
                            showLoadingButton
                                ? Center(child: CircularProgressIndicator())
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: MaterialButton(
                                      onPressed: () {
                                        FocusScope.of(context)
                                            .requestFocus(FocusNode());
                                      },
                                      height: 50.0,
                                      color: Color(0xFF0272BA),
                                      textColor: Colors.white,
                                      minWidth:
                                          MediaQuery.of(context).size.width,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0)),
                                      child: Text(
                                        'Continue',
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15),
                                      ),
                                    ),
                                  ),
                            SizedBox(
                              height: 9.0,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: _getOtpKeyboard,
                      )
                    ],
                  )))
        ],
      ),
    );
  }

  /// Return Title label
  get _getTitleText {
    return new Text(
      widget.title,
      textAlign: TextAlign.center,
      style: GoogleFonts.montserrat(
          fontSize: 18.0,
          color: Colors.black.withOpacity(.7),
          fontWeight: FontWeight.w500),
    );
  }

  /// Return subTitle label
  get _getSubtitleText {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: new Text(
        widget.subTitle,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
            fontSize: 15.0,
            color: Colors.black.withOpacity(.7),
            fontWeight: FontWeight.w600),
      ),
    );
  }

  /// Return "OTP" input fields
  get _getInputField {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: getOtpTextWidgetList(),
    );
  }

  /// Returns otp fields of length [widget.otpLength]
  List<Widget> getOtpTextWidgetList() {
    List<Widget> optList = [];
    for (int i = 0; i < widget.otpLength; i++) {
      optList.add(_otpTextField(otpValues[i]));
    }
    return optList;
  }

  /// Returns "Otp" keyboard
  get _getOtpKeyboard {
    return new Container(
        color: Color(0xFF0272BA).withOpacity(.1),
        height: _screenSize.width - 80,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _otpKeyboardInputButton(
                      label: "1",
                      onPressed: () {
                        _setCurrentDigit(1);
                      }),
                  _otpKeyboardInputButton(
                      label: "2",
                      onPressed: () {
                        _setCurrentDigit(2);
                      }),
                  _otpKeyboardInputButton(
                      label: "3",
                      onPressed: () {
                        _setCurrentDigit(3);
                      }),
                ],
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "4",
                    onPressed: () {
                      _setCurrentDigit(4);
                    }),
                _otpKeyboardInputButton(
                    label: "5",
                    onPressed: () {
                      _setCurrentDigit(5);
                    }),
                _otpKeyboardInputButton(
                    label: "6",
                    onPressed: () {
                      _setCurrentDigit(6);
                    }),
              ],
            ),
            SizedBox(
              height: 9.0,
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _otpKeyboardInputButton(
                    label: "7",
                    onPressed: () {
                      _setCurrentDigit(7);
                    }),
                _otpKeyboardInputButton(
                    label: "8",
                    onPressed: () {
                      _setCurrentDigit(8);
                    }),
                _otpKeyboardInputButton(
                    label: "9",
                    onPressed: () {
                      _setCurrentDigit(9);
                    }),
              ],
            ),
            Flexible(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new SizedBox(
                    width: 80.0,
                  ),
                  _otpKeyboardInputButton(
                      label: "0",
                      onPressed: () {
                        _setCurrentDigit(0);
                      }),
                  _otpKeyboardActionButton(
                      label: new Icon(
                        Icons.backspace,
                        color: widget.themeColor,
                      ),
                      onPressed: () {
                        setState(() {
                          for (int i = widget.otpLength - 1; i >= 0; i--) {
                            if (otpValues[i] != null) {
                              otpValues[i] = null;
                              break;
                            }
                          }
                        });
                      }),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Returns "Otp text field"
  Widget _otpTextField(int digit) {
    return new Container(
      width: 35.0,
      height: 45.0,
      alignment: Alignment.center,
      child: new Text(
        digit != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 25.0,
          color: Colors.black.withOpacity(.5),
        ),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        width: 2.0,
        color: widget.titleColor.withOpacity(.2),
      ))),
    );
  }

  /// Returns "Otp keyboard input Button"
  Widget _otpKeyboardInputButton({String label, VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: new Material(
          color: Colors.white,
          child: new InkWell(
            onTap: onPressed,
            borderRadius: new BorderRadius.circular(7.0),
            child: new Container(
              height: 40.0,
              width: 80.0,
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: new Center(
                child: new Text(
                  label,
                  style: new TextStyle(
                    fontSize: 20.0,
                    color: widget.themeColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Returns "Otp keyboard action Button"
  _otpKeyboardActionButton({Widget label, VoidCallback onPressed}) {
    return new InkWell(
      onTap: onPressed,
      borderRadius: new BorderRadius.circular(40.0),
      child: new Container(
        height: 80.0,
        width: 80.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: new Center(
          child: label,
        ),
      ),
    );
  }

  /// sets number into text fields n performs
  ///  validation after last number is entered
  void _setCurrentDigit(int i) async {
    setState(() {
      _currentDigit = i;
      int currentField;
      for (currentField = 0; currentField < widget.otpLength; currentField++) {
        if (otpValues[currentField] == null) {
          otpValues[currentField] = _currentDigit;
          break;
        }
      }
      if (currentField == widget.otpLength - 1) {
        showLoadingButton = true;
        String otp = otpValues.join();
        widget.validateOtp(otp).then((value) {
          showLoadingButton = false;
          if (value == null) {
            widget.routeCallback(context);
          } else if (value.isNotEmpty) {
            showToast(context, value);
            clearOtp();
          }
        });
      }
    });
  }

  ///to clear otp when error occurs
  void clearOtp() {
    otpValues = List<int>.filled(widget.otpLength, null, growable: false);
    setState(() {});
  }

  ///to show error  message
  showToast(BuildContext context, String msg) {
    Widget toast = Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: Colors.grey.shade500,
          ),
          child: Center(
              child: Text(
            msg,
            maxLines: 3,
            textAlign: TextAlign.center,
          )),
        ));
    FlutterToast(context).showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: Duration(seconds: 2),
    );
  }
}
