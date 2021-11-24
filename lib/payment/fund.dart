import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/mainPages/AddMoney.dart';
import 'package:pjc_empire/payment/selectPayment.dart';

class FundWall extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            color: Color(0xFF0272BA).withOpacity(.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          'Fund Wallet',
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
                  height: 80.0,
                ),
                Image.asset('assets/logo.png',
                    width: 100, height: 100, fit: BoxFit.contain),
                SizedBox(
                  height: 70.0,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          'select one of the options to fund your wallet',
                          style: GoogleFonts.montserrat(
                              fontSize: 11,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        InkWell(
                          onTap: () => Get.to(() => AddMoney()),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFF0272BA).withOpacity(.4),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: customRow(
                                'Instant Funding',
                                'fund your wallet instantly',
                                FontAwesome.money,
                                Colors.black,
                                null),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        InkWell(
                          onTap: () => Get.to(() => SelectPayment()),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Color(0xFF0272BA).withOpacity(.4),
                                borderRadius: BorderRadius.circular(10.0)),
                            child: customRow(
                                'Bank Transfer',
                                'Transfer using internet banking or bank app',
                                FontAwesome.bank,
                                Colors.black,
                                null),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget customRow(title, subtitle, icon, color, icons) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFF0272BA),
              child: Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 12.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                FittedBox(
                  child: Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: color,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
