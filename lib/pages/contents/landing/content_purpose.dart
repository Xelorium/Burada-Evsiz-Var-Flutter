import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/curved_shape.dart';

class PurposeContent extends StatefulWidget {
  const PurposeContent({Key? key}) : super(key: key);

  @override
  State<PurposeContent> createState() => _PurposeContentState();
}

class _PurposeContentState extends State<PurposeContent> {
  String den =
      'Yönetim kurulu, dernek tüzüğüne göre genel kurula katılma hakkı bulunan üyelerin listesini düzenler. Genel kurula katılma hakkı bulunan üyeler, en az onbeş gün önceden, toplantının günü, saati, yeri ve gündemi en az bir gazetede veya derneğin internet sayfasında ilan edilmek, yazılı olarak bildirilmek, üyenin bildirdiği elektronik posta adresine ya da iletişim numarasına mesaj gönderilmek veya mahalli yayın araçları kullanılmak suretiyle toplantıya çağrılır. Bu çağrıda, çoğunluk sağlanamaması sebebiyle toplantı yapılamazsa, ikinci toplantının hangi gün, saat ve yerde yapılacağı da belirtilir. İlk toplantı ile ikinci toplantı arasındaki süre yedi günden az, altmış günden fazla olamaz. Toplantı, çoğunluk sağlanamaması sebebinin dışında başka bir nedenle geri bırakılırsa, bu durum geri bırakma sebepleri de belirtilmek suretiyle, ilk toplantı için yapılan çağrı usulüne uygun olarak üyelere duyurulur. İkinci toplantının geri bırakma tarihinden itibaren en geç altı ay içinde yapılması zorunludur. Üyeler ikinci toplantıya, birinci fıkrada belirtilen esaslara göre yeniden çağrılır. Genel kurul toplantısı bir defadan fazla geri bırakılamaz.';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AccentCurvedShape(),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  height: 20.h,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Palette.appColor,
                        ),
                        height: 12.h,
                        width: double.infinity,
                      ),
                      Crab(
                        tag: 'logo',
                        child: Hero(
                          tag: 'logo',
                          child: SizedBox(
                            height: 20.h,
                            width: 75.w,
                            child: Image.asset("assets/bev_logo.png",
                                fit: BoxFit.contain),
                          ),
                        ),
                      )
                    ],
                  )),
              SizedBox(
                height: 1.h,
              ),
              Text(
                "Uygulamanın amacı nedir?",
                style: TextStyle(fontSize: 20.sp, color: Palette.appColor),
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(den),
                ),
              ),
              // ElevatedButton(onPressed: (){}, child: Text("Devam Et"))
            ],
          ),
        ),
      ],
    );
  }
}
