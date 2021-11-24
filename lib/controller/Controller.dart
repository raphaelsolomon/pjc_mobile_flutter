import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterwave/core/flutterwave.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutterwave/models/responses/charge_response.dart';
import 'package:flutterwave/utils/flutterwave_constants.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_utils/get_utils.dart';
import 'package:get/utils.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pjc_empire/authPages/CompleteProfile.dart';
import 'package:pjc_empire/authPages/CreatePin.dart';
import 'package:pjc_empire/authPages/Login.dart';
import 'package:pjc_empire/authPages/PinScreen.dart';
import 'package:pjc_empire/mainPages/AddMoney.dart';
import 'package:pjc_empire/mainPages/DashBoard.dart';
import 'package:pjc_empire/models/Accountmanager.dart';
import 'package:pjc_empire/models/AirtimeModel.dart';
import 'package:pjc_empire/models/Api.dart';
import 'package:pjc_empire/models/DataListModel.dart';
import 'package:pjc_empire/models/DataResponseModel.dart';
import 'package:pjc_empire/models/EstateModel.dart';
import 'package:pjc_empire/models/InvestmentHistory.dart';
import 'package:pjc_empire/models/PowerModel.dart';
import 'package:pjc_empire/models/TvModel.dart';
import 'package:pjc_empire/models/WalletListModel.dart';
import 'package:pjc_empire/models/WalletRecent.dart';
import 'package:pjc_empire/models/UserDetails.dart';
import 'package:pjc_empire/models/Wallet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Controller extends ChangeNotifier {
  Map<String, dynamic> _authData = {};
  Map<String, dynamic> _complete = {};
  int index = 1;
  int pageIndex = 0;
  int searchIndex = 0;
  String clientID = '';
  String sessionID = '';
  Wallet wallet;
  String email;
  var selectedNumber = -1;
  String networkType = "MTN";
  bool isScrolling = false;
  List<Datum> dataListItem = [];
  List<TvData> tvDataList = [];
  List<PowerData> powerDataList = [];
  Datum datum;
  TvData tvData;
  PowerData powerData;
  String paystackPublicKey = 'pk_live_58fca99c3da88bd0b9edf31f11a88bb988247b65';
  static String secretKey = 'sk_live_155f17d013a2ef9ba2e924279cd34dfffe1c91d8';
  //-----------------------------------------------------------
  List<String> transort = ['All Catergories'];
  List<String> transortWallet = ['All Catergories'];
  List<String> transortAllWallet = ['All Catergories'];
  //-----------------------------------------------------------
  AccountManager accountManager;
  bool isLoading = false;
  bool onFocus = false;
  int dashBoardPage = 0;
  String completeName;
  bool isObsure = true;
  bool isPhoneNumberValid = false;
  bool isMale = true;
  File imagefile;
  String gender = 'Male';
  List<WalletRecentElement> recentWallet;
  List<Customers> allWalletList;
  List<CustomerHistory> customerHistory;
  Profile myProfile;
  bool isfemale = false;
  String selectedItem =
      '12% ROI One time investment(cashout capital + interest)';
  String bankItem = 'Access Bank Plc';
  String completePro = 'CitiBank Nigeria Limited';
  String phoneNo = '';

  //----------------------------------------------------------------
  int counter = 0;
  int counterIn = 0;
  int counterT = 0;
  //----------------------------------------------------------------
  String withdrawResponse = 'Payout Requested Successfully.';
  List<Contact> contactList = [];
  bool isClicked = true;
  bool isMoneyHidden = false;
  List<EstateModel> isEstateData = [
    EstateModel(
        image:
            "https://images.pexels.com/photos/1396132/pexels-photo-1396132.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "3,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Lekki Lagos state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/5043840/pexels-photo-5043840.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "13,000,000",
        type: "4 Bedroom flat Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "ikoyi Lagos state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "10,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Lekki Lagos state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/87223/pexels-photo-87223.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "3,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Otta Ogun state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/1370704/pexels-photo-1370704.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "3,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Lekki Lagos state"),
  ];

  List<EstateModel> isLogisticsData = [
    EstateModel(
        image: "https://pbs.twimg.com/media/E0yK6_UX0AI17SJ.jpg",
        price: "Negotiate",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Lekki Lagos state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/5043840/pexels-photo-5043840.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "13,000,000",
        type: "4 Bedroom flat Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "ikoyi Lagos state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "10,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Lekki Lagos state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/87223/pexels-photo-87223.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "3,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Otta Ogun state"),
    EstateModel(
        image:
            "https://images.pexels.com/photos/1370704/pexels-photo-1370704.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        price: "3,000,000",
        type: "4 Bedroom Bungalow",
        desc:
            " Luxurious 4 Room House Plan with an open layout, spacious rooms  kitchen and double garage.",
        location: "Lekki Lagos state"),
  ];

  List<EstateModel> isCarData = [
    EstateModel(
        image:
            "https://www.autoguide.com/blog/wp-content/uploads/2015/06/10-worst-car-brands-initial-quality-2.jpg",
        price: "3,000,000",
        type: "Toyota Honda",
        desc:
            "The Venza was equipped with vehicle stability control,traction control system, electronic brakeforce distribution,emergency brake assist, anti-lock braking system, smart stop technology as well as hill-start assist control, tire-pressure monitoring system, active head restraints for front-seat occupants, 3-point seat .",
        location: "Negotiable"),
    EstateModel(
        image:
            "https://thenextavenue.com/wp-content/uploads/2020/04/Tesla-Model-Y-4-1200x600-1.jpg",
        price: "13,000,000",
        type: "Tesla Model Y",
        desc:
            "The Venza was equipped with vehicle stability control,traction control system, electronic brakeforce distribution,emergency brake assist, anti-lock braking system, smart stop technology as well as hill-start assist control, tire-pressure monitoring system, active head restraints for front-seat occupants, 3-point seat .",
        location: "Negotiable"),
    EstateModel(
        image:
            "https://besthqwallpapers.com/Uploads/12-8-2019/100810/thumb2-acura-tlx-a-spec-supercars-2019-cars-low-rider-tuning.jpg",
        price: "10,000,000",
        type: "Acura TLX Spec A",
        desc:
            "The Venza was equipped with vehicle stability control,traction control system, electronic brakeforce distribution,emergency brake assist, anti-lock braking system, smart stop technology as well as hill-start assist control, tire-pressure monitoring system, active head restraints for front-seat occupants, 3-point seat .",
        location: "Negotiable"),
    EstateModel(
        image:
            "https://www.autospies.com/images/users/Agent009/main/caliber-6016.jpg",
        price: "3,000,000",
        type: "Negotiable",
        desc:
            "The Venza was equipped with vehicle stability control,traction control system, electronic brakeforce distribution,emergency brake assist, anti-lock braking system, smart stop technology as well as hill-start assist control, tire-pressure monitoring system, active head restraints for front-seat occupants, 3-point seat ."),
    EstateModel(
        image:
            "https://www.carscoops.com/wp-content/uploads/2014/06/Tesla-1.jpg",
        price: "3,000,000",
        type: "Tesla Model S",
        desc:
            "The Venza was equipped with vehicle stability control,traction control system, electronic brakeforce distribution,emergency brake assist, anti-lock braking system, smart stop technology as well as hill-start assist control, tire-pressure monitoring system, active head restraints for front-seat occupants, 3-point seat .",
        location: "Negotiable"),
  ];

  bool canCheckBiometric = false;
  String authorizedOrNot = "Not Authorized";
  bool isEnable = false;
  List<BiometricType> availableBiometricType = [];
  String isPinEnabled;
  String myPin;

  void checkBiometrics(LocalAuthentication authentication) async {
    bool canCheck = false;
    try {
      canCheck = await authentication.canCheckBiometrics;
      if (canCheck) {
        canCheckBiometric = canCheck;
        availableBiometricType = await authentication.getAvailableBiometrics();
        notifyListeners();
      } else {
        canCheckBiometric = canCheck;
        notifyListeners();
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }

  // void getListOfBiometrics(LocalAuthentication authentication) async {
  //   try {
  //     availableBiometricType = await authentication.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //   notifyListeners();
  // }

  void signOut() async {
    Get.offUntil(GetPageRoute(page: () => LoginPage()), (route) => false);
    this.counter = 0;
    this.counterIn = 0;
    this.counterT = 0;
    this.imagefile = null;
    this.clientID = '';
    this.sessionID = '';
    this.accountManager = null;
    this.wallet = null;
    this.bankItem = bankList[0];
    this.myProfile = null;
    this.customerHistory.clear();
    this.recentWallet.clear();
    this.allWalletList.clear();
    this.transort.clear();
    this.transortAllWallet.clear();
    this.transortWallet.clear();
    this.email = '';
    this.isClicked = true;
    this.pageIndex = 0;
    this.dashBoardPage = 0;
    this.index = 1;
    this._authData.clear();
    this._complete.clear();
    notifyListeners();
  }

  void hideMoney(index) {
    this.isMoneyHidden = index;
    notifyListeners();
  }

  void airtimeData(index) {
    isClicked = index;
    notifyListeners();
  }

  void changeNetworkType(index) {
    this.networkType = index;
    notifyListeners();
  }

  void selectPlan(index, num) {
    this.datum = index;
    this.selectedNumber = num;
    notifyListeners();
  }

  void executeAirtime(String number, String amount) async {
    if (amount.isNotEmpty && int.tryParse(amount) > 9) {
      if (number.trim() != '') {
        // notifyTrue();
        var response = await http.post(
          Uri.parse('https://api.flutterwave.com/v3/bills'),
          headers: Api(this.clientID).getHeader(),
          body: json.encode({
            "country": "NG",
            "customer": number,
            "amount": int.tryParse(amount),
            "recurrence": "ONCE",
            "type": "AIRTIME",
            "reference": genReference()
          }),
        );

        if (response.statusCode == 200) {
          final airtimeModel =
              AirtimeModel.fromJson(json.decode(response.body));
          if (airtimeModel.status == "success")
            return Get.snackbar(
                '${airtimeModel.status}', 'Airtime Purchase Successful',
                colorText: Colors.white, backgroundColor: Color(0xff0272BA));
          else
            return Get.snackbar(
                '${airtimeModel.status}', 'Airtime Purchase Not Successful',
                colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        }
        // notifyFalse();
      }
      return Get.snackbar('Error', 'Enter a valid Number',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
    }
    return Get.snackbar('Error', 'Airtime Amount must be greater than 10',
        colorText: Colors.white, backgroundColor: Color(0xff0272BA));
  }

  void executeData(number) async {
    var response = await http.post(
      Uri.parse('https://api.flutterwave.com/v3/bills'),
      headers: Api(this.clientID).getHeader(),
      body: json.encode({
        "country": "NG",
        "customer": number,
        "amount": this.datum.amount,
        "recurrence": "ONCE",
        "type": this.datum.billerName,
        "reference": genReference()
      }),
    );
    if (response.statusCode == 200) {
      final data = DataResponseModel.fromJson(json.decode(response.body));
      this.selectedNumber = -1;
      datum = null;
      if (data.status == "success") {
        return Get.snackbar('${data.status}', 'Airtime Purchase Successful',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
      } else
        return Get.snackbar('${data.status}', 'Airtime Purchase Not Successful',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
    }
  }

  void executeCableTv(smartCardNumber) async {
    var response = await http.post(
      Uri.parse('https://api.flutterwave.com/v3/bills'),
      headers: Api(this.clientID).getHeader(),
      body: json.encode({
        "country": "NG",
        "customer": smartCardNumber,
        "amount": this.tvData.amount,
        "recurrence": "ONCE",
        "type": this.tvData.billerName,
        "reference": genReference()
      }),
    );
    if (response.statusCode == 200) {
      final data = DataResponseModel.fromJson(json.decode(response.body));
      this.selectedNumber = -1;
      datum = null;
      if (data.status == "success") {}
    }
  }

  void executePower(meterNumber) async {
    var response = await http.post(
      Uri.parse('https://api.flutterwave.com/v3/bills'),
      headers: Api(this.clientID).getHeader(),
      body: json.encode({
        "country": "NG",
        "customer": meterNumber,
        "amount": this.powerData.amount,
        "recurrence": "ONCE",
        "type": this.powerData.billerName,
        "reference": genReference()
      }),
    );
    if (response.statusCode == 200) {
      final data = DataResponseModel.fromJson(json.decode(response.body));
      this.selectedNumber = -1;
      datum = null;
      if (data.status == "success") {}
    }
  }

  void getDataBundleList() async {
    var response = await http.get(
        Uri.parse(
            'https://api.flutterwave.com/v3/bill-categories?data_bundle=1'),
        headers: Api(this.clientID).getHeader());
    if (response.statusCode == 200) {
      dataListItem = DataListModel.fromJson(json.decode(response.body)).data;
      notifyListeners();
    }
  }

  void getTvCableList() async {
    var response = await http.get(
        Uri.parse('https://api.flutterwave.com/v3/bill-categories?cables=1'),
        headers: Api(this.clientID).getHeader());
    if (response.statusCode == 200) {
      tvDataList = TvModel.fromJson(json.decode(response.body))
          .data
          .where((element) => element.country == "NG")
          .toList();
      tvData = tvDataList[0];
      notifyListeners();
    }
  }

  void getPowerList() async {
    var response = await http.get(
        Uri.parse('https://api.flutterwave.com/v3/bill-categories?power=1'),
        headers: Api(this.clientID).getHeader());
    if (response.statusCode == 200) {
      powerDataList = PowerModel.fromJson(json.decode(response.body))
          .data
          .where((element) => element.country == "NG")
          .toList();
      powerData = powerDataList[0];
      print(powerDataList.length);
      notifyListeners();
    }
  }

  void selectedTv(index) {
    this.tvData = index;
    notifyListeners();
  }

  void selectedPower(index) {
    this.powerData = index;
    notifyListeners();
  }

  void changeIsScrolling(index) {
    this.isScrolling = index;
    notifyListeners();
  }

  List<String> catergory = [
    '12% ROI One time investment(cashout capital + interest)',
    '48% ROI in 3 months',
    'Recurrent payouts\n15% ROI each for month for 3 months'
  ];

  List<String> bankList = [
    'Access Bank Plc',
    'CitiBank Nigeria Limited',
    'Ecobank Nigeria Limited',
    'fidelity Bank Plc',
    'first City Momentum Bank Limited',
    'first Bank Of Nigeria Limited',
    'Guaranty Trust Bank Plc',
    'Keystone Bank Limited',
    'Polaris Bank',
    'Stanbic IBTC Bank Plc',
    'Standard Charted',
    'Sterling Bank Plc',
    'United Bank Of Africa',
    'Union Bank Of Nigeria Plc',
    'Unity Bank Plc',
    'Wema Bank Plc',
    'Zenith Bank',
  ];

  List<String> title = [
    'We Provide Genuine Investment',
    'Real Estate',
    'Bill Payment',
  ];

  List<String> subTitle = [
    'Let’s earn you money with expert tradingin finanical instrument with high liquidity and short-term maturities',
    'Making life easy with PJC empire secure a property today with pjc real estate',
    'you can now Recharge and buy data  and make bill payments on the pjc App'
  ];

  void changeIndex(index) {
    this.index = index;
    notifyListeners();
  }

  void changePhoneNumberIndex(index) {
    this.isPhoneNumberValid = index;
    notifyListeners();
  }

  void changeDashBoardIndex(index) {
    this.dashBoardPage = index;
    notifyListeners();
  }

  void changePageIndex(index) {
    this.pageIndex = index;
    notifyListeners();
  }

  void changeSearchIndex(index) {
    this.pageIndex = index;
    notifyListeners();
  }

  void changeOnSelectedCompleteBankItem(index) {
    this.completePro = index;
    notifyListeners();
  }

  void changeOnFocus(index) {
    this.onFocus = index;
    notifyListeners();
  }

  void changeOnSelectedItem(index) {
    this.selectedItem = index;
    notifyListeners();
  }

  void changeOnSelectedBankItem(index) {
    this.bankItem = index;
    notifyListeners();
  }

  void changeOnphonrNumber(index) {
    this.phoneNo = index;
    notifyListeners();
  }

  void changeObscure() {
    if (isObsure == true) {
      isObsure = false;
    } else if (isObsure == false) {
      isObsure = true;
    }
    notifyListeners();
  }

  void changeIsmale(index) {
    isMale = index;
    if (isMale == index) {
      gender = 'Male';
      isfemale = false;
      notifyListeners();
    }
  }

  void changeisfemale(index) {
    isfemale = index;
    if (isfemale == index) {
      gender = 'Female';
      isMale = false;
      notifyListeners();
    }
  }

  void changeImageIndex(index) {
    imagefile = index;
    notifyListeners();
  }

  void addContacts(contactList) {
    this.contactList = contactList;
    notifyListeners();
  }

//DONE
  Future<Wallet> getWallet(_clientID) async {
    final response = await http.Client()
        .get(Uri.parse(Api(_clientID).getWallet()))
        .timeout(Duration(seconds: 7), onTimeout: () {
      isLoading = false;
      notifyListeners();
      Get.snackbar('Error', 'Time Out Check Internet connection',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
      return null;
    });
    if (response.statusCode == 200) {
      wallet = Wallet.fromRawJson(response.body);
      if (wallet != null) {
        notifyListeners();
        return wallet;
      }
    }
    return null;
  }

  handlePaymentInitialization(amount, context) async {
    if (amount > 1000) {
      final flutterwave = Flutterwave.forUIPayment(
          context: context,
          publicKey: Api(this.clientID).getPublicKey(),
          encryptionKey: Api(this.clientID).getEncryptionKey(),
          currency: FlutterwaveCurrency.NGN,
          amount: amount.toString(),
          email: this.email,
          fullName: this.completeName,
          txRef: genReference(),
          isDebugMode: false,
          acceptCardPayment: true,
          acceptUSSDPayment: true,
          acceptAccountPayment: true,
          phoneNumber: '${myProfile.phone}');
      try {
        final response = await flutterwave.initializeForUiPayments();
        if (response == null) {
          // user didn't complete the transaction. Payment wasn't successful.
        } else {
          if (response.data.status == 'successful') {
            fundWallet(response);
          } else {
            print(response.message);
            // check status
            print(response.status);
            // push to server
            fundWallet(response);
            // check processor error
            print(response.data.processorResponse);
          }
        }
      } catch (error, stacktrace) {
        // handleError(error);
        print(stacktrace);
      }
    } else
      Get.snackbar('Error', 'Ammount Must be greater than 1000',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
  }

//DONE
  Future<Profile> getUsersDetails(_clientID) async {
    final response =
        await http.Client().get(Uri.parse(Api(_clientID).getUserDetails()));
    if (response.statusCode == 200) {
      UserDetails userDetails = UserDetails.fromRawJson(response.body);
      myProfile = userDetails.profile[0];
      this.bankItem = myProfile.bank;
      completeName = userDetails.profile[0].firstname +
          ' ' +
          userDetails.profile[0].lastname;
      bankItem = userDetails.profile[0].bank == null
          ? 'Access Bank Plc'
          : userDetails.profile[0].bank;
      if (myProfile != null) {
        if (myProfile.gender == 'Male') {
          isMale = true;
          isfemale = false;
        } else {
          isfemale = true;
          isMale = false;
        }
        return myProfile;
      }
    }
    return null;
  }

  void validateData(email, password, context) {
    if (GetUtils.isEmail(email) && email.isNotEmpty) {
      if (password.isNotEmpty) {
        notifyTrue();
        getData(email, password, context, true);
      } else
        _showSnackBar('Error', 'Password field must not be empty..');
    } else
      _showSnackBar('Error', 'Provide a valid e-mail address..');
  }

  void validateDetails(email, password, conPass, context) {
    if (GetUtils.isEmail(email) && email.isNotEmpty) {
      if (password.isNotEmpty && conPass.isNotEmpty) {
        if (password.length > 6) {
          if (conPass == password) {
            _authData['email'] = email.toString().trim();
            _authData['password'] = password.toString().trim();
            registerData(email, password, context);
          } else
            _showSnackBar('Error', 'Password doesn\'t match..');
        } else
          return _showSnackBar(
              'Error', 'Password must be more than 6 characters');
      } else
        _showSnackBar('Error', 'Password field must not be empty..');
    } else
      _showSnackBar('Error', 'Provide a valid e-mail address..');
  }

  //DONE
  getData(email, password, context, bool type) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final response = await http.Client().post(Uri.parse(Api(null).getLogin()),
          body: {
            'email': '${email.trim()}',
            'password': '${password.trim()}'
          }).timeout(Duration(seconds: 16), onTimeout: () {
        notifyFalse();
        Get.snackbar('Error', 'Time Out Check Internet connection',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        return;
      });
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        if (parsed['description'] == 'Login Successful.') {
          //---------------------------------------------
          preferences.setString("user", email).then((value) => print(value));
          preferences.setString("pass", password).then((value) => print(value));
          isPinEnabled = (preferences.getString("userpin") ?? '');
          //---------------------------------------------
          getUsersDetails(parsed['client_id']);
          this.email = email;
          this.clientID = parsed['client_id'];
          this.sessionID = parsed['sessionId'];
          this.isLoading = false;
          //LocalStorage('data').setItem('new', true);
          notifyListeners();

          getWallet(parsed['client_id']);
          getWalletActivity(parsed['client_id']);
          getInvestMentActivity(parsed['client_id']);
          getAllWalletList(parsed['client_id']);
          // getDataBundleList();
          // getTvCableList();
          // getPowerList();

          if (parsed['profile_complete'] == true && parsed['firstname'] != '') {
            if (type) {
              if (isPinEnabled != '') {
                Get.offUntil(
                    GetPageRoute(page: () => PinScreen()), (route) => false);
              } else {
                Get.offUntil(
                    GetPageRoute(page: () => CreatePin()), (route) => false);
              }
            } else
              Get.offUntil(
                  GetPageRoute(page: () => DashBoard()), (route) => false);
          } else
            Get.to(() => CompleteProfile());
        } else {
          notifyFalse();
          return _showSnackBar('Error', '${parsed['description']}');
        }
      } else {
        notifyFalse();
        return _showSnackBar(
            'Error', '${response.statusCode} ${response.body}');
      }
    } on SocketException {
      notifyFalse();
      _showSnackBar('Error', 'You are not connected to internet"');
    }
    return null;
  }

  getOnFingerPrint(context) async {
    notifyTrue();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = (prefs.getString("user") ?? '');
    String pass = (prefs.getString("pass") ?? '');
    if (user != '' && pass != '') {
      getData(user, pass, context, false);
    }
  }

  //DONE
  registerData(email, password, context) async {
    try {
      notifyTrue();
      final response =
          await http.Client().post(Uri.parse(Api(null).getRegister()), body: {
        'email': '${email.trim()}',
        'password': '${password.trim()}',
        'platform': Platform.isIOS ? 'IOS' : 'Android'
      }).timeout(Duration(seconds: 7), onTimeout: () {
        notifyFalse();
        Get.snackbar('Error', 'Time Out Check Internet connection',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        return null;
      }).whenComplete(() async {
        final resp = await http.Client().post(Uri.parse(Api(null).getLogin()),
            body: {
              'email': '${email.trim()}',
              'password': '${password.trim()}'
            });
        if (resp.statusCode == 200) {
          final parsed = json.decode(resp.body);
          if (parsed['description'] == 'Login Successful.') {
            this.email = email;
            this.clientID = parsed['client_id'];
            notifyListeners();
          }
        }
      });
      if (response.statusCode == 200) {
        notifyFalse();
        final parsed = json.decode(response.body);
        if (parsed['description'].contains('Registration done Successfully')) {
          this.email = email.toString().trim();
          notifyListeners();
          Get.to(() => CompleteProfile());
        } else {
          notifyFalse();
          return _showSnackBar('Error', '${parsed['description']}');
        }
      } else {
        notifyFalse();
        return _showSnackBar('Error', '${response.body}');
      }
    } on SocketException {
      notifyFalse();
      return _showSnackBar('Error', 'You are not connected to internet"');
    }
    return null;
  }

  void notifyTrue() {
    isLoading = true;
    notifyListeners();
  }

  void notifyFalse() {
    isLoading = false;
    notifyListeners();
  }

  completeDetails_1(firstname, lastname, address, email) async {
    //===============================================================
    if (firstname.isNotEmpty) {
      _complete['firstname'] = firstname;
    } else
      return Get.snackbar('Error', 'firstname field must not be empty.',
          backgroundColor: Color(0xff0272BA));
    //===============================================================

    if (firstname.isNotEmpty) {
      _complete['lastname'] = lastname;
    } else
      return Get.snackbar('Error', 'lastname field must not be empty.',
          backgroundColor: Color(0xff0272BA));
    //==============================================================

    if (address.isNotEmpty) {
      _complete['address'] = address;
    } else
      return Get.snackbar('Error', 'address field must not be empty.',
          backgroundColor: Color(0xff0272BA));

    _complete['gender'] = gender;
    _complete['email'] = email;
    return changeIndex(2);
  }

  completeDetails_2(phoneNo, bankName, accountName, accountNumber) async {
    //=============================================================
    if (phoneNo.isNotEmpty) {
      _complete['phone'] = this.phoneNo;
    } else
      return Get.snackbar('Error', 'Enter a valid phone number',
          backgroundColor: Color(0xff0272BA));
    //==============================================================

    if (accountName.isNotEmpty) {
      _complete['account_name'] = accountName;
    } else
      return Get.snackbar('Error', 'Account Name field must not be empty.',
          backgroundColor: Color(0xff0272BA));
    //==============================================================

    if (accountNumber.isNotEmpty) {
      _complete['account_no'] = accountNumber;
    } else
      return Get.snackbar('Error', 'Account Number field must not be empty.',
          backgroundColor: Color(0xff0272BA));
    //==============================================================

    _complete['bank'] = this.completePro;
    _complete['client_id'] = this.clientID;
    postData();
  }

  //DONE
  postData() async {
    notifyTrue();
    try {
      final response = await http.Client()
          .post(Uri.parse(Api(this.clientID).getUpdateProfile()),
              body: _complete)
          .timeout(Duration(seconds: 7), onTimeout: () {
        notifyFalse();
        Get.snackbar('Error', 'Connection TimeOut..',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        return null;
      });
      if (response.statusCode == 200) {
        changeIndex(1);
        notifyFalse();
        final parsed = json.decode(response.body);
        if (parsed['description'] ==
            'Profile updated successfully.. Logout to take effect') {
          Get.snackbar('Message', 'Account created..',
              colorText: Colors.white, backgroundColor: Color(0xff0272BA));
          //     //----------------------------------
          // getUsersDetails(parsed['client_id']);
          // notifyListeners();
          // getWallet(parsed['client_id']);
          // getWalletActivity(parsed['client_id']);
          // getInvestMentActivity(parsed['client_id']);
          // getAllWalletList(parsed['client_id']);
          // //---------------------------------------------------
          return Get.offUntil(
              GetPageRoute(page: () => LoginPage()), (route) => false);
        }
      }
      notifyFalse();
      _showSnackBar('Error', '${response.statusCode} ${response.body}');
    } on SocketException {
      notifyFalse();
      _showSnackBar('Error', 'You are not connected to internet');
    }
  }

  //DONE
  makeInvestMent(amount, description) async {
    if (amount <= 0) {
      Get.snackbar('Error', 'Amount is empty',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
      return Get.to(() => AddMoney());
    }

    if (description.toString() == "") {
      return Get.snackbar('Error', 'Description is empty',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
    }

    if (wallet.availBalance == 0) {
      Get.snackbar('Error', 'Insufficient wallet fund',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
      return Get.to(() => AddMoney());
    }

    if (wallet.availBalance < amount) {
      Get.snackbar('Error', 'You don\'t have up to that in your wallet',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
      return Get.to(() => AddMoney());
    }

    try {
      notifyTrue();
      final response = await http.Client()
          .post(Uri.parse(Api(this.clientID).getMakeInvestment()), body: {
        'amount': amount.toString(),
        'duration': selectedItem ==
                '12% ROI One time investment(cashout capital + interest)'
            ? 0
            : selectedItem == '48% ROI in 3 months'
                ? 1
                : 2,
        'description': description,
        'userID': clientID
      }).timeout(Duration(seconds: 7), onTimeout: () {
        notifyFalse();
        Get.snackbar('Error', 'Time Out Check Internet connection',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        return null;
      });
      if (response.statusCode == 200) {
        notifyFalse();
        final parsed = json.decode(response.body);
        this.wallet.availBalance = wallet.availBalance - int.tryParse(amount);
        this.wallet.totalInvest = (wallet.totalInvest == null
                ? 0
                : int.tryParse(wallet.totalInvest) + int.tryParse(amount))
            .toString();
        this.dashBoardPage = 0;
        notifyListeners();
        getInvestMentActivity(clientID);
        Get.snackbar('Message', '${parsed['description']}',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        return Get.offUntil(
            GetPageRoute(page: () => DashBoard()), (route) => false);
      } else {
        notifyFalse();
        return _showSnackBar(
            'Error', '${response.statusCode} ${response.body}');
      }
    } on SocketException {
      notifyFalse();
      return _showSnackBar('Error', 'You are not connected to internet');
    }
  }

  //DONE
  updateProfile(mapData) async {
    mapData['client_id'] = clientID;
    mapData['bank'] = bankItem;
    // Profile profile = Profile.fromRawJson(mapData);
    // print(mapData);
    try {
      notifyTrue();
      final response = await http.Client()
          .post(Uri.parse(Api(this.clientID).getUpdateProfile()), body: mapData)
          .timeout(Duration(seconds: 7), onTimeout: () {
        notifyFalse();
        Get.snackbar('Error', 'Time Out Check Internet connection',
            colorText: Colors.black, backgroundColor: Color(0xff0272BA));
        return null;
      });
      if (response.statusCode == 200) {
        notifyFalse();
        final parsed = json.decode(response.body);
        if (parsed['description'] ==
            'Profile updated successfully.. Logout to take effect') {
          this.myProfile = Profile(
              id: clientID,
              firstname: mapData['firstname'],
              lastname: mapData['lastname'],
              gender: mapData['gender'],
              phone: mapData['phone'],
              address: mapData['address'],
              bank: mapData['bank'],
              email: mapData['email'],
              accountName: mapData['account_name'],
              accountNo: mapData['account_no']);
          notifyListeners();
          Get.back();
          return _showSnackBar('Success', 'Profile updated successfully');
        }
      }
      notifyFalse();
      return response.statusCode.toString();
    } on SocketException {
      notifyFalse();
      return _showSnackBar('Error', 'You are not connected to internet');
    }
  }

  //DONE
  Future<List<WalletRecentElement>> getWalletActivity(_clientID) async {
    final response =
        await http.Client().get(Uri.parse(Api(_clientID).getWalletActivity()));
    if (response.statusCode == 200) {
      WalletRecent walletRecent = new WalletRecent.fromRawJson(response.body);
      this.recentWallet = walletRecent.walletRecent;
      notifyListeners();
      getSortWallet(walletRecent.walletRecent);
      return walletRecent.walletRecent;
    } else
      _showSnackBar('Error', '${response.statusCode} ${response.body}');
    return [];
  }

  //DONE
  Future<List<Customers>> getAllWalletList(_clientID) async {
    final response =
        await http.Client().get(Uri.parse(Api(_clientID).getAllWalletList()));
    if (response.statusCode == 200) {
      WalletListModel walletModel = WalletListModel.fromRawJson(response.body);
      this.allWalletList = walletModel.customer;
      notifyListeners();
      getSortAllWallet(this.allWalletList);
      return walletModel.customer;
    } else
      _showSnackBar('Error', '${response.statusCode} ${response.body}');
    return [];
  }

//DONE
  Future<List<CustomerHistory>> getInvestMentActivity(_clientID) async {
    final response = await http.Client()
        .get(Uri.parse(Api(_clientID).getInvestMentActivity()));
    if (response.statusCode == 200) {
      InvestmentHistory investmentHistory =
          new InvestmentHistory.fromRawJson(response.body);
      this.customerHistory = investmentHistory.customer;
      notifyListeners();
      getSort(investmentHistory.customer);
      return investmentHistory.customer;
    }
    return [];
  }

//DONE
  Future<Customer> getAccountOfficer(_clientID) async {
    final response = await http.Client()
        .get(Uri.parse(Api(this.clientID).getAccountManager()));
    if (response.statusCode == 200) {
      this.accountManager = AccountManager.fromRawJson(response.body);
      return (accountManager.customer[0]);
    }
    return null;
  }

//DONE
  fundWallet(ChargeResponse chargeResponse) async {
    try {
      notifyTrue();
      final response = await http.Client()
          .post(Uri.parse(Api(this.clientID).getFundWallet()), body: {
        'referenceNumber': chargeResponse.data.txRef,
        'amount': chargeResponse.data.amount,
        'description': 'Quick Funding',
        'userID': clientID
      }).timeout(
        Duration(seconds: 7),
        onTimeout: () {
          notifyFalse();
          Get.snackbar('Error', 'Time Out Check Internet connection',
              colorText: Colors.white, backgroundColor: Color(0xff0272BA));
          return null;
        },
      );
      if (response.statusCode == 200) {
        final parsed = json.decode(response.body);
        if (parsed['description'] == "Wallet Credited Successfully.") {
          notifyFalse();
          if (chargeResponse.data.status == FlutterwaveConstants.SUCCESSFUL) {
            this.wallet.availBalance =
                wallet.availBalance + int.tryParse(chargeResponse.data.amount);
            notifyListeners();
          }
          getWalletActivity(clientID);
          Get.snackbar('Success', '${parsed['description']}',
              colorText: Colors.white, backgroundColor: Color(0xff0272BA));
          return Get.offUntil(
              GetPageRoute(page: () => DashBoard()), (route) => false);
        }
      } else
        return _showSnackBar('Error', '${response.body}');
    } on SocketException {
      notifyFalse();
      return _showSnackBar('Error', 'You are not connected to internet');
    }
  }

//=========================SORT INVESTMENTS================================================
  void updateSortInvestIncrement() {
    if (counterIn < this.transort.length - 1) {
      this.counterIn++;
      notifyListeners();
    }
  }

  void updateSortInvestDecrement() {
    if (counterIn > 0) {
      this.counterIn--;
      notifyListeners();
    }
  }

  void getSort(List<CustomerHistory> customer) {
    for (CustomerHistory customerHis in customer) {
      if (this.transort.contains(customerHis.status)) {
        this.transort.add(customerHis.status);
      }
    }
    notifyListeners();
  }
//=========================================================================

//===============================SORT DASHBOARD WALLET===========================================
  void updateSortIncrement() {
    if (counter < this.transortWallet.length - 1) {
      this.counter++;
      notifyListeners();
    }
  }

  void updateSortDecrement() {
    if (counter > 0) {
      this.counter--;
      notifyListeners();
    }
  }

  void getSortWallet(List<WalletRecentElement> walletRecentElement) {
    for (WalletRecentElement walletRecentElem in walletRecentElement) {
      if (!this.transortWallet.contains(walletRecentElem.status)) {
        this.transortWallet.add(walletRecentElem.status);
      }
    }
    notifyListeners();
  }
//============================================================================

//==================================SORT WALLETLIST==========================================

  void updateSortTransIncrement() {
    if (counterT < this.transortAllWallet.length - 1) {
      counterT++;
      notifyListeners();
    }
  }

  void updateSortTransDecrement() {
    if (counterT > 0) {
      counterT--;
      notifyListeners();
    }
  }

  void getSortAllWallet(List<Customers> allWalletList) {
    for (Customers walletRecentElem in allWalletList) {
      if (!this.transortAllWallet.contains(walletRecentElem.status)) {
        this.transortAllWallet.add(walletRecentElem.status);
      }
      notifyListeners();
    }
  }

//============================================================================
  String genReference() =>
      '${Random().nextInt(99999093)}${DateTime.now().microsecondsSinceEpoch}${Random().nextInt(99999093)}';

  _showSnackBar(type, message) => Get.snackbar('$type', '$message',
      colorText: Colors.white, backgroundColor: Color(0xff0272BA));

  //DONE
  withDrawal(amount) async {
    if (amount > wallet.availBalance) {
      return Get.snackbar('Error', 'You don\'t up to that in your wallet',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
    }

    if (wallet.availBalance == 0) {
      return Get.snackbar('Error', 'Wallet is Empty',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
    }

    try {
      notifyTrue();
      final response = await http.Client()
          .post(Uri.parse(Api(this.clientID).getWithDrawal()), body: {
        'userid': this.clientID,
        'amount': amount.toString().trim()
      }).timeout(Duration(seconds: 7), onTimeout: () {
        notifyFalse();
        Get.snackbar('Error', 'Time Out Check Internet connection',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
        return null;
      });
      if (response.statusCode == 200) {
        notifyFalse();
        final parsed = json.decode(response.body);
        if (parsed["description"] == "Payout Requested Successfully.") {
          getWalletActivity(clientID);
          Get.offUntil(GetPageRoute(page: () => DashBoard()), (route) => false);
        }
        return Get.snackbar('Success', 'Payout Requested Successfully.',
            colorText: Colors.white, backgroundColor: Color(0xff0272BA));
      }
      notifyFalse();
      return _showSnackBar('Error', '${response.statusCode} ${response.body}');
    } on SocketException {
      notifyFalse();
      return _showSnackBar('Error', 'You are not connected to internet');
    }
  }

  onRefreshData(RefreshController refreshController) async {
    //==========================Check for profile=============================
    if (myProfile == null) {
      myProfile = await getUsersDetails(this.clientID)
          .timeout(Duration(seconds: 60), onTimeout: () {
        refreshController.loadFailed();
        return null;
      });
      if (myProfile != null) notifyListeners();
    }
    //=========================Check for wallet list limit====================
    if (recentWallet == null || recentWallet.length == 0) {
      recentWallet = await getWalletActivity(this.clientID)
          .timeout(Duration(seconds: 60), onTimeout: () {
        refreshController.loadFailed();
        return null;
      });
      if (recentWallet != null || recentWallet.length > 0) notifyListeners();
    }
    //===========================Check for wallet=============================
    if (wallet == null ||
        wallet.availBalance == 0 ||
        wallet.totalInvest == null) {
      wallet = await getWallet(this.clientID).timeout(Duration(seconds: 60),
          onTimeout: () {
        refreshController.loadFailed();
        return null;
      });
      if (wallet != null) notifyListeners();
    }
    //=========================Check for All Wallet List======================
    if (allWalletList == null || allWalletList.length == 0) {
      allWalletList = await getAllWalletList(this.clientID)
          .timeout(Duration(seconds: 90), onTimeout: () {
        refreshController.loadFailed();
        return null;
      });
      if (allWalletList != null || allWalletList.length > 0) notifyListeners();
    }
    //==========================Check for investment List=====================
    if (customerHistory != null || customerHistory.length == 0) {
      customerHistory = await getInvestMentActivity(this.clientID)
          .timeout(Duration(seconds: 60), onTimeout: () {
        refreshController.loadFailed();
        return null;
      });
      if (customerHistory != null || customerHistory.length > 0)
        notifyListeners();
    }
    refreshController.refreshCompleted();
  }

//DONE
  forgetPassword(email) async {
    if (email.toString().isNotEmpty) {
      try {
        notifyTrue();
        final response = await http.Client()
            .post(Uri.parse(Api(this.clientID).getForgotPassword()), body: {
          'email': email.toString().trim()
        }).timeout(Duration(seconds: 20), onTimeout: () {
          Get.snackbar('Error', 'Connection TimeOut',
              colorText: Colors.white, backgroundColor: Color(0xff0272BA));
          notifyFalse();
          return null;
        });
        if (response.statusCode == 200) {
          Get.snackbar('Message', 'Link has been sent to this e-mail Address',
              colorText: Colors.white, backgroundColor: Color(0xff0272BA));
          notifyFalse();
        }
        return null;
      } on SocketException {
        notifyFalse();
        return _showSnackBar('Error', 'You are not connected to internet"');
      }
    } else
      Get.snackbar('Error', 'E-mail Address Required..',
          colorText: Colors.white, backgroundColor: Color(0xff0272BA));
  }

  void checkEnableData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user = (prefs.getString("user") ?? '');
    String pass = (prefs.getString("pass") ?? '');
    if (user != '' && pass != '') {
      isEnable = true;
      notifyListeners();
    }
  }

  void checkIfPinIsset() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    isPinEnabled = (sharedPref.getString(Api.pin) ?? '');
    notifyListeners();
  }

  void createPin(index) {
    this.myPin = index;
    notifyListeners();
  }
  //{code: 1, description: Registration done Sucot be emcessfully.}
  //{code: 0, description: User with this email already exist.}

//   amount30000
// No Coma

  // static Future<String> getAccessCode(skTest, _getRef, price, email) async {
  //   Map<String, String> header = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Authorization': 'Bearer $skTest'
  //   };
  //   Map data = {'amount': price, 'email': email, 'reference': _getRef};
  //   String payLoad = json.encode(data);
  //   final responseData = await http.post(
  //       Uri.parse('https://api.paystack.co/transaction/initialize'),
  //       headers: header,
  //       body: payLoad);
  //   final Map parsed = jsonDecode(responseData.body);
  //   print(parsed);
  //   return parsed['data']['access_code'];
  // }

  // chargeCard(amount, context, email, type, plugin) async {
  //   if (amount.isNotEmpty && amount.trim().isNotEmpty) {
  //     Charge charge = Charge();
  //     charge.putCustomField('Charged From', 'Pjc Empire');
  //     charge.amount = int.parse('${amount}00');
  //     charge.reference = '$genReference';
  //     charge.email = email.toString();
  //     if (type != 'card')
  //       charge.accessCode = await getAccessCode(
  //           _secretKey,
  //           genReference.toString(),
  //           int.parse('${amount}00'),
  //           email.toString());
  //     final responseData = await plugin.checkout(context,
  //         charge: charge,
  //         method: CheckoutMethod.card,
  //         fullscreen: false,
  //         logo: Image.asset('assets/logo.png', height: 60, width: 60));
  //     if (responseData.status == true) {
  //       verifyOnServer(responseData.reference, _secretKey);
  //       return;
  //     }

  //     if (responseData.verify) {
  //       verifyOnServer(genReference, _secretKey);
  //     } else {
  //       print('reference: $genReference \n\ Response: $responseData.message');
  //     }
  //   } else
  //     _showSnackBar('Error', 'Enter amount to invest');
  // }

  // static verifyOnServer(reference, skTest) async {
  //   try {
  //     Map<String, String> headers = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $skTest'
  //     };
  //     final responseData = await http.get(
  //         Uri.parse('https://api.paystack.co/transaction/verify/' + reference),
  //         headers: headers);
  //     final Map body = json.decode(responseData.body);
  //     if (body['data']['status'] == 'success') {
  //       Map<String, dynamic> authData;
  //       authData['transaction_id'] = body['data']['id'].toString();
  //       authData['transaction_reference'] =
  //           body['data']['reference'].toString();
  //       authData['transaction_authorization_code'] =
  //           body['data']['authorization']['authorization_code'].toString();
  //     } else {}
  //   } catch (e) {
  //     print(e);
  //   }
  // }

// duration0
// Short => 0 && Long => 1

// descriptionQuick Funding
// userID

  /**{code: 1, description: Login Successful., client_id: 1, sessionId: 9245622, 
   * profile_complete: true, 
   * firstname: Oyinkansola, lastname: , gender: , address: , phone: ,
   *  client_referral_id: , bank: , account_no: , account_name: , 
   * regdate: 2021-02-28 10:04:29} 
   * 
   * {
   *"code": 1,
   *"description": "Investment Made Successfully."
   *}
   * 
   * 
   * referenceNumberCQTREF102901
amount70000
descriptionQuick Funding
userID1
   * 
   * 
   * 
   * 
   * 
   * */
}
