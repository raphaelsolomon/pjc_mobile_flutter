import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:pjc_empire/authPages/SplashScreen.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  bool isNotFirst = await checkEnableData();
  runApp(MyApp(isNotFirst));
}

checkEnableData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String user = (prefs.getString("user") ?? '');
  String pass = (prefs.getString("pass") ?? '');
  if (user != '' && pass != '') {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final bool isNotFirst;
  MyApp(this.isNotFirst);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider<Controller>(create: (_) => Controller()),
        ],
        child: GetMaterialApp(
          defaultTransition: Transition.zoom,
          title: 'Pjc Empire',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
            // This makes the visual density adapt to the platform that you run
            // the app on. For desktop platforms, the controls will be smaller and
            // closer together (more dense) than on mobile platforms.
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(isNotFirst),
          //home: FundWall(),
        ),
      );
}
