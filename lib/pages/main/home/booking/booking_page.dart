import 'package:chayxana/pages/main/home/booking/booking_controller.dart';
import 'package:chayxana/services/const_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../setting_detail/setting_detail_controller.dart';

class BookingPage extends StatelessWidget {
  bool _isTest1=true;
  bool _isTest2=false;

  SettingDetailController homeController = Get.find<SettingDetailController>();
  static const String id = "/booking_page";
  String people = '';
  String weekDay;
  String month = '';
  String day = '';
  String time = '';
  Map<String, dynamic> rooms = {};

  BookingPage({
    Key? key,
    this.weekDay = "",
    this.people = "",
    this.month = "",
    this.day = "",
    this.time = '',
    Map<String, dynamic> map = const {},
  }) : super(key: key) {
    rooms.addAll(map);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: BookingController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: const Color(0xffE5E5E5),
          // #appBar
          appBar: AppBar(
            backgroundColor: const Color(0xffE5E5E5),
            elevation: 0,
            centerTitle: true,
            // #title
            title: Text(
              "my_order".tr,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            // #left_icon
            leading: Padding(
              padding: const EdgeInsets.only(left: 19),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Color(0xff000000),
                ),
              ),
            ),
            actions: [
              // #right_icon
              Padding(
                padding: const EdgeInsets.only(right: 23),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.clear,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // #text
                  Text(
                    "your_booking".tr,
                    style: const TextStyle(
                      color: Color(0xffA6A6A6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        // #name  #number
                        Container(
                          // padding: const EdgeInsets.only(top: 10, bottom: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                // style: BorderStyle.solid,
                                width: 1,
                                color: Color(0xffB3B3B3),
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              // #name Muhammad
                              Expanded(
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                      hintText: "name".tr,
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade400)),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: TextFormField(
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      hintText: "phone_number_user".tr,
                                      hintStyle: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey.shade400)),
                                  style: const TextStyle(
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 14),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                // style: BorderStyle.solid,
                                width: 1,
                                color: Color(0xffB3B3B3),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // #name Muhammad
                              Text(
                                // ismni harfi ko'p bulganda moslashtirish kerak
                                "date_time".tr,
                                style: const TextStyle(
                                  color: Color(0xffA6A6A6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${homeController.weekDay[int.parse(weekDay) - 1]} $day $month в $time",
                                    style: const TextStyle(
                                      fontFamily: "Poppins",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xff000000),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 14),
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                // style: BorderStyle.solid,
                                width: 1,
                                color: Color(0xffB3B3B3),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // #name Muhammad
                              Text(
                                "number_people".tr,
                                style: const TextStyle(
                                  color: Color(0xffA6A6A6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                                ),
                              ),
                              // #phone number
                              Text(
                                "${"place".tr}" " $people " "${"man".tr}",
                                style: const TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Visibility(
                          visible: _isTest1,
                          child: Container(
                            padding: const EdgeInsets.only(left: 18, top: 10),
                            alignment: Alignment.topLeft,
                            child:TextFormField(
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 5),
                                  hintText: "send_massage_teahouse".tr,
                                  hintStyle: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey.shade400)),
                              style: const TextStyle(
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Visibility(
                    visible: _isTest2,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 55,
                        right: 55,
                      ),
                      height: 100,
                      // width: 100,
                      child: PinCodeTextField(
                        appContext: context,
                        pastedTextStyle: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                        length: 6,
                        obscureText: true,
                        obscuringCharacter: '*',
                        blinkWhenObscuring: true,
                        animationType: AnimationType.fade,
                        validator: (v) {
                          if (v!.length < 6) {
                            return "full_fill".tr;
                          } else {
                            return null;
                          }
                        },
                        pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderWidth: 0,
                            selectedFillColor: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(10.12),
                            fieldHeight: Get.height / 13.57,
                            fieldWidth: Get.width / 8.26,
                            activeFillColor: AppColors.activeColor,
                            inactiveColor: AppColors.activeColor,
                            inactiveFillColor: AppColors.activeColor),
                        cursorColor: AppColors.unSelectedTextColor,
                        animationDuration: const Duration(milliseconds: 300),
                        enableActiveFill: true,
                        controller: controller.smsEditingController,
                        keyboardType: TextInputType.number,
                        boxShadows: const [
                          BoxShadow(
                            offset: Offset(0, 1),
                            color: Colors.black12,
                            blurRadius: 10,
                          )
                        ],
                        onCompleted: (v) {},
                        onChanged: (value) {},
                        beforeTextPaste: (text) {
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                  ),

                  SizedBox(

                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.87,
                    child: ElevatedButton(
                      clipBehavior: Clip.hardEdge,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xff17B700),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      onPressed: () {
                        _isTest1=false;
                        _isTest2 = true;
                      },

                      child: Text(
                        "str_booking".tr,
                        style: const TextStyle(
                          color: Color(0xffffffff),
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

