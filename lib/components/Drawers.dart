import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/About.dart';
import 'package:pjc_empire/mainPages/AccountmanagerInfo.dart';
import 'package:pjc_empire/mainPages/AddMoney.dart';
import 'package:pjc_empire/mainPages/Investment.dart';
import 'package:pjc_empire/mainPages/Profile.dart';
import 'package:pjc_empire/mainPages/Withdrawal.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class Drawers extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey;

  Drawers(this._globalKey);

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0,
                  color: Color(0xFF0272BA),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 40.0),
                          child: Container(
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
                                      ? Image.asset('assets/logo2.png',
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover)
                                      : Image.file(
                                          Provider.of<Controller>(context,
                                                  listen: true)
                                              .imagefile,
                                          width: 80.0,
                                          height: 80.0,
                                          fit: BoxFit.cover,
                                        ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                right: 20.0, bottom: 50.0),
                            child: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                                onPressed: () =>
                                    _globalKey.currentState.openEndDrawer())),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, bottom: 15.0),
                          child: Text(
                            '${Provider.of<Controller>(context).myProfile.firstname} ${Provider.of<Controller>(context).myProfile.lastname}',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 18.0),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                InkWell(
                    child: _widget(
                      icon: FontAwesome.dashboard,
                      title: 'Dashboard',
                    ),
                    onTap: () {
                      _globalKey.currentState.openEndDrawer();
                      Provider.of<Controller>(context, listen: false)
                          .changeDashBoardIndex(0);
                    }),
                InkWell(
                  child: _widget(
                    icon: FontAwesome.user_circle,
                    title: 'Profile',
                  ),
                  onTap: () => Get.to(() => Profile()),
                ),
                InkWell(
                    child: _widget(
                      icon: Ionicons.ios_wallet,
                      title: 'Fund Wallet',
                    ),
                    onTap: () {
                      _globalKey.currentState.openEndDrawer();
                      Get.to(() => AddMoney());
                    }),
                InkWell(
                  child: _widget(
                    icon: MaterialIcons.trending_up,
                    title: 'Invest',
                  ),
                  onTap: () => Get.to(() => Investment()),
                ),
                InkWell(
                  child: _widget(icon: Ionicons.ios_card, title: 'Withdraw'),
                  onTap: () => Get.to(() => WithDrawal()),
                ),
                InkWell(
                    child: _widget(
                        icon: MaterialIcons.school, title: 'Pjc Academy'),
                    onTap: () => Platform.isAndroid
                        ? _openLinkInGoogleChrome()
                        : _launchURL()),
                InkWell(
                  child: _widget(
                    icon: MaterialIcons.home,
                    title: 'Real Estate',
                  ),
                  onTap: () => Platform.isAndroid
                      ? _openLinkInGoogleChromeEstate()
                      : _launchURLEstate(),
                ),
                InkWell(
                  child: _widget(
                    icon: FontAwesome.motorcycle,
                    title: 'Pjc Riders',
                  ),
                  onTap: () => Toast.show('Coming soon...', context,
                      duration: Toast.LENGTH_SHORT,
                      gravity: Toast.BOTTOM,
                      textColor: Colors.white,
                      backgroundColor: Color(0xff0272BA)),
                ),
                InkWell(
                  child: _widget(
                    icon: FontAwesome.user_secret,
                    title: 'Contact (Account Manager)',
                  ),
                  onTap: () => Get.to(() => AccountManagerInfo()),
                ),
                InkWell(
                  child: _widget(
                    icon: FontAwesome.question,
                    title: 'FAQ',
                  ),
                  onTap: () => Get.to(() => About()),
                ),
                InkWell(
                  child: _widget(
                    icon: Ionicons.ios_log_out,
                    title: 'Logout',
                  ),
                  onTap: () =>
                      Provider.of<Controller>(context, listen: false).signOut(),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          Platform.isIOS
                              ? _launchURLContact()
                              : _openLinkInGoogleChromeContact();
                        },
                        backgroundColor: Color(0xff0272BA),
                        child: Icon(FontAwesome.commenting_o),
                      ),
                      SizedBox(
                        height: 9.0,
                      ),
                      Text(
                        'Chat with us',
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: Color(0xFF0272BA)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      );
  void _launchURLContact() async =>
      await canLaunch('https://pjcempire.com/contact')
          ? await launch('https://pjcempire.com/contact')
          : throw 'Could not launch ';

  void _openLinkInGoogleChromeContact() {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('https://pjcempire.com/contact'),
        package: 'com.android.chrome');
    intent.launch();
  }

  //dataController.chargeCard(
  //context, 'phoenixk54gmail.com', dataController.type)
  void _launchURL() async => await canLaunch('https://academy.pjcempire.com/')
      ? await launch('https://academy.pjcempire.com/')
      : throw 'Could not launch ';

  void _openLinkInGoogleChrome() {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('https://academy.pjcempire.com/'),
        package: 'com.android.chrome');
    intent.launch();
  }

  void _launchURLEstate() async =>
      await canLaunch('https://realestate.pjcempire.com/')
          ? await launch('https://realestate.pjcempire.com/')
          : throw 'Could not launch ';

  void _openLinkInGoogleChromeEstate() {
    final AndroidIntent intent = AndroidIntent(
        action: 'action_view',
        data: Uri.encodeFull('https://realestate.pjcempire.com/'),
        package: 'com.android.chrome');
    intent.launch();
  }

  Widget _widget({icon, title}) => Container(
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
              child: FittedBox(
                child: Text(
                  '$title',
                  style: GoogleFonts.montserrat(
                      fontSize: 16.0, color: Colors.black),
                ),
              ),
            )
          ],
        ),
      );
}
/*Get.defaultDialog(
                        onWillPop: () async {
                          Get.back();
                          return true;
                        },
                        title: 'Payment Amount',
                        radius: 9.0,
                        content: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  height: 42.0,
                                  child: TextFormField(
                                    controller: _amountController,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15.5, color: Colors.grey),
                                    decoration: InputDecoration(
                                      hintText: '20,000',
                                      hintStyle: GoogleFonts.montserrat(
                                          fontSize: 14.5, color: Colors.grey),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 5.0),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xFFF2F2F2)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide: BorderSide(
                                            color: Color(0xFFF2F2F2)),
                                      ),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: false),
                                    onSaved: (value) {},
                                  ),
                                ),
                                RaisedButton(
                                  color: Color(0xFF0272BA),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6.0)),
                                  child: Text(
                                    'Make Payment',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  textColor: Colors.white,
                                  onPressed: () => dataController.chargeCard(
                                      _amountController.text,
                                      _context,
                                      'phoenixk54@gmail.com',
                                      dataController.type),
                                ),
                              ],
                            ),
                          ),
                        ));
                  */
