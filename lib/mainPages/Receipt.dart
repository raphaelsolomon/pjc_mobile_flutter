import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/mainPages/DashBoard.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
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
                    'Thank you for investing with us',
                    style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        color: Color(0xFF0272BA),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$70,000.00',
                    style: GoogleFonts.montserrat(
                        fontSize: 24.0,
                        color: Color(0xFF0272BA),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Short term investment 25%',
                          style: GoogleFonts.montserrat(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          'DATE/TIME',
                          style: GoogleFonts.montserrat(
                              fontSize: 18.0,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 16.0,
                        ),
                        Text(
                          'March 30 at 00:30am',
                          style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Investment due date',
                          style: GoogleFonts.montserrat(
                              fontSize: 16.0,
                              color: Colors.grey[350],
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          '2022-02-03',
                          style: GoogleFonts.montserrat(
                              fontSize: 15.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 65,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 8.0),
                          child: MaterialButton(
                            onPressed: () => Get.to(() => DashBoard()),
                            height: 40.0,
                            color: Color(0xFF0272BA),
                            textColor: Colors.white,
                            minWidth: MediaQuery.of(context).size.width,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7.0)),
                            child: Text(
                              'Get Receipt',
                              style: GoogleFonts.montserrat(fontSize: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
