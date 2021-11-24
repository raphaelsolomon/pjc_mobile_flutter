import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WithDrawalxxxxxxxxxx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
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
                          'WITHDRAWAL',
                          style:
                              TextStyle(fontSize: 19, color: Color(0xFF0272BA)),
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
                Container(
                  width: double.infinity,
                  height: 150.0,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, right: 16.0),
                          child: CircleAvatar(
                            radius: 12.0,
                            backgroundColor: Color(0xFF007BFF).withOpacity(.4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 16.0, right: 60.0),
                          child: CircleAvatar(
                            radius: 12.0,
                            backgroundColor: Color(0xFFC4C4C4).withOpacity(.4),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 26.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                bottomRight: Radius.circular(16)),
                            child: Container(
                              height: 30.0,
                              width: 20.0,
                              color: Color(0xFF007BFF).withOpacity(.8),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Color(0xFF0272BA),
                          radius: 50.0,
                          backgroundImage: AssetImage(
                            'assets/avatar.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 26.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                bottomLeft: Radius.circular(16)),
                            child: Container(
                              height: 30.0,
                              width: 20.0,
                              color: Color(0xFF007BFF).withOpacity(.8),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 16.0, left: 30.0),
                          child: CircleAvatar(
                            radius: 12.0,
                            backgroundColor: Color(0xFFC4C4C4).withOpacity(.4),
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Text('TOTAL BALANCE',
                                style: GoogleFonts.montserrat(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                            SizedBox(
                              height: 8.0,
                            ),
                            Text('\$200,000.00',
                                style: GoogleFonts.montserrat(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15.0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'how much do you want to withdraw',
                  style: GoogleFonts.montserrat(fontSize: 14.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    Container(
                      padding: const EdgeInsets.all(9.0),
                      margin: const EdgeInsets.symmetric(horizontal: 7.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF007BFF),
                      ),
                      child: Text('\$5,000.00',
                          style: GoogleFonts.montserrat(
                              fontSize: 14.0, color: Colors.white)),
                    ),
                    Icon(Icons.add),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22.0, vertical: 17.0),
                    margin: const EdgeInsets.only(top: 12.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF007BFF),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35.0),
                          topRight: Radius.circular(35.0),
                        )),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.39,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cards',
                            style: GoogleFonts.montserrat(
                                fontSize: 22.0, color: Colors.white),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
