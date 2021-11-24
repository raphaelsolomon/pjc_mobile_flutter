import 'dart:io';
import 'package:email_launcher/email_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/models/Accountmanager.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountManagerInfo extends StatelessWidget {
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
                          child: FittedBox(
                            child: Text(
                              'Account Manager Info'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 16.0, color: Color(0xFF0272BA)),
                            ),
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
                    height: 20.0,
                  ),
                  FutureBuilder<Customer>(
                    builder: (ctx, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 50.0,
                              backgroundImage: AssetImage(
                                'assets/logo.png',
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('${snapshot.data.staffUname}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 26.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 15.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _details(
                                      icon: FontAwesome.user_circle,
                                      title:
                                          '${snapshot.data.staffFname} ${snapshot.data.staffLname}'),
                                  InkWell(
                                    child: _details(
                                        icon: Icons.mail_outline,
                                        title: '${snapshot.data.staffEmail}'),
                                    onTap: () => Platform.isAndroid
                                        ? _launchEmail(snapshot.data.staffEmail)
                                        : _launchURL(snapshot.data.staffEmail),
                                  ),
                                  InkWell(
                                      child: _details(
                                          icon: Icons.phone_android,
                                          title: '${snapshot.data.staffPhone}'),
                                      onTap: () => _launchDial(
                                          snapshot.data.staffPhone)),
                                ],
                              ),
                            )
                          ],
                        );
                      }
                      return Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    future: Provider.of<Controller>(context, listen: false)
                        .getAccountOfficer(
                            Provider.of<Controller>(context, listen: true)
                                .clientID),
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Widget _details({icon, title}) => Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9.0),
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

  void _launchURL(email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: '$email',
      query: 'subject=App Feedback&body=App Version 3.23',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  void _launchEmail(emailAddress) async {
    Email email = Email(to: ['$emailAddress'], subject: 'Pjc Empire', body: '');
    await EmailLauncher.launch(email);
  }

  void _launchDial(number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  // _makePhoneCall(String url) async {
  //   if (await canLaunch(url)) {
  //     await launch(url);
  //   } else {
  //     throw 'Could not launch $url';
  //   }
  // }
}
