import 'dart:convert';

import 'package:al_quran_app/app/data/models/detail_surah.dart';
import 'package:al_quran_app/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://api.quran.gading.dev/surah');
  var res = await http.get(url);
  // hasil res adalah string
  // print(res.body);

  // res menghasilkan string, agar bisa di pake per satuannya ubah ke List dengan json.decode dan simpan menjadi List -> []
  // karena kita tau isi response nya bakal jadi list, maka gunakan
  // bacanya : respomse si string jadikan decode di bagian response.body biar datanya berupa json (karena mau di olah lagi nanti)
  //           kita tau bahwa key dan valuenya adalah String dan String (ubah jadi dynamic)
  //           jadi gunakan  Map<String, dynamic>
  //           ["data"] adalah response dari API yang di gunakan ada di bagian "data"
  List data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  // var data = (json.decode(res.body) as Map<String, dynamic>)["data"];
  // data adalah mapping
  // print(data[1]); //surah ke 1
  // print(data[1]["name"]); //surah ke 1
  // print(data[1]["tafsir"]); //surah ke 1

  // List data adalah dynamic (raw data), belum Object (model yang sudah di siapkan di model)
  // ini caranya mengubah data menjadi object
  // data dari api (raw data) -> model (yang sudah di siapin)
  Surah suratAnnas = Surah.fromJson(data[113]);
  // print(suratAnnas.toJson()); //kalau mau lihat semua data
  // print(suratAnnas.number); //ambil nomor surah
  // print(suratAnnas.name); //instance of .. (berbentuk object)
  // print(suratAnnas.name
  //     ?.long); //instance of .. (berbentuk object) jadi pake . untuk mengambil data nestednya

// =============================================================================
// detail surah
//==============================================================================
  Uri urlAnnas =
      Uri.parse('https://api.quran.gading.dev/surah/${suratAnnas.number}');
  var resAnnas = await http.get(urlAnnas);
  // var dataAnnas = (json.decode(resAnnas.body) as Map<String, dynamic>)["data"];
  Map<String, dynamic> dataAnnas =
      (json.decode(resAnnas.body) as Map<String, dynamic>)["data"];
  // print(dataAnnas);

  // data dari api (raw data) -> model yang sudah di buah
  DetailSurah detailAnnas = DetailSurah.fromJson(dataAnnas);
  print(detailAnnas.name?.translation?.id);
}
