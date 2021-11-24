import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/EditProfile.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
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
                            'Profile'.toUpperCase(),
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
                    height: 5.0,
                  ),
                  Provider.of<Controller>(context).myProfile != null
                      ? Container(
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color(0xFFF2F2F2), width: 3.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child:
                                Provider.of<Controller>(context, listen: true)
                                            .imagefile ==
                                        null
                                    ? Image.asset('assets/logo.png',
                                        width: 90.0,
                                        height: 90.0,
                                        fit: BoxFit.cover)
                                    : Image.file(
                                        Provider.of<Controller>(context,
                                                listen: true)
                                            .imagefile,
                                        width: 90.0,
                                        height: 90.0,
                                        fit: BoxFit.cover,
                                      ),
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Provider.of<Controller>(context).myProfile != null
                      ? Text('${Provider.of<Controller>(context).sessionID}',
                          style: GoogleFonts.montserrat(
                              fontSize: 26.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                      : Container(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Provider.of<Controller>(context).myProfile != null
                      ? Text(
                          '${Provider.of<Controller>(context).myProfile.firstname} ${Provider.of<Controller>(context).myProfile.lastname}',
                          style: GoogleFonts.montserrat(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold))
                      : Container(),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90.0),
                    child: MaterialButton(
                      onPressed: () => Get.to(() => EditProfile()),
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Color(0xFF0272BA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      textColor: Colors.white,
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Provider.of<Controller>(context).myProfile != null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _details(
                                  icon: FontAwesome.user_circle,
                                  title:
                                      '${Provider.of<Controller>(context).myProfile.firstname} ${Provider.of<Controller>(context).myProfile.lastname}'),
                              _details(
                                  icon: Icons.mail_outline,
                                  title:
                                      '${Provider.of<Controller>(context).myProfile.email}'),
                              _details(
                                  icon: FontAwesome.user_circle,
                                  title:
                                      '${Provider.of<Controller>(context).sessionID}'),
                              _details(
                                  icon: Icons.phone_android,
                                  title:
                                      '${Provider.of<Controller>(context).myProfile.phone}'),
                              _details(
                                  icon: Icons.location_on,
                                  title:
                                      '${Provider.of<Controller>(context).myProfile.address}'),
                            ],
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 25.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90.0),
                    child: MaterialButton(
                      onPressed: () =>
                          Provider.of<Controller>(context, listen: false)
                              .signOut(),
                      height: 40.0,
                      minWidth: MediaQuery.of(context).size.width,
                      color: Color(0xFF0272BA),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      textColor: Colors.white,
                      child: Text(
                        'Logout',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _details({icon, title}) => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7.0),
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                '$title',
                style:
                    GoogleFonts.montserrat(fontSize: 14.0, color: Colors.black),
              ),
            )
          ],
        ),
      );

  // Widget _detailsCard({icon, title, card}) => Container(
  //       margin: const EdgeInsets.all(8.0),
  //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7.0),
  //       width: double.infinity,
  //       child: Row(
  //         children: [
  //           Icon(
  //             icon,
  //             size: 20,
  //           ),
  //           Padding(
  //             padding: const EdgeInsets.only(left: 15.0),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   '$title',
  //                   style: GoogleFonts.montserrat(
  //                       fontSize: 14.0, color: Colors.black),
  //                 ),
  //                 SizedBox(
  //                   height: 5.0,
  //                 ),
  //                 Text(
  //                   '$card',
  //                   style: GoogleFonts.montserrat(
  //                       fontSize: 14.0, color: Colors.black),
  //                 ),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     );
}
