import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class LogisticDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/log1.jpeg',
                        width: double.infinity,
                        height: 400,
                        fit: BoxFit.cover,
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
                                    color: Colors.white,
                                  ),
                                  onPressed: () => Get.back()),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                '',
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
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 10.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               estateData.type.toUpperCase(),
                  //               style: GoogleFonts.montserrat(
                  //                   color: Colors.black,
                  //                   fontSize: 19.0,
                  //                   fontWeight: FontWeight.w500),
                  //             ),
                  //             Text(
                  //               '\#${estateData.price}',
                  //               style: GoogleFonts.montserrat(
                  //                   color: Color(0xFF0272BA),
                  //                   fontSize: 14.0,
                  //                   fontWeight: FontWeight.w500),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: 7.0,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 6.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             estateData.location == 'Negotiable'
                  //                 ? Text(
                  //                     'About This Car',
                  //                     style: GoogleFonts.montserrat(
                  //                         color: Colors.black,
                  //                         fontSize: 14.0,
                  //                         fontWeight: FontWeight.w500),
                  //                   )
                  //                 : Text(
                  //                     estateData.location,
                  //                     style: GoogleFonts.montserrat(
                  //                         color: Colors.black,
                  //                         fontSize: 14.0,
                  //                         fontWeight: FontWeight.normal),
                  //                   ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 7.0,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'We  offer our clients active and flexible service providing a safe and  fast delivery services across  the country at all times',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                      'View Pictures',
                      style: GoogleFonts.montserrat(
                          fontSize: 14.5, fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 15.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(
                              2,
                              (index) => _imagesView(
                                  ['assets/log2.jpeg', 'assets/log3.jpeg'],
                                  index))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: MaterialButton(
                      onPressed: () => _launchWhatsappRealEstate(),
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Color(0xFF0272BA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      textColor: Colors.white,
                      child: Text(
                        'Make Enquiry',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  _launchWhatsappRealEstate() async {
    const url = "https://wa.me/message/3G5L2I7XN7H7H1";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget _imagesView(data, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.asset(
            data[index],
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
          ),
        ),
      );

  Widget _imagesCarViews() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(
            'https://images.livemint.com/img/2019/08/20/600x338/342245622_0-8_1566328822192_1566328836735.jpg',
            width: 90.0,
            height: 90.0,
            fit: BoxFit.cover,
          ),
        ),
      );
}
