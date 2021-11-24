import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_asker/permission_asker.dart';
import 'package:pjc_empire/authPages/Login.dart';
import 'package:pjc_empire/authPages/OnBoarding.dart';
import 'package:pjc_empire/controller/Controller.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  final authentication = LocalAuthentication();

  final bool isNotFirst;
  SplashScreen(this.isNotFirst);
  @override
  Widget build(BuildContext context) {
    Provider.of<Controller>(context, listen: false)
        .checkBiometrics(authentication);
    Provider.of<Controller>(context, listen: false).checkIfPinIsset();
    Provider.of<Controller>(context, listen: false).checkEnableData();
    return Scaffold(
        backgroundColor: Colors.white,
        body: PermissionAskerBuilder(
          permissions: [Permission.contacts],
          grantedBuilder: (ctx) =>
              Center(child: !isNotFirst ? OnBoarding() : LoginPage()),
          notGrantedBuilder: (ctx, notGrantedPermissions) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Not granted permissions:'),
                for (final p in notGrantedPermissions) Text(p.toString())
              ],
            ),
          ),
          notGrantedListener: (notGrantedPermissions) =>
              print('Not granted:\n$notGrantedPermissions'),
        ));
  }
}

// FutureBuilder(
//           future: Future.delayed(Duration(seconds: 3)),
//           builder: (ctx, snapshots) {
//             if (snapshots.connectionState == ConnectionState.waiting) {
//               return Stack(
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Container(
//                       width: double.infinity,
//                       height: 200,
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Container(
//                               height: 100,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   color: Color(0xFF0272BA),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(70),
//                                       bottomLeft: Radius.circular(70),
//                                       bottomRight: Radius.circular(0))),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.topRight,
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               margin:
//                                   const EdgeInsets.only(top: 70.0, right: 60.0),
//                               decoration: BoxDecoration(
//                                   color: Color(0xFF0272BA),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(70),
//                                       topRight: Radius.circular(70),
//                                       bottomLeft: Radius.circular(70),
//                                       bottomRight: Radius.circular(70))),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Image.asset(
//                       'assets/logo.png',
//                       width: 200,
//                       height: 200,
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.bottomLeft,
//                     child: Container(
//                       width: double.infinity,
//                       height: 200,
//                       child: Stack(
//                         children: [
//                           Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Container(
//                               height: 100,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                   color: Color(0xFF0272BA),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(0),
//                                       topRight: Radius.circular(70),
//                                       bottomRight: Radius.circular(70))),
//                             ),
//                           ),
//                           Align(
//                             alignment: Alignment.bottomLeft,
//                             child: Container(
//                               height: 40,
//                               width: 40,
//                               margin: const EdgeInsets.only(
//                                   bottom: 70.0, left: 60.0),
//                               decoration: BoxDecoration(
//                                   color: Color(0xFF0272BA),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(70),
//                                       topRight: Radius.circular(70),
//                                       bottomLeft: Radius.circular(70),
//                                       bottomRight: Radius.circular(70))),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               );
//             }
//             return OnBoarding();
//           }));
