import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pjc_empire/models/InvestmentHistory.dart';

class InvestmentDetails extends StatelessWidget {
  final CustomerHistory customerHistory;
  final String total;
  InvestmentDetails(this.customerHistory, this.total);

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
                    'Thank you for investing with us',
                    style: GoogleFonts.montserrat(
                        fontSize: 18.0,
                        color: Color(0xFF0272BA),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'NGN ${NumberFormat().format(int.tryParse(customerHistory.amount))}',
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
                                'Investment Type => ',
                                style: GoogleFonts.montserrat(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                customerHistory.duration,
                                style: GoogleFonts.montserrat(
                                    fontSize: 13.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Description =>',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              customerHistory.description.toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transaction date =>',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              customerHistory.investDate.toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ROI(%) =>',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              customerHistory.duration ==
                                      'Short term (25% on 25 working days)'
                                  ? '25%'
                                  : '80%',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ROI(#) =>',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              customerHistory.duration ==
                                      'Short term (25% on 25 working days)'
                                  ? 'NGN ${0.25 * int.tryParse(customerHistory.amount)}'
                                  : 'NGN ${0.8 * int.tryParse(customerHistory.amount)}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Payout =>',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              customerHistory.duration ==
                                      'Short term (25% on 25 working days)'
                                  ? 'NGN ${0.25 * int.tryParse(total)}'
                                  : 'NGN ${0.8 * int.tryParse(total)}',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.green,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payout Date =>',
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              customerHistory.payoutDeadline.date.toString(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 14.0,
                                  color: Colors.red.withOpacity(.5),
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 0.4,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 30.0,
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
