import 'package:get/get.dart';

class FAQController extends GetxController {
  /// #MuhammadZiyovuddinAka
  List<FAQModel> faqQuestions = [faqQue, faqQue, faqQue, faqQue];

}


class FAQModel {
  String title;
  String content;

  FAQModel({this.title = '', this.content = ''});
}


var faqQue = FAQModel(
    title: 'Куда обратиться, если не начислили бонусы ?',
    content: """Если за заказ вам полагаются бонусы, они  будет
насислены автоматически после закрытя заказ на
касса заведения.
Если бонуси не пришли после закрытя заказа, 
обратитесь в службу поддержки (подробнее смотрите
вопрос “ Как обратиться в службу поддержки “ ).
Специалисты CHAYXANA помогу разобраться в 
ситуатции и начислят вам бонксы вручую. В форме
обрашения укажите название заведения, в котором
был сделан заказ, номер и сумму заказа, а также свои
контактные данные  для обратной связи свами
сотрудника технической поддержкки.\nПримечение:  Программа лояльности может быть
настроена в заведении таким образом, что бонусы не
начисляются за банкетные заказы и за заказы блюд
по акци.""");