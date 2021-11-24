import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'AirtimeRecharge.dart';

class BillPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            'Bill Payment',
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
                    height: 15.0,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    child: Card(
                      elevation: 2.0,
                      shadowColor: Color(0xFF9c9c9c),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Wrap(
                          runAlignment: WrapAlignment.center,
                          spacing: 30.0,
                          direction: Axis.horizontal,
                          children: [
                            InkWell(
                              onTap: () => Get.to(() => AirtimeRecharge()),
                              child: circularIcon(
                                  Color(0xFF7D0563).withOpacity(.7),
                                  Icons.wallet_membership,
                                  10.0,
                                  10.0,
                                  'Airtime & Data'),
                            ),
                            circularIcon(
                                Color(0xFF08DAB4).withOpacity(.7),
                                Icons.wallet_membership,
                                10.0,
                                10.0,
                                'Utilities'),
                            circularIcon(Color(0xFF09F904).withOpacity(.7),
                                Icons.trending_up, 10.0, 10.0, 'Television'),
                            circularIcon(
                                Color(0xFF0A17A7).withOpacity(.7),
                                Icons.wallet_membership,
                                10.0,
                                10.0,
                                'Tax Payment'),
                            circularIcon(Color(0xFF8C0E0E).withOpacity(.7),
                                Icons.motorcycle, 10.0, 20.0, 'School & Exam'),
                            circularIcon(
                                Color(0xFF4F87AA).withOpacity(.7),
                                MaterialIcons.school,
                                10.0,
                                20.0,
                                'Product \n& Services'),
                            circularIcon(
                                Color(0xFF007BFF).withOpacity(.7),
                                FontAwesome.leaf,
                                10.0,
                                20.0,
                                'Financial\n Services'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget circularIcon(color, icons, double bottom, double top, label) =>
      Padding(
        padding: EdgeInsets.only(top: top, bottom: bottom),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 20.0,
              child: Icon(
                icons,
                color: Colors.white,
                size: 17.0,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            FittedBox(
              child: Text(label,
                  style: GoogleFonts.montserrat(
                      color: Colors.black,
                      fontSize: 10.5,
                      fontWeight: FontWeight.normal)),
            )
          ],
        ),
      );
}
