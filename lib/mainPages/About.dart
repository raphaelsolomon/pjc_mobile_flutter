import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          child: Column(
            children: [
              Container(
                color: Color(0xff0272BA),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 45.0,
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
                                  Icons.keyboard_backspace_outlined,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                onPressed: () => Get.back()),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                'Frequently Ask Questions',
                                style: GoogleFonts.montserrat(
                                    fontSize: 19.0, color: Colors.white),
                              ),
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
                  ],
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'FAQ',
                            style: GoogleFonts.montserrat(
                                fontSize: 17.0, color: Colors.black),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //1,2,7,8,10
                          _faqCategory(
                              context,
                              [
                                'Is Pjc Registered with cac?',
                                'PJC registered enterprise under THE CORPORATE AFFAIRS COMMISSION (CAC) of the Federial Republic of Nigeria with REG NO 319914.'
                              ],
                              'Is Pjc Registered with cac?'),
                          SizedBox(
                            height: 18.9,
                          ),
                          _faqCategory(
                              context,
                              [
                                'How Does PJC works?',
                                'We provide exceptional investment service to our clients, through transparency and honesty in delivering the best investment experience'
                              ],
                              'How Does PJC works?'),
                          SizedBox(
                            height: 18.9,
                          ),
                          _faqCategory(
                              context,
                              [
                                'How long do i need to invest my money for?',
                                'Mininum of 25 working days, Maximum of 90 days. You can have a new investment after 90 days.'
                              ],
                              'How long do i need to invest my money for?'),
                          SizedBox(
                            height: 18.9,
                          ),
                          _faqCategory(
                              context,
                              [
                                'Can i lock my money for a long time investment',
                                'You can only invest for 90 days and be credited, Re-investment is possible'
                              ],
                              'Can i lock my money for a long time investment'),
                          SizedBox(
                            height: 18.9,
                          ),
                          _faqCategory(
                              context,
                              [
                                'on what percentage is the interest rate?',
                                'You get 25% returns on your investment every 25 working days and 80% on your investment in 90 days!'
                              ],
                              'on what percentage is the interest rate?'),
                          SizedBox(
                            height: 18.9,
                          ),
                          _faqCategory(
                              context,
                              [
                                'Is there any referal bonus for investors?',
                                'No PJC Empire doesn\'t offer any referral bonus'
                              ],
                              'Is there any referal bonus for investors?'),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      );

  Widget _faqCategory(context, List<String> data, value) => Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                height: 47.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFC4C4C4).withOpacity(.4),
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  // boxShadow: [
                  //   BoxShadow(color: Color(0xFFF2F2F2), spreadRadius: 2.0),
                  //   BoxShadow(
                  //       color: Colors.black54,
                  //       spreadRadius: 0.3,
                  //       offset: Offset.fromDirection(-5, 5),
                  //       blurRadius: 5.0)
                  // ]
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      onTap: () => null,
                      isExpanded: true,
                      value: value,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: data.map((item) {
                        return DropdownMenuItem(
                          value: item.toString(),
                          child: Text(
                            item,
                            style: GoogleFonts.montserrat(
                                fontSize: 16.5, fontWeight: FontWeight.w400),
                          ),
                        );
                      }).toList(),
                      onChanged: (selectedItem) => null),
                ),
              )
            ],
          ),
        ),
      );
}
