import 'package:ajani/modules/home_module/controller/home_controller.dart';
import 'package:ajani/ui_utils/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchAndFilterWidget extends StatelessWidget {
  const SearchAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: SizedBox(
            height: 37,
            child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(CupertinoIcons.search,
                        color: Color.fromRGBO(191, 191, 191, 1)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.only(bottom: 7),
                    filled: true,
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 2.0,
                      ),
                    ),
                    fillColor: const Color.fromRGBO(243, 243, 243, 1),
                    hintText: "Search Cryptocurrency",
                    hintStyle: const TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(191, 191, 191, 1)))),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              showFilterDropdown(context);
            },
            style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                elevation: 0,
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(50))),
            child: Row(
              children: [
                const Icon(
                  Icons.filter_list,
                  color: Color.fromRGBO(191, 191, 191, 1),
                  size: 16,
                ),
                const SizedBox(
                  width: 5,
                ),
                AppText.appText(
                    text: "Filter",
                    textStyle: const TextStyle(
                        color: Color.fromRGBO(191, 191, 191, 1), fontSize: 13))
              ],
            ))
      ],
    );
  }

  void showFilterDropdown(BuildContext context) async {
    final RenderBox button = context.findRenderObject() as RenderBox;
    final Offset buttonPosition = button.localToGlobal(Offset.zero);

    await showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        buttonPosition.dx,
        buttonPosition.dy + button.size.height,
        0,
        buttonPosition.dy +
            button.size.height +
            100, // Adjust the height as needed
      ),
      items: [
        PopupMenuItem(
          onTap: () async {
            await Get.find<HomeController>().sortData();
          },
          value: 'sort',
          child: const Text("Sort by price"),
        ),
        PopupMenuItem(
          onTap: () async {
            await Get.find<HomeController>().sortByVolume24h();
          },
          value: 'sort',
          child: const Text("Sort by volumn24h"),
        ),
      ],
      elevation: 8.0,
    );
  }
}
