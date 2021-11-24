import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

class Investment extends StatelessWidget {
  final _amountController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ',', leftSymbol: 'NGN ');
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => Provider.of<Controller>(context, listen: false)
                .changeOnFocus(false),
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
                                  color: Color(0xFF0272BA),
                                ),
                                onPressed: () => Get.back()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              'Invest'.toUpperCase(),
                              style: GoogleFonts.montserrat(
                                  fontSize: 16.0, color: Color(0xFF0272BA)),
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
                      height: 20.0,
                    ),
                    _inputText(
                        ctl: _amountController,
                        labelText: 'Enter Amount',
                        label: 'Amount',
                        context: context),
                    SizedBox(
                      height: 10.0,
                    ),
                    businessCategory(context),
                    SizedBox(
                      height: 24.0,
                    ),
                    _inputRichText(
                        ctl: _descriptionController,
                        context: context,
                        labelText: 'e.g school fee investment',
                        label: 'Investment Description'),
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Provider.of<Controller>(context, listen: true)
                              .isLoading
                          ? Center(child: CircularProgressIndicator())
                          : MaterialButton(
                              onPressed: () => validate(context),
                              height: 40.0,
                              minWidth: MediaQuery.of(context).size.width,
                              color: Color(0xFF0272BA),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              textColor: Colors.white,
                              child: Text(
                                'Make Investment',
                                style: GoogleFonts.montserrat(fontSize: 16.0),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  void validate(context) {
    if (_amountController.text.isNotEmpty &&
        _amountController.text != "NGN 0.00") {
      Provider.of<Controller>(context, listen: false).makeInvestMent(
          _amountController.numberValue.toInt(), _descriptionController.text);
    } else
      Get.snackbar('Error', 'Enter the amount to invest',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
  }

  Widget _inputText({ctl, labelText, label, context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                    fontSize: 14.5, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 40.0,
              margin: const EdgeInsets.only(top: 8.0),
              child: TextFormField(
                onTap: () => Provider.of<Controller>(context, listen: false)
                    .changeOnFocus(false),
                controller: ctl,
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFFCCCCCC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Color(0xFF0272BA)),
                  ),
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                onSaved: (value) {},
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
          ],
        ),
      );

  Widget _inputRichText({ctl, labelText, label, context}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Text(
                label,
                style: GoogleFonts.montserrat(
                    fontSize: 15.5, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0 - 5),
              child: TextFormField(
                controller: ctl,
                maxLines: 6,
                onTap: () => Provider.of<Controller>(context, listen: false)
                    .changeOnFocus(false),
                style: TextStyle(fontSize: 14.0, color: Colors.grey),
                decoration: InputDecoration(
                  hintText: labelText,
                  hintStyle: TextStyle(fontSize: 14.0, color: Colors.grey),
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
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {},
              ),
            ),
          ],
        ),
      );

  Widget businessCategory(context) {
    return Container(
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
                  'Type of investment',
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
                      color:
                          Provider.of<Controller>(context, listen: true).onFocus
                              ? Color(0xFF0272BA)
                              : Color(0xFFCCCCCC),
                      width: 1.0,
                      style: BorderStyle.solid)),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    onTap: () => Provider.of<Controller>(context, listen: false)
                        .changeOnFocus(true),
                    isExpanded: true,
                    value: Provider.of<Controller>(context, listen: true)
                        .selectedItem,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: Provider.of<Controller>(context, listen: true)
                        .catergory
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
                            .changeOnSelectedItem(selectedItem)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
