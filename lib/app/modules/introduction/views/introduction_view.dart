import 'package:al_quran_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Al-Qur'an",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w600),
            ),
            const Text(
              "Aplikasi Al-Qur'an dan Do'a harianmu",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            // Text(
            //   "&",
            //   style: TextStyle(
            //     fontSize: 24,
            //   ),
            // ),
            // Text(
            //   "Do'a ",
            //   style: TextStyle(
            //     fontSize: 34,
            //     fontWeight: FontWeight.w600,
            //   ),
            // ),

            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(
                'assets/lotties/introduce.json',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Setiap hari dengan Al-Qur'an",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black45,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF9C6DEC),
              ),
              onPressed: () => Routes.HOME,
              child: const Text(
                'Mulai Membaca',
                style: TextStyle(
                  color: Colors.purpleAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
