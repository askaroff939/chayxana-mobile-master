import 'package:chayxana/pages/main/home/booking/booking_page.dart';
import 'package:chayxana/pages/main/home/setting_detail/setting_detail_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:chayxana/views/choose_date_people_count.dart';
import 'package:chayxana/views/choose_room.dart';
import 'package:chayxana/views/common_views.dart';
import 'package:chayxana/views/half_width_btn.dart';
import 'package:chayxana/views/timeline_widget/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingDetailPage extends StatelessWidget {
  static const String id = '/setting_detail_page';

  SettingDetailPage({Key? key}) : super(key: key);
  bool isFull = false;
  bool isDataChanged = false;
  bool isPeopleChanged = false;

  //#to add value to a booking page
  void _goToBookingPage(BuildContext context,
      {required String people,
      required String time,
      required String weekDay,
      required String day,
      required Map<String, dynamic> map,
      required String month}) {
    Get.to(BookingPage(
        people: people, time: time, day: day,  map: map, month: month, weekDay: weekDay,));
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) => BookingPage(
    //             people: people, time: time, day: day, map: map, month: month)));
  }

  void clean(controller, context) {
    controller.clear(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SettingDetailPage()));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingDetailController>(
      init: SettingDetailController(),
      builder: (controller) {
        isFull = controller.isFull();
        return Scaffold(
          appBar: appbar(controller.nowString(), () => controller.goBack()),
          body: SizedBox(
            width: Get.width,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                orderCountPeopleAndMonth(
                  title: "str_guests".tr,
                  itemName: controller.getItem('people').isNotEmpty
                      ? controller.getItem('people')
                      : "str_people_count".tr,
                  selectedItem: (itme) {},
                  items: controller.maxNumberPeople,
                  controller: controller,
                  otherItem: controller.minNumberPeople,
                ),
                customDivider(),
                // timeLine
                Container(
                  height: Get.height * .275,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.borderColor.withOpacity(0.5),
                          width: 1),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      orderCountPeopleAndMonth(
                        title:
                        controller.getItem('month').isNotEmpty
                            ? "data".tr
                            : "str_choose_date".tr,
                        selectedItem: () => controller.chooseMonth,
                        items: controller.months,
                        itemName: controller.getItem('month').isNotEmpty
                            ? controller.getItem('month')
                            : "month".tr,
                        // controller.selectedMonth(
                        //         controller.months[controller.chooseMonth]),
                        controller: controller,
                      ),
                      DatePicker(
                        controller.now,
                        width: Get.width * .175,
                        height: Get.height * .14,
                        dateTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 32,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w600),
                        dayTextStyle: const TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 20,
                            color: AppColors.unSelectedTextColor,
                            fontWeight: FontWeight.w400),
                        locale: controller.locale,
                        selectionColor: AppColors.mainColor,
                        selectedTextColor: AppColors.activeColor,
                        deactivatedColor: AppColors.borderColor,
                        onDateChange: (date) {
                          controller.addDay(date.day);
                          controller.addWeekday(date.weekday.toString());
                        },
                        inactiveDates: [DateTime(2022, 05, 9)],
                        controllerDetail: controller,
                      ),
                    ],
                  ),
                ),
                customDivider(),
                //timeOfWork
                chooseItem(
                    text: "str_choose_time".tr,
                    controller: controller,
                    items: controller.workTime,
                    selectedItem: controller.selectedHour),
                customDivider(),
                //freeRooms

                Container(
                  height: 376,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.borderColor.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(12)),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.rooms.length,
                    itemBuilder: (context, index) {
                      return ChooseRoom(
                          selected: index == controller.selectedRoom,
                          onTap: () => controller.chooseRoom(index),
                          roomNumber: controller.rooms[index][0],
                          maxPeople: controller.rooms[index][2],
                          minPeople: controller.rooms[index][1],
                          price: controller.rooms[index][3]);
                    },
                  ),
                ),

                customDivider(),

                const SizedBox(height: 16),
                controller.isFull()
                    ? const SizedBox(
                        width: 16,
                      )
                    : Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.warning_outlined,
                            size: 23,
                            color: Color.fromRGBO(250, 219, 58, 1),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "booking_caution_mark".tr,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    AppColors.btnColor),),
                            onPressed: () {
                              clean(controller, context);
                            },
                            child: Text(
                              "str_clear".tr,
                              style: const TextStyle(
                                color: AppColors.unSelectedTextColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      isFull
                          ? Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff17B700),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (controller.isFull()) {
                                      _goToBookingPage(
                                        context,
                                        weekDay: controller.getItem('weekDay'),
                                        people: controller.getItem('people'),
                                        time: controller.getItem('time'),
                                        day: controller.getItem('day'),
                                        map: controller.getRooms('rooms'),
                                        month: controller.getItem('month'),
                                      );
                                    }
                                  },
                                  child: Text(
                                    "str_booking".tr,
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: SizedBox(
                                height: 50,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xff17B700),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "str_next".tr,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
