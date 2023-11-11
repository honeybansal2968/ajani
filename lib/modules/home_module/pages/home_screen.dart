import 'package:ajani/modules/home_module/controller/home_controller.dart';
import 'package:ajani/modules/home_module/helper/home_helper.dart';
import 'package:ajani/modules/home_module/pages/components/banner.dart';
import 'package:ajani/modules/home_module/pages/components/cyrptocurrencyWidget.dart';
import 'package:ajani/modules/home_module/pages/components/searchAndFilter.dart';
import 'package:ajani/ui_utils/app_text.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homeController) {
          return homeController.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scaffold(
                  extendBody: true,
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.white,
                    toolbarHeight: 70,
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AppText.appText(
                          text: "EXCHANGES",
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    actions: [
                      Center(
                        child: Stack(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_none_outlined,
                                  size: 24,
                                  color: Colors.black,
                                )),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 8,
                                  minHeight: 8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Icon(
                          Icons.settings,
                          size: 24,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  bottomNavigationBar: Padding(
                    padding:
                        const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                    child: Container(
                      height: 71,
                      padding: const EdgeInsets.symmetric(
                          vertical: 13, horizontal: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromRGBO(11, 11, 11, 1)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NavItem(
                                title: HomeHelper.navItems[0].keys.first,
                                icon: HomeHelper.navItems[0].values.first),
                            NavItem(
                                title: HomeHelper.navItems[1].keys.first,
                                icon: HomeHelper.navItems[1].values.first),
                            Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: const Color.fromARGB(
                                                  255, 208, 188, 0)
                                              .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 10)
                                    ]),
                                child: Image.asset("assets/images/earth.png")),
                            NavItem(
                                title: HomeHelper.navItems[2].keys.first,
                                icon: HomeHelper.navItems[2].values.first),
                            NavItem(
                                title: HomeHelper.navItems[3].keys.first,
                                icon: HomeHelper.navItems[3].values.first)
                          ]),
                    ),
                  ),
                  body: const SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SearchAndFilterWidget(),
                            SizedBox(
                              height: 15,
                            ),
                            BannerWidget(),
                            SizedBox(
                              height: 15,
                            ),
                            CryptoCurrencyWidget()
                          ]),
                    ),
                  ));
        });
  }
}

class NavItem extends StatelessWidget {
  String title;
  IconData icon;
  NavItem({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          height: 3,
        ),
        AppText.appText(
            text: title,
            textStyle: const TextStyle(fontSize: 11, color: Colors.white))
      ],
    );
  }
}
