import 'package:burada_evsiz_var/utils/color_palette.dart';
import 'package:burada_evsiz_var/utils/curved_shape.dart';
import 'package:coast/coast.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AboutUsContent extends StatefulWidget {
  const AboutUsContent({Key? key}) : super(key: key);

  @override
  State<AboutUsContent> createState() => _AboutUsContentState();
}

class _AboutUsContentState extends State<AboutUsContent> {
  String den =
      "Erdemliler Dayanışması Derneği, Evsiz, sokakta kalan, kimsesiz insanlarımıza psikolojik, barınma, sosyalleşme hizmetleri veren, “balık yedirmek yerine, balık tutmayı öğreten”, topluma; sevgiyi, şefkati, merhameti, yardımlaşma bilincini yaymayı ilke edinmiş, sivil toplum örgütüdür. Erdemliler Dayanışması Derneğini  Adres : Zeynep Kamil Mahallesi. Mahalle Cami Sokak No :9 Üsküdar/İstanbul 11 kişilik yatak kapasitemiz ile 11 evsiz insanımıza barınma sağlamaktadır. Sokakta yaşam mücadelesi veren diğer evsiz arkadaşlarımıza da duş yapmaları ve yemek yemeleri için imkan sunmaktadır. Sokak hayvanlarına da mama dağıtımı yapmaktadır. Erdemliler Dayanışması Derneğimizin gelirleri bağışlarla sağlanmaktadır. Hiçbir şekilde devlet, ve devlete bağlı kurum, kuruluşlardan, partilerden madi ve manevi destek almamaktadır ve almayacaktır! Bunun sebebi Erdemliler Dayanışması Derneğimiz hiçbir şekilde devlete, partilere, siyasetçilere maddi ve manevi bağlı kalmadan/yük olmadan tamamen bireylerin ve toplumun bağışlarıyla ayakta kalmaya çalışan bağımsız sivil toplum örgütü olmak istemesindendir.";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const AccentCurvedShape(),
        Column(
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
                      child: SizedBox(
                        height: 20.h,
                        width: 75.w,
                        child: Image.asset("assets/bev_logo.png",
                            fit: BoxFit.contain),
                      ),
                    )
                  ],
                )),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Biz kimiz?",
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
      ],
    );
  }
}
