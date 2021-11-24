import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Academy extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
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
                            '',
                            style: TextStyle(
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
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    child: WebView(
                      initialUrl: 'https://academy.pjcempire.com/',
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
}
