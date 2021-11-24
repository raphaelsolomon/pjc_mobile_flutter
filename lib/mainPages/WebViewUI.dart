import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewUI extends StatefulWidget {
  @override
  _WebViewUIState createState() => _WebViewUIState();
}

class _WebViewUIState extends State<WebViewUI> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://academy.pjcempire.com/',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
