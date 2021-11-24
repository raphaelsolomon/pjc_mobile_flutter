import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatelessWidget {
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _addressController = TextEditingController();
  final _phoneController = TextEditingController();
  // final _banknameController = TextEditingController();
  final _accountNameController = TextEditingController();
  final _accountNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
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
                            'Edit Profile',
                            style: GoogleFonts.montserrat(
                                fontSize: 19,
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
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xFFF2F2F2), width: 3.0)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Provider.of<Controller>(context, listen: true)
                                    .imagefile ==
                                null
                            ? Image.asset('assets/logo.png',
                                width: 60.0, height: 60.0, fit: BoxFit.cover)
                            : Image.file(
                                Provider.of<Controller>(context, listen: true)
                                    .imagefile,
                                width: 60.0,
                                height: 60.0,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    onTap: () => null,
                  ),
                  SizedBox(
                    height: 11.0,
                  ),
                  _firstPage(context)
                ],
              ),
            ),
          ),
        ),
      );

  void selectImage(context) async {
    // FilePickerResult result = await FilePicker.platform.pickFiles(
    //   type: FileType.custom,
    //   allowedExtensions: ['jpg', 'png', 'gif'],
    // );
    // if (result != null) {
    //   File file = File(result.files.single.path);
    //   Provider.of<Controller>(context, listen: false).changeImageIndex(file);
    // }
  }

  Widget _firstPage(context) => Column(
        children: [
          Text(
            'Personal Details',
            style: GoogleFonts.montserrat(
                fontSize: 15.5,
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 21.0,
          ),
          _inputText(
              ctl: _firstnameController,
              en: false,
              label: 'Firstname',
              labelText:
                  '${Provider.of<Controller>(context).myProfile.firstname}',
              icon: null,
              input: TextInputType.text,
              obscure: false,
              iconP: null),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
              ctl: _lastnameController,
              en: false,
              label: 'Lastname',
              input: TextInputType.text,
              labelText:
                  '${Provider.of<Controller>(context).myProfile.lastname}',
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
              labelText: '${Provider.of<Controller>(context).myProfile.email}',
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
              labelText:
                  '${Provider.of<Controller>(context).myProfile.address}'),
          SizedBox(
            height: 5.0,
          ),
          _businessCategory(context),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
            en: false,
            input: TextInputType.numberWithOptions(decimal: false),
            ctl: _accountNumberController,
            label: 'Account Number',
            labelText:
                '${Provider.of<Controller>(context).myProfile.accountNo}',
            obscure: false,
            iconP: null,
          ),
          SizedBox(
            height: 5.0,
          ),
          _inputText(
              en: false,
              input: TextInputType.text,
              ctl: _accountNameController,
              label: 'Account Name',
              labelText:
                  '${Provider.of<Controller>(context).myProfile.accountName}',
              obscure: false,
              iconP: null),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: MaterialButton(
              onPressed: () => validateDetails(context),
              height: 40.0,
              minWidth: MediaQuery.of(context).size.width,
              color: Color(0xFF0272BA),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0)),
              textColor: Colors.white,
              child: Text(
                'Update Profile',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          SizedBox(
            height: 35.0,
          ),
        ],
      );

  void validateDetails(context) {
    Map<String, dynamic> _authData = {};
    //--------------------------------------------------------------------------
    _authData['email'] =
        Provider.of<Controller>(context, listen: false).myProfile.email;
    _authData['gender'] =
        Provider.of<Controller>(context, listen: false).gender;
    //--------------------------------------------------------------------------
    if (_firstnameController.text.isNotEmpty) {
      _authData['firstname'] = _firstnameController.text.trim();
    } else
      _authData['firstname'] =
          '${Provider.of<Controller>(context, listen: false).myProfile.firstname}';
    //--------------------------------------------------------------------------

    if (_lastnameController.text.isNotEmpty) {
      _authData['lastname'] = _lastnameController.text.trim();
    } else
      _authData['lastname'] =
          '${Provider.of<Controller>(context, listen: false).myProfile.lastname}';
    //--------------------------------------------------------------------------

    if (_addressController.text.isNotEmpty) {
      _authData['address'] = _addressController.text.trim();
    } else
      _authData['address'] =
          '${Provider.of<Controller>(context, listen: false).myProfile.address}';
    //--------------------------------------------------------------------------

    if (_phoneController.text.isNotEmpty) {
      _authData['phone'] = _phoneController.text.trim();
    } else
      _authData['phone'] =
          '${Provider.of<Controller>(context, listen: false).myProfile.phone}';
    //--------------------------------------------------------------------------

    if (_accountNumberController.text.isNotEmpty) {
      _authData['account_no'] = _accountNumberController.text.trim();
    } else
      _authData['account_no'] =
          '${Provider.of<Controller>(context, listen: false).myProfile.accountNo}';
    //--------------------------------------------------------------------------

    if (_accountNameController.text.isNotEmpty) {
      _authData['account_name'] = _accountNameController.text.trim();
    } else
      _authData['account_name'] =
          '${Provider.of<Controller>(context, listen: false).myProfile.accountName}';
    //--------------------------------------------------------------------------
    // if (Provider.of<Controller>(context, listen: false).imagefile == null) {
    //   _authData['avatar'] =
    //       Provider.of<Controller>(context, listen: false).imagefile;
    // } else
    //   _authData['avatar'] = null;

    Provider.of<Controller>(context, listen: false).updateProfile(_authData);
  }

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
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFFFFFFF), spreadRadius: 2.0),
                    BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 0.3,
                        offset: Offset.fromDirection(-5, 5),
                        blurRadius: 7.0)
                  ]),
              margin: const EdgeInsets.only(top: 5.0),
              child: TextFormField(
                controller: ctl,
                obscureText: obscure,
                readOnly: en,
                style:
                    GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 14.0, color: en ? Colors.grey : Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 9.9, vertical: 5.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFFF2F2F2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    borderSide: BorderSide(color: Color(0xFFF2F2F2)),
                  ),
                ),
                keyboardType: input,
                onSaved: (value) {},
              ),
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
              margin: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  boxShadow: [
                    BoxShadow(color: Color(0xFFFFFFFF), spreadRadius: 2.0),
                    BoxShadow(
                        color: Colors.black54,
                        spreadRadius: 0.3,
                        offset: Offset.fromDirection(-5, 5),
                        blurRadius: 7.0)
                  ]),
              child: TextFormField(
                controller: ctl,
                maxLines: 4,
                style:
                    GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: GoogleFonts.montserrat(
                      fontSize: 14.0, color: Colors.black),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFF2F2F2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFF2F2F2)),
                  ),
                ),
                keyboardType: TextInputType.text,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      );

  Widget _businessCategory(context) => Container(
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
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(color: Color(0xFFFFFFFF), spreadRadius: 2.0),
                      BoxShadow(
                          color: Colors.black54,
                          spreadRadius: 0.3,
                          offset: Offset.fromDirection(-5, 5),
                          blurRadius: 7.0)
                    ]),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      onTap: () =>
                          Provider.of<Controller>(context, listen: false)
                              .changeOnFocus(true),
                      isExpanded: true,
                      value: Provider.of<Controller>(context, listen: true)
                          .bankItem,
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
                              .changeOnSelectedBankItem(selectedItem)),
                ),
              )
            ],
          ),
        ),
      );
}
