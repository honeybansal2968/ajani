import 'dart:convert';

import 'package:ajani/models/cryptoModel.dart';
import 'package:ajani/models/logoModel.dart';
import 'package:ajani/modules/home_module/services/home_network_call.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  CryptoModel sortedCryptoModel = CryptoModel();
  updateCryptocurrencies() async {
    final response = HomeNetworkCall.getCryptocurrencies();
    await response.then((value) {
      sortedCryptoModel = CryptoModel.fromJson(jsonDecode(value.body));
      sortByMarketCap();
      getLogo();
      update();
    });
  }

  LogoModel logoModel = LogoModel();
  getLogo() async {
    final response = HomeNetworkCall.getLogo();
    await response.then((value) {
      logoModel = LogoModel.fromJson(jsonDecode(value.body));
      setLoading(false);
      update();
    });
  }

  // data loading handle
  bool isLoading = true;
  setLoading(bool value) {
    isLoading = value;
    update();
  }

  // sorting by price
  sortData() {
    sortedCryptoModel.data!
        .sort(((a, b) => a.quote!.uSD!.price!.compareTo(b.quote!.uSD!.price!)));
    update();
  }
  // sort by market cap
  sortByMarketCap() {
    sortedCryptoModel.data!
        .sort(((a, b) => a.quote!.uSD!.marketCap!.compareTo(b.quote!.uSD!.marketCap!)));
    update();
  }
  // sort by volume24h
  sortByVolume24h() {
    sortedCryptoModel.data!
        .sort(((a, b) => a.quote!.uSD!.volume24h!.compareTo(b.quote!.uSD!.volume24h!)));
    update();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await updateCryptocurrencies();
  }
}
