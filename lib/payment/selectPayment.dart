import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';
import 'package:clipboard/clipboard.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectPayment extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
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
                          'Bank Transfer',
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
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF0272BA).withOpacity(.4),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 9.0),
                        child: Text(
                          'Note: Bank transfer might take up to 24 hours for confirmation',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 17.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                'Account Details',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    fontSize: 15,
                                    color: Color(0xFF0272BA),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            customRow('Bank Name', 'Polaris Bank',
                                FontAwesome.bank, Colors.black, null, context),
                            customRow('Account Name', 'Pjc Empire',
                                FontAwesome.user, Colors.black, null, context),
                            customRow(
                                'Account Number',
                                '4091356904',
                                FontAwesome.sort_numeric_asc,
                                Color(0xFF0272BA),
                                FontAwesome.copy,
                                context),
                            customRow(
                                'Description',
                                'investment_' +
                                    Provider.of<Controller>(context,
                                            listen: true)
                                        .completeName,
                                FontAwesome.sort_amount_desc,
                                Colors.black,
                                null,
                                context)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'click on the button below to send proof of payment',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Color(0xFF0272BA),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: MaterialButton(
                    onPressed: () => _launchWhatsapplogistics(),
                    height: 50.0,
                    color: Color(0xFF0272BA),
                    textColor: Colors.white,
                    minWidth: MediaQuery.of(context).size.width,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                    child: Text(
                      'Proceed',
                      style: GoogleFonts.montserrat(fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  _launchWhatsapplogistics() async {
    const url = "https://wa.me/message/PTDXECEYU3HBC1";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget customRow(title, subtitle, icon, color, icons, context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 20,
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          color: color,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    InkWell(
                      onTap: () => FlutterClipboard.copy(subtitle)
                          .then((value) => Toast.show('Copied!!!', context)),
                      child: Icon(
                        icons,
                        color: color,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      );
}
