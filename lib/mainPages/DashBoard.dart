import 'package:android_intent/android_intent.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/controller/DataController.dart';
import 'package:pjc_empire/controller/RectBlurPainter.dart';
import 'package:pjc_empire/mainPages/Agric.dart';
import 'package:pjc_empire/mainPages/AirtimeRecharge.dart';
import 'package:pjc_empire/mainPages/LogisticDetails.dart';
import 'package:pjc_empire/mainPages/Profile.dart';
import 'package:pjc_empire/mainPages/RealEstate.dart';
import 'package:pjc_empire/mainPages/TransactionDetails.dart';
import 'package:pjc_empire/mainPages/WebViewUI.dart';
import 'package:pjc_empire/mainPages/Withdrawal.dart';
import 'package:pjc_empire/mainPages/walletList.dart';
import 'package:pjc_empire/payment/fund.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:url_launcher/url_launcher.dart';

import 'InvestBoard.dart';

class DashBoard extends StatelessWidget {
  final scaffold = GlobalKey<ScaffoldState>();
  final _refreshController = RefreshController(initialRefresh: false);
  final dataControl = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    final tranSort =
        Provider.of<Controller>(context, listen: true).transortWallet;
    final counter = Provider.of<Controller>(context, listen: true).counter;
    final data =
        Provider.of<Controller>(context, listen: true).recentWallet == null
            ? []
            : Provider.of<Controller>(context, listen: true)
                .recentWallet
                .where((element) => tranSort[counter] == null
                    ? element.status == 'Debit' ||
                        element.status == 'Pending Debit' ||
                        element.status == 'Success'
                    : tranSort[counter] == 'All Catergories'
                        ? element.status == 'Debit' ||
                            element.status == 'Pending Debit' ||
                            element.status == 'Success'
                        : element.status == tranSort[counter])
                .toList();

    final wallet = Provider.of<Controller>(context, listen: true).wallet;

    final user = Provider.of<Controller>(context, listen: true).myProfile;

    getContacts(context);

    return WillPopScope(
      onWillPop: () async {
        if (Provider.of<Controller>(context, listen: false).dashBoardPage ==
            1) {
          Provider.of<Controller>(context, listen: false)
              .changeDashBoardIndex(0);
          return false;
        }
        return true;
      },
      child: Scaffold(
          key: scaffold,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: FloatingActionButton(
              child: Icon(Icons.trending_up),
              onPressed: () => Get.to(() => InvestBoard()),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // drawer: user == null ? null : Drawers(scaffold),
          bottomNavigationBar: BottomNavigationBar(items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(null), label: 'Add Investment'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ], onTap: (position) => manageClick(position)),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF0272BA),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                    ),
                    child: SafeArea(
                      child: SmartRefresher(
                        enablePullDown: true,
                        enablePullUp: false,
                        physics: NeverScrollableScrollPhysics(),
                        header: MaterialClassicHeader(),
                        controller: _refreshController,
                        onRefresh: () =>
                            Provider.of<Controller>(context, listen: false)
                                .onRefreshData(_refreshController),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              //---------------------------
                              _header(context, user, wallet),
                              //---------------------------
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0),
                    child: Text(
                      'Services',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
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
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () => Get.to(() => WalletList()),
                                  child: circularIcon(
                                      Color(0xFF05B421).withOpacity(0.7),
                                      Icons.history,
                                      10.0,
                                      10.0,
                                      'Transaction Hist.'),
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => WithDrawal()),
                                  child: circularIcon(
                                      Color(0xFFFFDB20).withOpacity(.7),
                                      Icons.wallet_membership,
                                      10.0,
                                      10.0,
                                      'Withdraw'),
                                ),
                                InkWell(
                                  onTap: () => Get.to(() => FundWall()),
                                  child: circularIcon(
                                      Color(0xFF007BFF).withOpacity(.7),
                                      FontAwesome.money,
                                      10.0,
                                      10.0,
                                      'Fund Wallet'),
                                ),
                                InkWell(
                                  onTap: () =>
                                      Get.to(() => RealEstate('Real Estate')),
                                  child: circularIcon(
                                      Color(0xFF0A17A7).withOpacity(.7),
                                      Icons.house,
                                      10.0,
                                      10.0,
                                      'Real Estate'),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 0.0, right: 5.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => LogisticDetails()),
                                    child: circularIcon(
                                        Color(0xFF540BEE).withOpacity(.8),
                                        Icons.motorcycle,
                                        10.0,
                                        10.0,
                                        '       Logistics    '),
                                  ),
                                  InkWell(
                                    // onTap: () => Platform.isAndroid
                                    //     ? _openLinkInGoogleChrome()
                                    //     : _launchURL(),
                                    onTap: () => Get.to(() => WebViewUI()),
                                    child: circularIcon(
                                        Color(0xFFF90404).withOpacity(.6),
                                        MaterialIcons.school,
                                        10.0,
                                        10.0,
                                        'Academy'),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => Agric('Agriculture')),
                                    child: circularIcon(
                                        Color(0xFF007BFF).withOpacity(.7),
                                        FontAwesome.leaf,
                                        10.0,
                                        10.0,
                                        'Agriculture'),
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        Get.to(() => RealEstate('Autos')),
                                    child: circularIcon(
                                        Color(0xFF8C0E0E).withOpacity(.7),
                                        FontAwesome.bus,
                                        10.0,
                                        10.0,
                                        'Pjc Autos'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0),
                    child: Text(
                      'Bill Payment',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Card(
                      elevation: 2.0,
                      shadowColor: Color(0xFF9c9c9c),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Get.to(() => AirtimeRecharge()),
                              child: circularIcon(
                                  Color(0xFF7D0563).withOpacity(0.7),
                                  Icons.money,
                                  10.0,
                                  10.0,
                                  'Airtime & Data'),
                            ),
                            InkWell(
                              onTap: () => Get.to(() => Agric('Utilities')),
                              child: circularIcon(
                                  Color(0xFF08DAB4).withOpacity(.7),
                                  MaterialIcons.payment,
                                  10.0,
                                  10.0,
                                  'Utilities'),
                            ),
                            InkWell(
                              onTap: () => Get.to(() => Agric("Television")),
                              child: circularIcon(
                                  Color(0xFF09F904).withOpacity(.7),
                                  FontAwesome.television,
                                  10.0,
                                  10.0,
                                  'Television'),
                            ),
                            InkWell(
                              //onTap: () => Get.to(() => Electricity('Power')),
                              onTap: () =>
                                  Get.to(() => Agric('Internet Payment')),
                              child: circularIcon(
                                  Color(0xFF4F87AA).withOpacity(.7),
                                  Icons.network_wifi,
                                  10.0,
                                  10.0,
                                  'Internet'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 20.0, bottom: 10.0),
                    child: Text(
                      'Transaction History',
                      style: GoogleFonts.montserrat(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 0.2,
                    color: Colors.grey,
                  ),
                  //-------------------------------------------------------------------
                  Container(
                    color: Colors.white,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (ctx, index) => _listHistory(data[index]),
                      itemCount: data == null ? 0 : data.length,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget circularIcon(color, icons, double bottom, double top, label) =>
      Padding(
        padding: EdgeInsets.only(top: top, bottom: bottom),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
              height: 4.0,
            ),
            Text(label,
                style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 10.5,
                    fontWeight: FontWeight.normal))
          ],
        ),
      );

  void getContacts(context) async {
    List<Contact> contactsList = [];
    Iterable<Contact> contacts =
        await ContactsService.getContacts(withThumbnails: false);
    contactsList.addAll(contacts);
    Provider.of<Controller>(context, listen: false).addContacts(contactsList);
  }

  _launchWhatsapplogistics() async {
    const url =
        "https://wa.me/09067618740?text=Hey buddy, try this super cool new app!";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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

  manageClick(int position) {
    if (position == 2) {
      Get.to(() => Profile());
    }
  }

  Widget _header(context, userDetails, wallet) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  userDetails != null
                      ? 'Hi, ${userDetails.firstname} ${userDetails.lastname}'
                      : 'Hi, ',
                  style:
                      GoogleFonts.montserrat(fontSize: 17, color: Colors.white),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wallet Ballance',
                    style: GoogleFonts.montserrat(
                        fontSize: 12.5, color: Colors.white),
                  ),
                  SizedBox(
                    height: 4.5,
                  ),
                  Row(
                    children: [
                      Provider.of<Controller>(context, listen: true)
                              .isMoneyHidden
                          // ? Padding(
                          //     padding: const EdgeInsets.only(left: 8.0),
                          //     child: CustomPaint(
                          //       foregroundPainter: RectBlurPainter(
                          //         rectWidth: 15,
                          //         blurSigma: 2.9,
                          //       ),
                          //       child: Text(
                          //         wallet != null
                          //             ? 'NGN ${NumberFormat().format(wallet.availBalance)}'
                          //             : 'NGN 0.00',
                          //         style: GoogleFonts.montserrat(
                          //             fontSize: 12.5, color: Colors.white),
                          //       ),
                          //     ),
                          //   )
                          ? Text(
                              wallet != null ? 'NGN xxxxx.xx' : 'NGN xxxxx.xx',
                              style: GoogleFonts.montserrat(
                                  fontSize: 16.5, color: Colors.white),
                            )
                          : Text(
                              wallet != null
                                  ? 'NGN ${NumberFormat().format(wallet.availBalance)}'
                                  : 'NGN 0.00',
                              style: GoogleFonts.montserrat(
                                  fontSize: 12.5, color: Colors.white),
                            ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: Provider.of<Controller>(context, listen: true)
                                    .isMoneyHidden
                                ? 25.0
                                : 10.0),
                        child: GestureDetector(
                          onTap: () {
                            if (Provider.of<Controller>(context, listen: false)
                                .isMoneyHidden) {
                              Provider.of<Controller>(context, listen: false)
                                  .hideMoney(false);
                            } else
                              Provider.of<Controller>(context, listen: false)
                                  .hideMoney(true);
                          },
                          child: Icon(
                            Provider.of<Controller>(context, listen: true)
                                    .isMoneyHidden
                                ? FontAwesome.eye_slash
                                : FontAwesome.eye,
                            color: Colors.white,
                            size: 17,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      );

  Widget _listHistory(wallet) => InkWell(
        onTap: () => Get.to(() => TransactionDetails(wallet)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, bottom: 9.0, top: 9.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: wallet.status == 'Success'
                            ? Color(0xFF05B421).withOpacity(.5)
                            : wallet.status == 'Pending Debit'
                                ? Colors.orange.withOpacity(.5)
                                : Color(0xFFF90404).withOpacity(.5),
                        radius: 20.0,
                        child: Text(
                          'W',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text('Wallet Funding',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14, color: Colors.black)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text('${wallet.date}',
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12.5, color: Colors.black45)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                          'NGN ${NumberFormat().format(int.tryParse(wallet.amount))}.00',
                          style: GoogleFonts.montserrat(
                              fontSize: 14, color: Colors.black)),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text('${wallet.status}',
                            style: GoogleFonts.montserrat(
                                fontSize: 12.2,
                                color: wallet.status == 'Success'
                                    ? Color(0xFF05B421).withOpacity(.5)
                                    : wallet.status == 'Pending Debit'
                                        ? Colors.orange.withOpacity(.5)
                                        : Color(0xFFF90404).withOpacity(.5))),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 2,
              color: Colors.grey.withOpacity(.4),
            ),
          ],
        ),
      );
}
