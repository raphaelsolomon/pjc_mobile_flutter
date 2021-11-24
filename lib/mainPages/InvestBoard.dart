import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

import 'Investment.dart';
import 'TransactionDetails.dart';

class InvestBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tranSort = Provider.of<Controller>(context, listen: true).transort;
    final counter = Provider.of<Controller>(context, listen: true).counterIn;
    final data =
        Provider.of<Controller>(context, listen: true).customerHistory == null
            ? []
            : Provider.of<Controller>(context, listen: true)
                .customerHistory
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

    return Scaffold(
      resizeToAvoidBottomInset: true,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0, bottom: 15.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => Get.to(() => Investment()),
                ),
              ),
            ),
            Align(
              child: Text('add Investment',
                  style: GoogleFonts.montserrat(
                      fontSize: 11,
                      color: Color(0xFF0272BA),
                      fontWeight: FontWeight.w500)),
              alignment: Alignment.bottomRight,
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.0,
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
                            'Investment',
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
                  _dashboardData(context, wallet, tranSort, counter, data)
                ]),
          ),
        ),
      ),
    );
  }

  Widget _dashboardData(context, wallet, tranSort, counter, data) => Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF007BFF).withOpacity(.7),
                      borderRadius: BorderRadius.circular(9.9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Investment:',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 20),
                          ),
                          CircleAvatar(
                            radius: 17.0,
                            backgroundColor: Colors.white,
                            child: Icon(MaterialIcons.trending_up,
                                size: 20, color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        wallet != null
                            ? wallet.totalInvest == null
                                ? 'NGN 0.00'
                                : 'NGN ${NumberFormat().format(int.tryParse(wallet.totalInvest))}'
                            : 'NGN 0.00',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                onTap: () => wallet != null
                    ? Provider.of<Controller>(context, listen: false)
                        .changeDashBoardIndex(1)
                    : null,
              ),
              // InkWell(
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(
              //         horizontal: 18.0, vertical: 8.0),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         Text('New Investment',
              //             style: GoogleFonts.montserrat(
              //                 color: Color(0xFF0272BA),
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.w500)),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 4.0, right: 4.0),
              //           child: Icon(
              //             Icons.add_circle_outline,
              //             size: 20.0,
              //             color: Color(0xFF0272BA),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              //   onTap: () => Get.to(() => Investment()),
              // ),
            ],
          ),

          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FittedBox(
                  child: Text(
                    'Transaction History',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.0, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                tranSort.length == 0
                    ? Container()
                    : tranSort.length == 1
                        ? _rowWithOutArrow(tranSort)
                        : _rowWithArrow(tranSort, context, counter)
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.2,
            color: Colors.grey,
          ),
          //-------------------------------------------------------------------
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) => _listHistory(data[index]),
            itemCount: data == null ? 0 : data.length,
          )
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
                          'NGN ${NumberFormat().format(int.tryParse(wallet.amount))}',
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

  Widget _rowWithArrow(tranSort, context, counter) => Row(
        children: [
          FittedBox(
            child: Text(
              'sort by:',
              style: GoogleFonts.montserrat(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 9.0, top: 3.0, bottom: 3.0, right: 9.0),
            margin: const EdgeInsets.only(left: 9.0),
            decoration: BoxDecoration(
                color: Color(0xFF0272BA).withOpacity(.3),
                borderRadius: BorderRadius.circular(8.9)),
            child: Row(
              children: [
                Text(
                  tranSort[counter],
                  style: GoogleFonts.montserrat(
                      fontSize: 10.5, fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 13.0, right: 8.0),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () =>
                            Provider.of<Controller>(context, listen: false)
                                .updateSortIncrement(),
                        child: Transform.rotate(
                          angle: 55,
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 10.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Provider.of<Controller>(context, listen: false)
                                .updateSortDecrement(),
                        child: Transform.rotate(
                          angle: 33,
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 13.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      );

  Widget _rowWithOutArrow(tranSort) => Row(
        children: [
          FittedBox(
            child: Text(
              'sort by:',
              style: GoogleFonts.montserrat(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 9.0, top: 6.0, bottom: 6.0, right: 9.0),
            margin: const EdgeInsets.only(left: 9.0),
            decoration: BoxDecoration(
                color: Color(0xFF0272BA).withOpacity(.3),
                borderRadius: BorderRadius.circular(8.9)),
            child: Row(
              children: [
                Text(
                  tranSort[0],
                  style: GoogleFonts.montserrat(
                      fontSize: 13.5, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      );
}
