class Api {
  final clientID;

  static String pin;

  Api(this.clientID);

  getUserDetails() {
    return 'https://theapi.pjcempire.com/routes/profile.php?id=$clientID';
  }

  getRegister() {
    return 'https://theapi.pjcempire.com/routes/register.php';
  }

  getLogin() {
    return 'https://theapi.pjcempire.com/routes/login.php';
  }

  getUpdateProfile() {
    return 'https://theapi.pjcempire.com/routes/update_profile.php';
  }

  getAccountManager() {
    return 'https://theapi.pjcempire.com/routes/admin_staffviewassign.php?userid=$clientID';
  }

  getSecretKey() {
    return 'Bearer FLWSECK_TEST-SANDBOXDEMOKEY-X';
  }

  getHeader() {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'authorization': getSecretKey()
    };
    return header;
  }

  getWallet() {
    return 'https://theapi.pjcempire.com/routes/dashboard_widget.php?userid=$clientID';
  }

  getWalletActivity() {
    return 'https://theapi.pjcempire.com/routes/wallet_list_limit.php?userid=$clientID';
  }

  getAllWalletList() {
    return 'https://theapi.pjcempire.com/routes/wallet_list.php?userid=$clientID';
  }

  getMakeInvestment() {
    return 'https://theapi.pjcempire.com/routes/investment.php';
  }

  getInvestMentActivity() {
    return 'https://theapi.pjcempire.com/routes/investment_list.php?userid=$clientID';
  }

  getFundWallet() {
    return 'https://theapi.pjcempire.com/routes/wallet.php';
  }

//https://testapi.pjcempire.com/routes/wallet.php
  getWithDrawal() {
    return 'https://theapi.pjcempire.com/routes/wallet_withdraw.php';
  }

  getForgotPassword() {
    return 'https://theapi.pjcempire.com/routes/forget_password.php';
  }

  getPublicKey() {
    return 'FLWPUBK-4305cbfbfac59625839beb03a1f02cc9-X';
  }

  getEncryptionKey() {
    return 'f55a82d36434427a42a04e5d';
  }
}
