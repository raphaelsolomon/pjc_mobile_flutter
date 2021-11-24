import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/Agric.dart';
import 'package:pjc_empire/models/PowerModel.dart';
import 'package:pjc_empire/models/TvModel.dart';
import 'package:provider/provider.dart';

class Electricity extends StatelessWidget {
  final String _type;
  Electricity(this._type);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<Controller>(context, listen: false).tvDataList.length);
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
                          _type,
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
                _type == "Television"
                    ? _isTelevision(context, _type)
                    : _isPower(context, _type),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child:
                      Provider.of<Controller>(context, listen: true).isLoading
                          ? Center(child: CircularProgressIndicator())
                          : MaterialButton(
                              onPressed: () =>
                                  Get.to(() => Agric('Internet Payment')),
                              // onPressed: () =>
                              //     Provider.of<Controller>(context, listen: false)
                              //         .getDataBundleList(),
                              height: 44.0,
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
}

Widget _isTelevision(context, type) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //----------------------------------------------------------
        _businessCategory(context, type),
        //----------------------------------------------------------
        SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Text(
            'NOTE: When you are about to purchase a TV plan, please make sure your decoder is on so as to synchronize immediately',
            textAlign: TextAlign.justify,
            style: GoogleFonts.montserrat(
              color: Color(0xFF0272BA),
              fontSize: 14.5,
            ),
          ),
        ),
        SizedBox(
          height: 50.0,
        ),
        //----------------------------------------------------------
        _inputText(
            ctl: null,
            label: 'Enter SmartCard Number',
            labelText: 'SmartCard Number',
            obscure: false,
            context: context),
      ],
    );

Widget _isPower(context, type) => Column(
      children: [
        //----------------------------------------------------------
        _businessCategory(context, type),
        //----------------------------------------------------------
        SizedBox(
          height: 50.0,
        ),
        //----------------------------------------------------------
        _inputText(
            ctl: null,
            label: 'Enter Meter Number',
            labelText: 'Meter Number',
            obscure: false,
            context: context),
      ],
    );

Widget _businessCategory(context, _type) => Container(
      padding: const EdgeInsets.only(
          left: 30.0, right: 10.0, top: 20.0, bottom: 20.0),
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF0272BA), width: 1.0),
          borderRadius: BorderRadius.circular(5.0)),
      child: DropdownButtonHideUnderline(
        child: _type == 'Television'
            ? DropdownButton<TvData>(
                onTap: () => Provider.of<Controller>(context, listen: false)
                    .changeOnFocus(true),
                isExpanded: true,
                value: Provider.of<Controller>(context, listen: false).tvData,
                icon: Icon(Icons.keyboard_arrow_down),
                items: Provider.of<Controller>(context, listen: false)
                    .tvDataList
                    .map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: FittedBox(
                        child: Text(
                      item.billerName,
                      style: GoogleFonts.montserrat(
                          fontSize: 14.5, fontWeight: FontWeight.w500),
                    )),
                  );
                }).toList(),
                onChanged: (selectedItem) =>
                    Provider.of<Controller>(context, listen: false)
                        .selectedTv(selectedItem))
            : DropdownButton<PowerData>(
                onTap: () => Provider.of<Controller>(context, listen: false)
                    .changeOnFocus(true),
                isExpanded: true,
                value: Provider.of<Controller>(context, listen: true).powerData,
                icon: Icon(Icons.keyboard_arrow_down),
                items: Provider.of<Controller>(context, listen: false)
                    .powerDataList
                    .map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: FittedBox(
                        child: Text(
                      item.billerName,
                      style: GoogleFonts.montserrat(
                          fontSize: 14.5, fontWeight: FontWeight.w500),
                    )),
                  );
                }).toList(),
                onChanged: (selectedItem) =>
                    Provider.of<Controller>(context, listen: false)
                        .selectedPower(selectedItem)),
      ),
    );

Widget _inputText({ctl, labelText, label, iconP, obscure, context}) => Padding(
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
                          color: Color(0xFF0272BA).withOpacity(.6), width: 1.5),
                      borderRadius: BorderRadius.circular(8.0)),
                  height: 45.0,
                  margin: const EdgeInsets.only(top: 8.0),
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
