import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/controller/DataController.dart';
import 'package:pjc_empire/mainPages/Investment.dart';
import 'package:pjc_empire/mainPages/InvestmentDetails.dart';
import 'package:pjc_empire/models/InvestmentHistory.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Transactions extends StatelessWidget {
  final DataController dataControl;
  Transactions(this.dataControl);

  @override
  Widget build(BuildContext context) {
    final wallet = Provider.of<Controller>(context, listen: true).wallet;
    final tranSort = Provider.of<Controller>(context, listen: true).transort;
    final counter = Provider.of<Controller>(context, listen: true).counterIn;
    final data =
        Provider.of<Controller>(context, listen: true).customerHistory == null
            ? []
            : Provider.of<Controller>(context, listen: true)
                .customerHistory
                .where((element) => tranSort[counter] == 'All Catergories'
                    ? element.status == 'Active' ||
                        element.status == '' ||
                        element.status == ''
                    : element.status == tranSort[counter])
                .toList();

    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20.0),
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
          decoration: BoxDecoration(
              color: Colors.green[400],
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
                    radius: 20.0,
                    backgroundColor: Colors.white,
                    child: Icon(MaterialIcons.trending_up,
                        size: 20, color: Colors.black),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                wallet.totalInvest != null
                    ? 'NGN ${NumberFormat().format(int.tryParse(wallet.totalInvest))}'
                    : 'NGN 0.00',
                style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        InkWell(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('New Investment',
                    style: GoogleFonts.montserrat(
                        color: Color(0xFF0272BA),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                  child: Icon(
                    Icons.add_circle_outline,
                    size: 20.0,
                    color: Color(0xFF0272BA),
                  ),
                )
              ],
            ),
          ),
          onTap: () => Get.to(() => Investment()),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FittedBox(
                child: Text(
                  'Transaction History',
                  style: GoogleFonts.montserrat(fontSize: 16.0),
                ),
              ),
              SizedBox(
                width: 7.0,
              ),
              tranSort.length == 0
                  ? Container()
                  : tranSort.length == 1
                      ? _rowWithOutArrow(tranSort, counter)
                      : _rowWithArrow(tranSort, context, counter)
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 0.2,
          color: Colors.grey,
        ),
        ListView.builder(
          itemBuilder: (ctx, index) =>
              _listHistory(data[index], wallet.totalInvest),
          itemCount: data == null ? 0 : data.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
        )
      ],
    );
  }

  Widget _listHistory(CustomerHistory customer, total) => InkWell(
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
                      backgroundColor: customer.status == 'Active'
                          ? Color(0xFF05B421).withOpacity(.5)
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
                            child: Text('${customer.description}',
                                style: GoogleFonts.montserrat(
                                    fontSize: 13.5, color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text('${customer.investDate}',
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
                        'NGN ${NumberFormat().format(int.tryParse(customer.amount))}',
                        style: GoogleFonts.montserrat(
                            fontSize: 13, color: Colors.black)),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text('${customer.status}',
                          style: GoogleFonts.montserrat(
                              fontSize: 12.2,
                              color: customer.status == 'Active'
                                  ? Color(0xFF05B421).withOpacity(.5)
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
      onTap: () => Get.to(InvestmentDetails(customer, total)));

  Widget _rowWithArrow(List<String> tranSort, context, counter) => Row(
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
                                .updateSortInvestIncrement(),
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
                                .updateSortInvestDecrement(),
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

  Widget _rowWithOutArrow(List<String> tranSort, counter) => Row(
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
                  '${tranSort[counter]}',
                  style: GoogleFonts.montserrat(
                      fontSize: 13.5, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      );
}
