import 'package:chayxana/services/db_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class SettingDetailController extends GetxController {
  int selectedDate = 0;
  int chooseMonth = 0;
  int? selectedRoom;
  int? selectedHour;

  Map<String, dynamic> order = {};
  Map<String, dynamic> dataBase = {};
  String locale = DBService.to.getData(StorageKeys.language) ?? 'en';
  DateTime now = DateTime.now();

  List rooms = [
    [1, 12, 18, 100],
    [2, 15, 16, 200],
    [5, 10, 12, 100],
    [17, 8, 10, 80],
    [19, 12, 18, 999],
  ];

  List<int> maxNumberPeople = [10, 12, 15, 18, 20];
  List<int> minNumberPeople = [6, 8, 10, 12, 15];
  List<String> workTime = [
    '16:00',
    '16:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30'
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

  //
  // static List<String> months1 =
  //     List.generate(12, (index) => '${(DateTime.now().month + index) % 12}');

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

  ///add people
  void addPeople(String min, String max) {
    order['people'] = "$min - $max";
    update();
  }

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
    order['rooms'] = map;
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
    //
    // int year = int.parse(order['year']);
    // int month =  months.indexOf(order['month']);
    // int day = int.parse( order['day']);
    // String time =  order['time'];
    // order['week'] = DateTime(year,month,day).weekday.toString();
    //
    // String week =  order['week'];

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

  ///get items
  String getItem(String title) {
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
    } else {
      order.forEach((key, value) {
        if (key == title) {
          result = value;
        }
      });
    }

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
//  class Booking{
//  static SettingDetailController setting = SettingDetailController();
//  static Map<String,dynamic> order = {};
//
//
//
//  static void addPeople(String min,String max){
//  order['people'] = min + " - " + max;
// setting.update();
//  }
//  static void addDateMonth(String month){
//  if( SettingDetailController.months1.indexOf(month) >  SettingDetailController.months1.indexOf(DateTime.now().month.toString())){
//  order['year'] = DateTime.now().year;
//
//  order['month'] = month;
//
//  }else{
//  order['year'] = DateTime.now().year + 1;
//  order['month'] = month;
//  print(order);
//
//
//  }
//
//  }
//  static void addDay(int day){
//  order['day'] = "$day";
//  print(order);
//
//  }
//  static void addTime(String time){
//  order['time'] = time;
//  }
//  static void addRooms(List rooms){
//  Map<String,dynamic> map = {};
//  map['str_room'.tr] = rooms[0];
//  map['str_people_count'.tr] = rooms[1].toString() + " - " + rooms[2].toString();
//  map['str_price'.tr] = rooms[3];
//
//
//
//  order['rooms'] = map;
//  print(order);
//
//
//  }
//  static bool isFull(){
//
//  List list = ['rooms',
//  'people',
//  'time',
//  'year',
//  'month',];
//  bool res = false;
//  for(var item in list){
//  res =  order.containsKey(item);
//  if(res == false){
//  return false;
//  }
//  }
//  return true;
//  }
//  static void clear(BuildContext context){
//  order = {};
//  Navigator.pushNamed(context, SettingDetailPage.id);
//  }
//  static String getItem(String title){
//  String result = "";
//
//
//  order.forEach((key, value) {
//  if(key == title){
//  result = value;
//
//  }
//  });
//  return result;
//
//
//
//
//  }
//  }
