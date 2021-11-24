import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/Agric.dart';
import 'package:pjc_empire/models/DataListModel.dart';
import 'package:provider/provider.dart';

class AirtimeRecharge extends StatelessWidget {
  final _phoneNumber = TextEditingController();
  final _amountNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Controller>(context, listen: true)
        .dataListItem
        .where((element) =>
            element.country == "NG" &&
            element.name.contains(
                Provider.of<Controller>(context, listen: true).networkType))
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Airtime and Data',
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
                  height: 40.0,
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: _inputText(
                            ctl: _phoneNumber,
                            labelText: '+234 900 000 0000',
                            label: 'Mobile Number',
                            obscure: false,
                            context: context),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    'Select Network Provider',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.5, fontWeight: FontWeight.normal),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 11.0),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      InkWell(
                        child: selectAirtime('assets/mtn.jpg'),
                        onTap: () =>
                            Provider.of<Controller>(context, listen: false)
                                .changeNetworkType("MTN"),
                      ),
                      InkWell(
                          child: selectAirtime('assets/airtel.jpg'),
                          onTap: () =>
                              Provider.of<Controller>(context, listen: false)
                                  .changeNetworkType("AIRTEL")),
                      InkWell(
                          child: selectAirtime('assets/glo.jpg'),
                          onTap: () =>
                              Provider.of<Controller>(context, listen: false)
                                  .changeNetworkType("GLO")),
                      InkWell(
                          child: selectAirtime('assets/9mobile.png'),
                          onTap: () =>
                              Provider.of<Controller>(context, listen: false)
                                  .changeNetworkType("9MOBILE")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            Provider.of<Controller>(context, listen: false)
                                .airtimeData(true),
                        child: Text(
                          'Airtime',
                          style: Provider.of<Controller>(context, listen: true)
                                  .isClicked
                              ? GoogleFonts.montserrat(
                                  fontSize: 14.5,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -5))
                                  ],
                                  fontWeight: FontWeight.normal,
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF0272BA),
                                  decorationThickness: 5,
                                  decorationStyle: TextDecorationStyle.solid)
                              : GoogleFonts.montserrat(
                                  fontSize: 14.5,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -5))
                                  ],
                                  fontWeight: FontWeight.normal,
                                  color: Colors.transparent,
                                  decoration: TextDecoration.none,
                                  decorationColor: Color(0xFF0272BA),
                                  decorationThickness: 0,
                                  decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      InkWell(
                        onTap: () =>
                            Provider.of<Controller>(context, listen: false)
                                .airtimeData(false),
                        child: Text(
                          'Data',
                          style: !Provider.of<Controller>(context, listen: true)
                                  .isClicked
                              ? GoogleFonts.montserrat(
                                  fontSize: 14.5,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -5))
                                  ],
                                  fontWeight: FontWeight.normal,
                                  color: Colors.transparent,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Color(0xFF0272BA),
                                  decorationThickness: 5,
                                  decorationStyle: TextDecorationStyle.solid)
                              : GoogleFonts.montserrat(
                                  fontSize: 14.5,
                                  shadows: [
                                    Shadow(
                                        color: Colors.black,
                                        offset: Offset(0, -5))
                                  ],
                                  fontWeight: FontWeight.normal,
                                  color: Colors.transparent,
                                  decoration: TextDecoration.none,
                                  decorationColor: Color(0xFF0272BA),
                                  decorationThickness: 0,
                                  decorationStyle: TextDecorationStyle.solid),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Provider.of<Controller>(context, listen: true).isClicked
                    ? _inputText2(
                        ctl: _amountNumber,
                        labelText: '0.00',
                        label: 'Amount',
                        obscure: false,
                        context: context)
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount:
                                          MediaQuery.of(context).size.width <=
                                                  360.0
                                              ? 3
                                              : 4,
                                      mainAxisExtent: 75,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10),
                              itemCount: data == [] ? 0 : data.length,
                              itemBuilder: (ctx, index) =>
                                  dataCard(data, ctx, index)),
                        ),
                      ),
                SizedBox(
                  height: 60.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                      Provider.of<Controller>(context, listen: true).isLoading
                          ? Center(child: CircularProgressIndicator())
                          : MaterialButton(
                              onPressed: () {
                                // if (Provider.of<Controller>(context, listen: false)
                                //     .isClicked)
                                //   Provider.of<Controller>(context, listen: false)
                                //       .executeAirtime(
                                //           _phoneNumber.text, _amountNumber.text);
                                // else
                                //   Provider.of<Controller>(context, listen: false)
                                //       .executeData(_phoneNumber.text);
                                Get.to(() => Agric('Airtime & Data'));
                              },
                              // onPressed: () =>
                              //     Provider.of<Controller>(context, listen: false)
                              //         .getDataBundleList(),
                              height: 40.0,
                              minWidth: MediaQuery.of(context).size.width,
                              color: Color(0xFF0272BA),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              textColor: Colors.white,
                              child: Text(
                                'Proceed',
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
  }

  Widget dataCard(List<Datum> data, context, int index) => InkWell(
        onTap: () => Provider.of<Controller>(context, listen: false)
            .selectPlan(data[index], index),
        child: Container(
          decoration: BoxDecoration(
              color: Provider.of<Controller>(context, listen: true)
                          .selectedNumber ==
                      index
                  ? Color(0xFFFFFFFF)
                  : Color(0xFF007BFF).withOpacity(.2),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${data[index].billerName}',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 10.5,
                  color: Color(0xFF3A3A3A).withOpacity(.7),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                '${data[index].shortName}',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  color: Color(0xFF3A3A3A).withOpacity(.7),
                  fontSize: 9.5,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'NGN ${data[index].amount}',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 10.5,
                  color: Color(0xFF3A3A3A).withOpacity(.7),
                ),
              ),
            ],
          ),
        ),
      );

  Widget selectAirtime(String type) => Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 20.0),
        child: Container(
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF9c9c9c),
                    offset: Offset.zero,
                    blurRadius: 5.0)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            child: Image(
                image: AssetImage(type),
                width: 35.0,
                height: 35.0,
                fit: BoxFit.cover),
          ),
        ),
      );

//       Text.rich(
//   TextSpan(
//     text: 'Hello ',
//     style: TextStyle(fontSize: 50),
//     children: <TextSpan>[
//       TextSpan(
//           text: 'world',
//           style: TextStyle(
//             decoration: TextDecoration.underline,
//           )),
//       // can add more TextSpans here...
//     ],
//   ),
// )

  Widget _inputText({ctl, labelText, label, iconP, obscure, context}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 14.5,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFF0272BA).withOpacity(.6),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 45.0,
                    margin: const EdgeInsets.only(top: 8.0, right: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: ctl,
                              obscureText: obscure,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                              decoration: InputDecoration(
                                  hintText: labelText,
                                  hintStyle: GoogleFonts.montserrat(
                                      fontSize: 14.0, color: Colors.grey),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        iconP,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      onPressed: () => Provider.of<Controller>(
                                              context,
                                              listen: false)
                                          .changeObscure()),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.9, horizontal: 2.0),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: InkWell(
                    child: Row(
                      children: [
                        Icon(
                          FontAwesome.address_book,
                          color: Color(0xFF0272BA),
                        ),
                        Icon(
                          MaterialIcons.arrow_drop_down,
                          color: Color(0xFF0272BA),
                        )
                      ],
                    ),
                    onTap: () => makeBottomSheet(
                        context,
                        Provider.of<Controller>(context, listen: false)
                            .contactList),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _inputText2({ctl, labelText, label, iconP, obscure, context}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 14.5,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color(0xFF0272BA).withOpacity(.6),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(8.0)),
                    height: 45.0,
                    margin: const EdgeInsets.only(top: 8.0, right: 10.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              controller: ctl,
                              obscureText: obscure,
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                              decoration: InputDecoration(
                                  hintText: labelText,
                                  hintStyle: GoogleFonts.montserrat(
                                      fontSize: 14.0, color: Colors.grey),
                                  suffixIcon: IconButton(
                                      icon: Icon(
                                        iconP,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      onPressed: () => Provider.of<Controller>(
                                              context,
                                              listen: false)
                                          .changeObscure()),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10.9, horizontal: 2.0),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none),
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  void makeBottomSheet(context, List<Contact> contactList) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (ctx, index) => _callList(contactList[index], ctx));
        });
  }

  Widget _callList(Contact contactList, BuildContext ctx) {
    return InkWell(
      onTap: () {
        //print(contactList.phones.last.value);
        _phoneNumber.text = contactList.phones.last.value;
        Navigator.pop(ctx);
      },
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
                        backgroundColor: Color(0xFF0272BA).withOpacity(.5),
                        radius: 20.0,
                        child: Icon(Icons.person)),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(contactList.displayName,
                                style: GoogleFonts.montserrat(
                                    fontSize: 14, color: Colors.black)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Text(
                                contactList.phones.length != 0
                                    ? '${contactList.phones.last.value}'
                                    : '',
                                style: GoogleFonts.montserrat(
                                    fontSize: 12.5, color: Colors.black45)),
                          ),
                        ],
                      ),
                    ),
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
}
