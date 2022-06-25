import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../pages/main/home/setting_detail/setting_detail_controller.dart';
import '../services/constants/app_colors.dart';

class orderCountPeopleAndMonth<T> extends StatelessWidget {
  final List<T> items;
  T selectedItem;
  final List<T> otherItem;
  final String title;
  final String itemName;
  SettingDetailController controller;

  orderCountPeopleAndMonth({
    required this.controller,
    this.otherItem = const [],
    required this.selectedItem,
    required this.items,
    this.title = '',
    this.itemName = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            ' ${title.tr}',
            style: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 24,
                color: AppColors.unSelectedTextColor,
                fontWeight: FontWeight.w600),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColor, width: 1),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Text(
                  ' ${itemName.tr}',
                  style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 20,
                      color: AppColors.unSelectedTextColor,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 10),
                PopItem(
                  selectedItem: selectedItem,
                  items: items,
                  otherItem: otherItem,
                  controller: controller,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopItem<T> extends StatelessWidget {
  SettingDetailController controller;
  final List<T> items;
  T? selectedItem;
  final List<T> otherItem;

  int value = 0;

  PopItem({
    required this.controller,
    this.otherItem = const [],
    required this.selectedItem,
    required this.items,
    Key? key,
  }) : super(key: key);

  String _time(int index) {
    return DateFormat(
      'MMMM',
    ).format(DateTime(2022, int.parse(controller.months[index].toString())));
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: Colors.transparent,
        offset: const Offset(15, 35),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.arrow_downward,
          color: Color(0xFFC2C2C2),
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem(
              padding: EdgeInsets.only(left: Get.width * .375),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Colors.grey)),
                height: 198,
                width: Get.width * .34,
                child: CupertinoPicker(
                  backgroundColor: Colors.transparent,
                  diameterRatio: 2,
                  looping: true,
                  magnification: 1.3,
                  squeeze: 1.0,
                  useMagnifier: true,
                  itemExtent: 40.0,
                  selectionOverlay: Container(
                    margin: EdgeInsets.symmetric(vertical: Get.height * .005),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        top: BorderSide(
                          width: 1,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
                  // This is called when selected item is changed.
                  onSelectedItemChanged: (int selected) {
                    value = selected;
                  },
                  children: List<Widget>.generate(
                      otherItem.isNotEmpty
                          ? items.length
                          : controller.months.length, (int index) {
                    return Center(
                      child: (otherItem.isNotEmpty)
                          ? Text(
                              '${otherItem[index]}    '
                              '${items[index]}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          : Text(
                              _time(index).tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                    );
                  }),
                ),
              ),
              onTap: () {
                return otherItem.isNotEmpty
                    ? controller.addPeople(
                        items[value].toString(), otherItem[value].toString())
                    : controller.addDateMonth(controller.months[value]);
              },
            ),
          ];
        });
  }
}
