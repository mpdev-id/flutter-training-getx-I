import 'package:al_quran_app/app/data/models/surah.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(80),
          ),
        ),
        title: const Text(
          'Surah',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      // gunakan future builder agar ada loading
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 153, 102, 255),
              Color.fromARGB(255, 255, 255, 255),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FutureBuilder(
          // pasang future, ambil controllernya
          future: controller.getAllSurah(),
          // tambah snapshoot
          builder: (context, snapshoot) {
            // bisa di pake loading
            if (snapshoot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshoot.hasData) {
              return const Center(
                child: Text("Failed Loading Data"),
              );
            }

            return ListView.builder(
              itemCount: snapshoot.data!.length,
              itemBuilder: (context, index) {
                Surah surah = snapshoot.data![index];
                return ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                    backgroundColor: Color.lerp(
                        Color.lerp(Colors.white, Colors.purple[800], 0.5),
                        null,
                        0.5),
                    child: const FlutterLogo(size: 24.0),
                  ),
                  title: Text(
                    '${surah.name!.transliteration!.id} - ${surah.name!.transliteration!.en}',
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    '${surah.numberOfVerses} Ayat',
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: const Icon(Icons.chevron_right),
                  isThreeLine: true,
                  dense: true,
                  enabled: true,
                );
              },
              scrollDirection: Axis.vertical,
            );
          }),
    );
  }
}
