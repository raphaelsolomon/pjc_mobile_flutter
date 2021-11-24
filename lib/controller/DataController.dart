import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pjc_empire/controller/Controller.dart';
import 'package:pjc_empire/models/UserDetails.dart';
import 'package:provider/provider.dart';

class DataController extends GetxController {
  var isLoading = true.obs;
  var myProfile;
  var type = 'card'.obs;

  String genReference() {
    return '${Random().nextInt(99999093)}${DateTime.now().microsecondsSinceEpoch}${Random().nextInt(99999093)}';
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchData(context) async {
    isLoading(true);
    try {
      final response = await http.Client().get(Uri.parse(
          'https://testapi.pjcempire.com/routes/profile.php?id=${Provider.of<Controller>(context, listen: false).clientID}&='));
      if (response.statusCode == 200) {
        UserDetails userDetails = UserDetails.fromRawJson(response.body);
        myProfile = userDetails.profile[0].obs;
        return myProfile;
      }
    } finally {
      isLoading(false);
    }
  }
}

/*

for (CustomerHistory sort in investmentHistory.customer) {
        if (transort.contains(sort.status)) {
          return;
        }
        if (transort.length < 2) {
          transort.add(sort.status);
        }
      }
      print(transort.length.toString());
  

 

MyObjectFunction.chargeCard(
                            context,
                            genReference(),
                            'sk_live_e0e7363d3c2146132c92de61d0e6a8f3f3ec1c07',
                            widget.postDetails,
                            type);
*/
