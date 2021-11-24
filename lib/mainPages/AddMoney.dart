import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

class AddMoney extends StatelessWidget {
  final _amountController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: 'NGN ');
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
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
                                color: Color(0xFF0272BA),
                                size: 16,
                              ),
                              onPressed: () => Get.back()),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            'Fund Wallet',
                            style: GoogleFonts.montserrat(
                                fontSize: 16.0,
                                color: Color(0xFF0272BA),
                                fontWeight: FontWeight.w400),
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
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _inputText(
                            ctl: _amountController,
                            label: 'Enter Amount to fund wallet',
                            labelText: 'Enter Amount',
                            input:
                                TextInputType.numberWithOptions(decimal: false),
                            obscure: false),
                        SizedBox(
                          height: 20.0,
                        ),
                        Provider.of<Controller>(context, listen: true).isLoading
                            ? Center(child: CircularProgressIndicator())
                            : MaterialButton(
                                onPressed: () => Provider.of<Controller>(
                                        context,
                                        listen: false)
                                    .handlePaymentInitialization(
                                        _amountController.numberValue.toInt(),
                                        context),
                                // onPressed: () => Provider.of<Controller>(
                                //         context,
                                //         listen: false)
                                //     .fundWallet(_amountController.text),
                                height: 40.0,
                                minWidth: MediaQuery.of(context).size.width,
                                color: Color(0xFF0272BA),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0)),
                                textColor: Colors.white,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _inputText({ctl, labelText, label, obscure, input}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                  fontSize: 15.5, fontWeight: FontWeight.w500),
            ),
            Container(
              height: 42.0,
              margin: const EdgeInsets.only(top: 10.0 - 5),
              child: TextFormField(
                controller: ctl,
                obscureText: obscure,
                style:
                    GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 14.0, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF0272BA)),
                  ),
                ),
                keyboardType: input,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      );
}
