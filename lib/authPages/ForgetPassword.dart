import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  final _amountController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 16,
                            ),
                            onPressed: () => Get.back()),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          'Forget Password'.toUpperCase(),
                          style: GoogleFonts.montserrat(
                              fontSize: 16.0, color: Color(0xFF0272BA)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          icon: Icon(
                            null,
                            size: 16,
                          ),
                          onPressed: () {}),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 110.0,
                        ),
                        Text(
                          'Enter the email address associated\n with your account',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        _inputText(
                            ctl: _amountController,
                            labelText: 'Enter your email address'),
                        SizedBox(
                          height: 80.0,
                        ),
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
                                      .forgetPassword(
                                          _amountController.text.trim()),
                                  height: 42.0,
                                  color: Color(0xFF0272BA),
                                  textColor: Colors.white,
                                  minWidth: MediaQuery.of(context).size.width,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.0)),
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  Widget _inputText({ctl, labelText}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.0,
              child: TextFormField(
                controller: ctl,
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14.0, vertical: 5.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF0272BA)),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      );
}
