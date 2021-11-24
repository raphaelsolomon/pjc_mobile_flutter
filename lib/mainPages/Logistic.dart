import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/mainPages/LogisticDetails.dart';
import 'package:pjc_empire/models/EstateModel.dart';
import 'package:provider/provider.dart';

class Logistics extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
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
                          'Logistics',
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'All',
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Location',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF0272BA),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          itemBuilder: (ctx, index) => _imagePreview(
                              Provider.of<Controller>(context, listen: true)
                                  .isEstateData[index]),
                          itemCount:
                              Provider.of<Controller>(context, listen: true)
                                  .isLogisticsData
                                  .length,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _imagePreview(EstateModel estateData) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          children: [
            ClipRRect(
              child: InkWell(
                onTap: () => Get.to(() => LogisticDetails()),
                child: Image.network(
                  estateData.image,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              borderRadius: BorderRadius.all(Radius.circular(15.0)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        estateData.type,
                        style: GoogleFonts.montserrat(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        '\#${estateData.price}',
                        style: GoogleFonts.montserrat(
                            color: Color(0xFF0272BA),
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      estateData.location == 'Negotiable'
                          ? Text(
                              estateData.location,
                              style: GoogleFonts.montserrat(
                                  color: Color(0xFF007BFF),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            )
                          : Text(
                              estateData.location,
                              style: GoogleFonts.montserrat(
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.normal),
                            ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
