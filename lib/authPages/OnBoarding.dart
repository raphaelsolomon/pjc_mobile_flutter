import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/authPages/SelectPage.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(Provider.of<Controller>(context, listen: true).pageIndex);
    Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: orientation == Orientation.portrait
            ? Column(
                children: [
                  Expanded(
                      child: PageView(
                    onPageChanged: (value) =>
                        Provider.of<Controller>(context, listen: false)
                            .changePageIndex(value),
                    children: [
                      Image.asset(
                        'assets/board_.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/boarding_2.png',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/boarding_3.png',
                        fit: BoxFit.cover,
                      )
                    ],
                  )),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: Provider.of<Controller>(context,
                                                  listen: true)
                                              .pageIndex ==
                                          0
                                      ? 18.0
                                      : 5.0,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Provider.of<Controller>(context,
                                                      listen: true)
                                                  .pageIndex ==
                                              0
                                          ? Color(0xFF0272BA)
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Container(
                                  width: Provider.of<Controller>(context,
                                                  listen: true)
                                              .pageIndex ==
                                          1
                                      ? 18.0
                                      : 5.0,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Provider.of<Controller>(context,
                                                      listen: true)
                                                  .pageIndex ==
                                              1
                                          ? Color(0xFF0272BA)
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                                SizedBox(
                                  width: 3.0,
                                ),
                                Container(
                                  width: Provider.of<Controller>(context,
                                                  listen: true)
                                              .pageIndex ==
                                          2
                                      ? 18.0
                                      : 5.0,
                                  height: 5,
                                  decoration: BoxDecoration(
                                      color: Provider.of<Controller>(context,
                                                      listen: true)
                                                  .pageIndex ==
                                              2
                                          ? Color(0xFF0272BA)
                                          : Colors.grey[400],
                                      borderRadius: BorderRadius.circular(12)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          Provider.of<Controller>(context, listen: true).title[
                              Provider.of<Controller>(context, listen: true)
                                  .pageIndex],
                          style:
                              TextStyle(color: Color(0xFF0272BA), fontSize: 20),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            Provider.of<Controller>(context, listen: true)
                                    .subTitle[
                                Provider.of<Controller>(context, listen: true)
                                    .pageIndex],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF0272BA), fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              height: 40,
                              color: Color(0xFF0272BA),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0)),
                              onPressed: () => Get.offUntil(
                                  GetPageRoute(page: () => SelectState()),
                                  (route) => false),
                              child: Text('Skip',
                                  style: GoogleFonts.montserrat(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400,
                                  )),
                            )),
                        SizedBox(
                          height: 25.0,
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Container(
                child: Row(
                  children: [
                    Expanded(
                        child: PageView(
                      onPageChanged: (value) =>
                          Provider.of<Controller>(context, listen: false)
                              .changePageIndex(value),
                      children: [
                        Image.asset(
                          'assets/board_.png',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/boarding_2.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'assets/boarding_3.jpg',
                          fit: BoxFit.cover,
                        )
                      ],
                    )),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Provider.of<Controller>(context, listen: true)
                                            .pageIndex ==
                                        0
                                    ? Row(
                                        children: [
                                          Container(
                                            width: 18.0,
                                            height: 5,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF0272BA),
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                          ),
                                          SizedBox(
                                            width: 3.0,
                                          ),
                                          Container(
                                            width: 5,
                                            height: 5,
                                            decoration: BoxDecoration(
                                                color: Colors.grey[400],
                                                shape: BoxShape.circle),
                                          ),
                                        ],
                                      )
                                    : Provider.of<Controller>(context,
                                                    listen: true)
                                                .pageIndex ==
                                            1
                                        ? Row(
                                            children: [
                                              Container(
                                                width: 5,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 3.0,
                                              ),
                                              Container(
                                                width: 18.0,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF0272BA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ],
                                          )
                                        : Row(
                                            children: [
                                              Container(
                                                width: 5,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[400],
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 3.0,
                                              ),
                                              Container(
                                                width: 18.0,
                                                height: 5,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF0272BA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                              ),
                                            ],
                                          ),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            FittedBox(
                              child: Text(
                                'Become A ProFessionl Trader',
                                style: GoogleFonts.montserrat(
                                    color: Color(0xFF0272BA), fontSize: 20),
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            FittedBox(
                              child: Text(
                                'Move from zero to hero\nwith forex trading, Learn at PC\nacademy',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    color: Color(0xFF0272BA), fontSize: 15),
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18.0),
                                child: ElevatedButton(
                                    onPressed: () => Get.offUntil(
                                        GetPageRoute(page: () => SelectState()),
                                        (route) => false),
                                    child: Text('Skip',
                                        style: GoogleFonts.montserrat(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w400,
                                        )))),
                            SizedBox(
                              height: 25.0,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ));
  }
}
// Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   TextButton(
//                                       onPressed: () => Get.offUntil(
//                                           GetPageRoute(
//                                               page: () => SelectState()),
//                                           (route) => false),
//                                       child: Text('Skip',
//                                           style: GoogleFonts.montserrat(
//                                             fontSize: 15.0,
//                                             fontWeight: FontWeight.w400,
//                                           ))),
//                                   GestureDetector(
//                                     onTap: () => null,
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       child: Icon(
//                                         Icons.arrow_forward_ios,
//                                         color: Color(0xFF0272BA),
//                                         size: 15.0,
//                                       ),
//                                       padding: const EdgeInsets.all(5.0),
//                                       decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           border: Border.all(
//                                               color: Color(0xFF0272BA),
//                                               width: 1.5)),
//                                     ),
//                                   ),
//                                 ],
//                               ),
