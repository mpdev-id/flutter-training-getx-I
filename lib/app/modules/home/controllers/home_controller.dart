import 'dart:convert';

import 'package:al_quran_app/app/data/models/surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // final count = 0.obs;
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);
    List? data = (json.decode(res.body) as Map<String, dynamic>)["data"];
    // ubah menjadi mapping agar bisa di foreach/panggil 1 1
    if (data == null || data.isEmpty) return [];
    return data.map((e) => Surah.fromJson(e)).toList();
  }
}
