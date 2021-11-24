import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pjc_empire/mainPages/WalletListDetails.dart';
import 'package:pjc_empire/models/WalletListModel.dart';
import 'package:provider/provider.dart';

class WalletList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<Controller>(context, listen: true).wallet;
    final counter = Provider.of<Controller>(context, listen: true).counterT;

    final tranSort =
        Provider.of<Controller>(context, listen: true).transortAllWallet;

    final listData =
        Provider.of<Controller>(context, listen: true).allWalletList == null
            ? []
            : Provider.of<Controller>(context, listen: true)
                .allWalletList
                .where((element) => tranSort[counter] == 'All Catergories'
                    ? element.status == 'Debit' ||
                        element.status == 'Pending Debit' ||
                        element.status == 'Success'
                    : element.status == tranSort[counter])
                .toList();

    return Scaffold(
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
                          'Transaction History',
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
                  height: 10.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Color(0xFF05B421).withOpacity(.7),
                      borderRadius: BorderRadius.circular(9.9)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Wallet Balance:',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 20),
                          ),
                          // CircleAvatar(
                          //   radius: 20.0,
                          //   backgroundColor: Colors.white,
                          //   child: Icon(MaterialIcons.trending_up,
                          //       size: 20, color: Colors.black),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        wallet.availBalance != null
                            ? 'NGN ${NumberFormat().format(wallet.availBalance)}.00'
                            : 'NGN 0.00',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 15.0),
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
                        width: 10.0,
                      ),
                      tranSort.length == 0
                          ? Container()
                          : tranSort.length == 1
                              ? _rowWithOutArrow(tranSort)
                              : _rowWithArrow(tranSort, context)
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 0.2,
                  color: Colors.grey,
                ),
                ListView.builder(
                  itemBuilder: (ctx, index) => _listHistory(listData[index]),
                  itemCount: listData == null ? 0 : listData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listHistory(Customers allWalletList) => InkWell(
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
                      backgroundColor: allWalletList.status == 'Success'
                          ? Color(0xFF05B421).withOpacity(.5)
                          : allWalletList.status == 'Pending Debit'
                              ? Colors.orange.withOpacity(.5)
                              : Color(0xFFF90404).withOpacity(.5),
                      radius: 20.0,
                      child: Text(
                        'I',
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
                                    fontSize: 14.5, color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text('${allWalletList.date}',
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
                        'NGN ${NumberFormat().format(int.tryParse(allWalletList.amount))}.00',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text('${allWalletList.status}',
                          style: GoogleFonts.montserrat(
                              fontSize: 12.2,
                              color: allWalletList.status == 'Success'
                                  ? Color(0xFF05B421).withOpacity(.5)
                                  : allWalletList.status == 'Pending Debit'
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
      onTap: () => Get.to(() => WalletListDetails(allWalletList)));

  Widget _rowWithArrow(List<String> tranSort, context) => Row(
        children: [
          FittedBox(
            child: Text(
              'sort by:',
              style: GoogleFonts.montserrat(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 9.0, top: 4.0, bottom: 4.0, right: 9.0),
            margin: const EdgeInsets.only(left: 9.0),
            decoration: BoxDecoration(
                color: Color(0xFF0272BA).withOpacity(.3),
                borderRadius: BorderRadius.circular(8.9)),
            child: Row(
              children: [
                Text(
                  tranSort[
                      Provider.of<Controller>(context, listen: true).counterT],
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
                                .updateSortTransIncrement(),
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
                                .updateSortTransDecrement(),
                        child: Transform.rotate(
                          angle: 33,
                          child: Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 10.0,
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

  Widget _rowWithOutArrow(List<String> tranSort) => Row(
        children: [
          FittedBox(
            child: Text(
              'sort by:',
              style: GoogleFonts.montserrat(fontSize: 14.0),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 9.0, top: 4.0, bottom: 4.0, right: 9.0),
            margin: const EdgeInsets.only(left: 9.0),
            decoration: BoxDecoration(
                color: Color(0xFF0272BA).withOpacity(.3),
                borderRadius: BorderRadius.circular(8.9)),
            child: Row(
              children: [
                Text(
                  '${tranSort[0]}',
                  style: GoogleFonts.montserrat(
                      fontSize: 10.5, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      );
}
