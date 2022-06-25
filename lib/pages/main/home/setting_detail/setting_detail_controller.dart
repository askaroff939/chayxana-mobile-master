import 'dart:convert';

import 'package:chayxana/models/MyPutClass.dart';
import 'package:chayxana/services/db_service.dart';
import 'package:chayxana/services/dio_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class SettingDetailController extends GetxController {
  bool isGet = true;
  MyPutClass? myPutClass;
  int selectedDate = 0;
  int chooseMonth = 0;
  int? selectedRoom;
  int? selectedHour;
  bool isCome = false;
  bool isCome2 = false;

  Map<String, dynamic> order = {};
  Map<String, dynamic> dataBase = {};
  String locale = DBService.to.getData(StorageKeys.language) ?? 'en';
  DateTime now = DateTime.now();

  List<List> rooms = [];

  List<DateTime> isNotEmpty = [];

  ///get items
  String getItem(String title, [String? id]) {
    String result = "";
    bool bl = true;
    int index = 99;
    if (title == 'month') {
      order.forEach((key, value) async {
        if (key == title && bl) {
          String? res = await NetworkService.GET(
            NetworkService.API_TO_FREE_ROOM,
            "?roomId=$id&num=$value",
          );
          chooseMonth = int.parse(value);
          update();
          if (res != null) {
            Map decodedRes = jsonDecode(res);
            decodedRes['object'].forEach((key, value) {
              if (value == true) {
                isNotEmpty.add(DateTime.parse(key));
              }
            });
          }
          bl = false;
          index = int.parse(value);
          isGet = false;
          update();
        }
      });
      if (index != 99) {
        result = monthget[index - 1].toString();
      }
    } else {
      order.forEach((key, value) {
        if (key == title) {
          result = value;
        }
      });
    }
    print(result);
    return result;
  }

  String getItem2(String title) {
    String result = "";
    int index = 99;
    if (title == 'month') {
      order.forEach((key, value) {
        if (key == title) {
          index = int.parse(value);
        }
      });
      if (index != 99) {
        result = monthget[index - 1].toString();
      }
    }
    return result;
  }

  void fillRooms(int minPerson) {
    myPutClass?.object?.forEach((element) {
      if (element.minPerson! > minPerson) {
        rooms.add([
          element.roomNumber,
          element.minPerson,
          element.maxPerson,
          element.price
        ]);
      }
    });
  }

  void changeIsCome2([bool bl = true]) {
    isCome2 = bl;
    update();
  }

  ///add people
  void addPeople(String min, String max) async {
    rooms = [];
    update();
    order['people'] = "$max - $min";
    String? response =
        await NetworkService.GET(NetworkService.myApi, NetworkService.myParams);
    if (response != null) {
      myPutClass = MyPutClass.fromJson(jsonDecode(response));
      isCome = true;
      fillRooms(int.parse(max));
      update();
    }
    update();
  }

  List<int> maxNumberPeople = [10, 12, 15, 18, 20];
  List<int> minNumberPeople = [6, 8, 10, 12, 15];
  List<String> workTime = [
    '10:00',
    '11:00',
    '12:00',
    '13:30',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00'
  ];
  List<String> monthget = [
    'January'.tr,
    'February'.tr,
    'March'.tr,
    'April'.tr,
    'May'.tr,
    'June'.tr,
    'July'.tr,
    'August'.tr,
    'September'.tr,
    'October'.tr,
    'November'.tr,
    'December'.tr,
  ];

  List<String> weekDay = [
    'Monday'.tr,
    'Tuesday'.tr,
    'Wednesday'.tr,
    'Thursday'.tr,
    'Friday'.tr,
    "Saturday".tr,
    "Sunday".tr,
  ];
  List<String> months =
      List.generate(12, (index) => '${(DateTime.now().month + index) % 12}');

  String nowString() =>
      DateFormat("EEEE d-MMMM", locale).format(now).toUpperCase();

  String selectedMonth(String selectedMonth) {
    DateTime date = DateTime(0, int.parse(selectedMonth));
    return DateFormat("MMMM", locale).format(date).toUpperCase();
  }

  @override
  void onInit() {
    initializeDateFormatting();
    super.onInit();
  }

  void goBack() => Get.back();

  void getBookings() {}

  ///add day
  void addDay(int day) {
    order['day'] = "$day";
    update();
  }

  ///add weekday
  void addWeekday(String weekDay) {
    order['weekDay'] = weekDay;
    update();
  }

  ///add month only
  void addDateMonth(String month) {
    if (monthget.indexOf(month) >
        monthget.indexOf(DateTime.now().month.toString())) {
      order['year'] = DateTime.now().year;
      order['month'] = month;
    } else {
      order['year'] = DateTime.now().year + 1;
      order['month'] = month;
    }
    chooseMonth = int.parse(month);
    changeIsCome2();
    update();
  }

  ///add time
  void addTime(String time) {
    order['time'] = time;
  }

  ///add rooms
  void addRooms(List rooms) {
    Map<String, dynamic> map = {};
    map['str_room'.tr] = rooms[0];
    map['str_people_count'.tr] = "${rooms[1]} - ${rooms[2]}";
    map['str_price'.tr] = rooms[3];
    changeIsCome2();
    order['rooms'] = map;
  }

  int monthDays(int monthNumber) {
    switch (monthNumber) {
      case 1:
        return 31;
      case 2:
        return 28;
      case 3:
        return 31;
      case 4:
        return 30;
      case 5:
        return 31;
      case 6:
        return 30;
      case 7:
        return 31;
      case 8:
        return 31;
      case 9:
        return 30;
      case 10:
        return 31;
      case 11:
        return 30;
      default:
        return 31;
    }
  }

  ///check that all head spaces are filled
  bool isFull() {
    List list = [
      'rooms',
      'people',
      'time',
      'year',
      'month',
    ];
    bool res = false;
    for (var item in list) {
      res = order.containsKey(item);
      if (res == false) {
        return false;
      }
    }

    return true;
  }

  ///TODO
  void clear(BuildContext context) {
    order = {};
    refresh();
  }

  ///get Map in BookingPage intaerface
  Map<String, dynamic> getRooms(String title) {
    late Map<String, dynamic> result = {};
    order.forEach((key, value) {
      if (key == title) {
        result = value;
      }
    });
    return result;
  }

  ///chooseRoom
  void chooseRoom(int index) {
    selectedRoom = index;
    Get.log(selectedRoom.toString());
    addRooms(rooms[index]);
    update();
  }

  ///chose hours
  void chooseHour(int index) {
    selectedHour = index;
    addTime(workTime[index]);
    update();
  }
}
