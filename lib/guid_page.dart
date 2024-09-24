import 'package:flutter/material.dart';
import 'package:pertemuan3_aplikasi/sidemenu.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Panduan untuk Relawan',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: const Sidemenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Sudah mengerti tahapannya?',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Cari Aktivitas'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  GuideStep(
                    number: '1',
                    title: 'Daftar Sebagai Relawan',
                    description:
                    'Sumbangkan waktu dan talentamu kepada komunitas sosial dengan ragam aktivitas.',
                  ),
                  GuideStep(
                    number: '2',
                    title: 'Lengkapi Profil',
                    description:
                    'Kelengkapan profil mempengaruhi kesuksesan aplikasimu kepada komunitas sosial. Cari waktu untuk melengkapi profil agar organisasi tahu talentamu!',
                  ),
                  GuideStep(
                    number: '3',
                    title: 'Cari Aktivitas',
                    description:
                    'Kegiatan lokal atau virtual? Hari kerja atau akhir pekan? Cari aktivitas yang sesuai dengan lokasi, waktu, preferensi isu sosial, hingga minatmu.',
                  ),
                  GuideStep(
                    number: '4',
                    title: 'Daftar Aktivitas',
                    description:
                    'Sudah menemukan aktivitas yang cocok? Klik tombol Daftar Relawan dan isi form pendaftaran.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GuideStep extends StatelessWidget {
  final String number;
  final String title;
  final String description;

  const GuideStep({
    Key? key,
    required this.number,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.red,
              child: Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 100,
              height: 80,
              child: Image.asset(
                'assets/placeholder.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
