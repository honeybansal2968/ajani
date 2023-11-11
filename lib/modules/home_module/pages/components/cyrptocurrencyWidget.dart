import 'package:ajani/modules/home_module/controller/home_controller.dart';
import 'package:ajani/ui_utils/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CryptoCurrencyWidget extends StatelessWidget {
  const CryptoCurrencyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText.appText(
                text: "Top Cryptocurrencies",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            AppText.appText(
                text: "View All",
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 179, 179, 179),
                    fontWeight: FontWeight.bold,
                    fontSize: 13)),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        GetBuilder<HomeController>(builder: (homeController) {
          return ListView.builder(
              itemCount: homeController.sortedCryptoModel.data!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CryptoItem(
                    name: homeController.sortedCryptoModel.data![index].name!,
                    symbol:
                        homeController.sortedCryptoModel.data![index].symbol!,
                    price: homeController
                        .sortedCryptoModel.data![index].quote!.uSD!.price!,
                    volumeChange24h: homeController.sortedCryptoModel
                        .data![index].quote!.uSD!.volumeChange24h!);
              });
        })
      ],
    );
  }
}

class CryptoItem extends StatelessWidget {
  String name;
  String symbol;
  double price;
  double volumeChange24h;
  CryptoItem(
      {super.key,
      required this.name,
      required this.symbol,
      required this.price,
      required this.volumeChange24h});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/bitcoin.png"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        AppText.appText(
                            text: symbol,
                            textStyle: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        const SizedBox(
                          width: 5,
                        ),
                        volumeChange24h > 0
                            ? Image.asset(
                                "assets/images/profit.png",
                                width: 40,
                              )
                            : Image.asset(
                                "assets/images/loss.png",
                                width: 40,
                              )
                      ],
                    ),
                    AppText.appText(
                        text: name,
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13))
                  ],
                )
              ]),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText.appText(
                          text: "\$${price.toStringAsFixed(4)} USD",
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      AppText.appText(
                          text: volumeChange24h > 0
                              ? "+${volumeChange24h.toStringAsFixed(2)}%"
                              : "-${volumeChange24h.toStringAsFixed(2)}%",
                          textStyle: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
