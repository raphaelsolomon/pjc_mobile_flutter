import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class CompleteProfile extends StatelessWidget {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _banknameController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  final initialCountry = 'NG';
  final _number = PhoneNumber(isoCode: 'NG');

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
                              ),
                              onPressed: () {
                                if (Provider.of<Controller>(context,
                                            listen: false)
                                        .index ==
                                    2) {
                                  Provider.of<Controller>(context,
                                          listen: false)
                                      .changeIndex(1);
                                } else {
                                  Get.back();
                                }
                              }),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Center(
                            child: FittedBox(
                          child: Text(
                            'Complete Your Profile',
                            style: GoogleFonts.montserrat(
                                fontSize: 19, color: Color(0xFF0272BA)),
                          ),
                        )),
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
                  CircleAvatar(
                    backgroundColor: Color(0xFF0272BA),
                    radius: 23.0,
                    child: Text(
                      '${Provider.of<Controller>(context, listen: true).index}/2',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  Provider.of<Controller>(context, listen: true).index == 1
                      ? _firstPage(context)
                      : _secondPage(context)
                ],
              ),
            ),
          ),
        ),
      );

  Widget _firstPage(context) => Column(
        children: [
          Text(
            'Personal Details',
            style: TextStyle(fontSize: 15.5, color: Colors.black),
          ),
          SizedBox(
            height: 21.0,
          ),
          _inputText(
              en: false,
              ctl: _firstnameController,
              label: 'Firstname',
              labelText: 'Enter Your Firstname',
              icon: null,
              input: TextInputType.text,
              obscure: false,
              iconP: null),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
              en: false,
              ctl: _lastnameController,
              label: 'Lastname',
              input: TextInputType.text,
              labelText: 'Enter Your Lastname',
              obscure: false,
              iconP: null),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
              en: true,
              input: TextInputType.emailAddress,
              ctl: null,
              label: 'Email',
              labelText:
                  '${Provider.of<Controller>(context, listen: true).email}',
              obscure: false,
              iconP: null),
          SizedBox(
            height: 5.0,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Gender',
                  style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Text('Male',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          Checkbox(
                              value:
                                  Provider.of<Controller>(context, listen: true)
                                      .isMale,
                              onChanged: (change) => Provider.of<Controller>(
                                      context,
                                      listen: false)
                                  .changeIsmale(change)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Female',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400)),
                          Checkbox(
                              value:
                                  Provider.of<Controller>(context, listen: true)
                                      .isfemale,
                              onChanged: (change) => Provider.of<Controller>(
                                      context,
                                      listen: false)
                                  .changeisfemale(change)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          _inputRichText(
              ctl: _addressController,
              label: 'Address',
              labelText: 'Enter your address'),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: MaterialButton(
              onPressed: () => Provider.of<Controller>(context, listen: false)
                  .completeDetails_1(
                      _firstnameController.text.trim(),
                      _lastnameController.text.trim(),
                      _addressController.text.trim(),
                      _emailController.text.trim()),
              height: 40.0,
              minWidth: MediaQuery.of(context).size.width,
              color: Color(0xFF0272BA),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              textColor: Colors.white,
              child: Text(
                'Next',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
        ],
      );

  Widget _secondPage(context) => Column(
        children: [
          SizedBox(
            height: 21.0,
          ),
          // _inputText(
          //     en: false,
          //     input: TextInputType.numberWithOptions(decimal: true),
          //     ctl: _phoneController,
          //     label: 'Phone number',
          //     labelText: 'phone number',
          //     obscure: false,
          //     iconP: null),
          phoneNumber(context),
          SizedBox(
            height: 5.0,
          ),
          _bankCategory(context),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
              en: false,
              input: TextInputType.text,
              ctl: _accountNameController,
              label: 'Account name',
              labelText: 'Enter Account name',
              obscure: false,
              iconP: null),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
              en: false,
              input: TextInputType.numberWithOptions(decimal: false),
              ctl: _accountNumberController,
              label: 'Account number',
              labelText: 'Enter Account number',
              obscure: false,
              iconP: null),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Provider.of<Controller>(context, listen: true).isLoading
                ? CircularProgressIndicator()
                : MaterialButton(
                    onPressed: () =>
                        Provider.of<Controller>(context, listen: false)
                            .completeDetails_2(
                                _phoneController.text.trim(),
                                _banknameController.text,
                                _accountNameController.text.trim(),
                                _accountNumberController.text.trim()),
                    height: 40.0,
                    minWidth: MediaQuery.of(context).size.width,
                    color: Color(0xFF0272BA),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0)),
                    textColor: Colors.white,
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
          ),
          SizedBox(
            height: 35.0,
          ),
        ],
      );

  Widget _inputText({ctl, labelText, icon, label, iconP, obscure, input, en}) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                  fontSize: 15.5, fontWeight: FontWeight.w500),
            ),
            Container(
              height: 42.0,
              margin: const EdgeInsets.only(top: 10.0 - 5),
              child: TextFormField(
                controller: ctl,
                obscureText: obscure,
                readOnly: en,
                style:
                    GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 14.0, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF0272BA)),
                  ),
                ),
                keyboardType: input,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      );

  Widget phoneNumber(context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Phone Number',
                style: GoogleFonts.montserrat(
                    fontSize: 15.5, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFFCCCCCC)),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: InternationalPhoneNumberInput(
                  formatInput: true,
                  onInputChanged: (PhoneNumber number) {
                    Provider.of<Controller>(context, listen: false)
                        .changeOnphonrNumber(number.toString());
                  },
                  onInputValidated: (bool value) {
                    Provider.of<Controller>(context, listen: false)
                        .changePhoneNumberIndex(value);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                    backgroundColor: Colors.white,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: _number,
                  textFieldController: _phoneController,
                  inputDecoration: InputDecoration(
                      hintText: '${9011112222}',
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none),
                  inputBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF0272BA)),
                  )),
            ),
          ],
        ),
      );

  Widget _inputRichText({ctl, labelText, label}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.montserrat(
                  fontSize: 15.5, fontWeight: FontWeight.w500),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0 - 5),
              child: TextFormField(
                controller: ctl,
                maxLines: 8,
                style:
                    GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 14.0, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF0272BA)),
                  ),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      );

  Widget _bankCategory(context) => Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 10.0),
                child: FittedBox(
                  child: Text(
                    'Bank name',
                    style: GoogleFonts.montserrat(
                        fontSize: 14.5, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                        color: Provider.of<Controller>(context, listen: true)
                                .onFocus
                            ? Color(0xFF0272BA)
                            : Color(0xFFCCCCCC),
                        width: 1.0,
                        style: BorderStyle.solid)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      onTap: () =>
                          Provider.of<Controller>(context, listen: false)
                              .changeOnFocus(true),
                      isExpanded: true,
                      value: Provider.of<Controller>(context, listen: true)
                          .completePro,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: Provider.of<Controller>(context, listen: false)
                          .bankList
                          .map((item) {
                        return DropdownMenuItem(
                          value: item.toString(),
                          child: FittedBox(
                              child: Text(
                            item,
                            style: GoogleFonts.montserrat(
                                fontSize: 14.5, fontWeight: FontWeight.w500),
                          )),
                        );
                      }).toList(),
                      onChanged: (selectedItem) =>
                          Provider.of<Controller>(context, listen: false)
                              .changeOnSelectedCompleteBankItem(selectedItem)),
                ),
              )
            ],
          ),
        ),
      );
}
