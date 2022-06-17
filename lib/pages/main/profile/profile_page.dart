import 'package:chayxana/services/constants/app_assets.dart';
import 'package:chayxana/services/constants/app_colors.dart';
import 'package:chayxana/views/svg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  static const String id = "/profile_page";

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///image
             Container(
               decoration: BoxDecoration(
                 color: AppColors.activeColor,
                 borderRadius: BorderRadius.circular(12),
               ),
               padding: const EdgeInsets.symmetric(horizontal: 15),
               height: Get.height / 2.58,
               width: Get.width,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                     height: Get.height / 7.46,
                   ),
                   Center(
                     child: Container(
                       width: Get.width / 3.76,
                       height: Get.height / 8.14,
                       decoration: const BoxDecoration(
                           image: DecorationImage(
                             image: AssetImage(AppAssets.personIC),
                           )),
                       child: InkWell(
                         onTap: () {},
                       ),
                     ),
                   ),
                   SizedBox(
                     height: Get.height / 14.9,
                   ),
                   const Text(
                     "Абдуллох",
                     style:
                     TextStyle(fontWeight: FontWeight.w600, fontSize: 26, fontFamily: "Poppins"),
                   )
                 ],
               ),
             ),
             const SizedBox(height: 15,),
             /* Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Мои кошельки",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: Get.height / 14.9,
                        ),
                        const Center(
                          child: Text(
                              "С каждой оплаты вы получаете кешбек на бонусыйсчёт. Здес будет заведения с вашими бонуснымбалансом",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff888A87),
                              )),
                        ),
                        SizedBox(height: Get.height / 11.2),
                        Container(
                          alignment: Alignment.centerLeft,
                          height: Get.height / 11.2,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: AppColors.starColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const ImageIcon(
                                  AssetImage(AppAssets.arrowBackIC),
                                  color: AppColors.activeColor,
                                  size: 26,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Используйте бонусы в заведении",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.activeColor),
                                  ),
                                  Text(
                                    "Используйте бонусы в заведении",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: AppColors.activeColor),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                      ])),*/
              /// first three button
              Container(
                  height: 150,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.activeColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(children: [
                    ///location
                    InkWell(onTap: (){}, child:forPersonalInformation(
                      "Город",
                      "assets/icons/ic_location.svg",
                      "Ташкент",
                    ),),
                    const Divider(
                        height: 1, color: AppColors.unSelectedTextColor),
                    ///personal information
                    InkWell(onTap: (){}, child:forPersonalInformation(
                      "Личная информация",
                      "assets/icons/ic_pencil.svg",
                      "",),
                    ),
                    const Divider(
                        height: 1, color: AppColors.unSelectedTextColor),
                    ///card
                    InkWell(onTap: (){}, child:forPersonalInformation(
                      "Банковская карта",
                      "assets/icons/ic_card.svg",
                      "",)
                    ),
                  ])),
              const SizedBox(height: 15),
              //second two button
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    /// help center
                    InkWell(onTap: (){}, child:forPersonalInformation(
                      "Чат с поддержкой",
                      "assets/icons/Vector.svg",
                      "Ташкент",),
                    ),
                    const Divider(
                        height: 1, color: AppColors.unSelectedTextColor),
      /// qeustion and answer
      InkWell(onTap: (){},focusColor: Colors.grey, child: forPersonalInformation(
                      "Вопросы и ответы",
                      "assets/icons/ic_question.svg",
                      "",
                    ),)
                  ],
                ),
              ),
              const SizedBox(height: 15),
              ///third one button
              Container(
                height: 50,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.activeColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    /// leave
                    InkWell(onTap: (){}, child: forPersonalInformation(
                      "Город",
                      "assets/icons/ic_exit_to_app.svg",
                      "Ташкент",
                    )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Expanded forPersonalInformation(
      String whatInfo, String icons, String additional) {

    return Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(whatInfo, style: const TextStyle(fontSize: 16,fontFamily: "Poppins", fontWeight: FontWeight.w400)),
              Row(
                children: [
                  Text(additional,
                      style: const TextStyle(
                          fontSize: 14, color: AppColors.subTextColor)),
                  IconButton(onPressed: (){},
                      icon: OpenSVG(path: icons,isGradient: true,))
                ],
              )
            ],
          ),

      ),
    );
  }
}
