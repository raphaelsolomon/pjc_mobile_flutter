import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pjc_empire/models/WalletListModel.dart';

class WalletListDetails extends StatelessWidget {
  final Customers recentElement;
  WalletListDetails(this.recentElement);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
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
                            '',
                            style: TextStyle(
                                fontSize: 22.0, color: Color(0xFF0272BA)),
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
                  Image.asset(
                    'assets/logo.png',
                    width: 80,
                    height: 80,
                  ),
                  Text(
                    'Transaction Details',
                    style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        color: Color(0xFF0272BA),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Text(
                                'Wallet Funding'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                '${recentElement.status}'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 16.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),

                        // SizedBox(
                        //   height: 14,
                        // ),
                        // Text(
                        //   'DATE/TIME',
                        //   style: GoogleFonts.montserrat(
                        //       fontSize: 18.0,
                        //       color: Colors.grey[350],
                        //       fontWeight: FontWeight.normal),
                        // ),
                        // SizedBox(
                        //   height: 16.0,
                        // ),
                        // Text(
                        //   'March 30 at 00:30am',
                        //   style: GoogleFonts.montserrat(
                        //       fontSize: 15.0,
                        //       color: Colors.grey,
                        //       fontWeight: FontWeight.normal),
                        // ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction date'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              '${recentElement.date}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 15.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Text(
                                'Amount'.toUpperCase(),
                                style: GoogleFonts.montserrat(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                'NGN ${NumberFormat().format(int.tryParse(recentElement.amount))}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12.0,
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 5.0),
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 65,
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
}
