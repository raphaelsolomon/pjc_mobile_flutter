import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Agric extends StatelessWidget {
  final String type;

  Agric(this.type);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  size: 16,
                                  color: Color(0xFF0272BA),
                                ),
                                onPressed: () => Get.back()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              type,
                              style: GoogleFonts.montserrat(
                                  fontSize: 17,
                                  color: Color(0xFF0272BA),
                                  fontWeight: FontWeight.w500),
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
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Image.asset(
                          type == 'Agriculture'
                              ? 'assets/agric.png'
                              : 'assets/airtime.png',
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                    ),
                    Text(
                      'Coming Soon',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          color: Color(0xFF0272BA),
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
          ),
        ),
      );
}
