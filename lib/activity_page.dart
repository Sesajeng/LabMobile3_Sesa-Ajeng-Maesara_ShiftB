import 'package:flutter/material.dart';
import 'package:pertemuan3_aplikasi/sidemenu.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cari Aktivitas',
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
            const Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text(
                '98 aktivitas membutuhkan bantuan',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return ActivityCard(activity: activities[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Model untuk Activity
class Activity {
  final String title;
  final String category;
  final String date;
  final String location;
  final String badge;

  Activity(this.title, this.category, this.date, this.location, this.badge);
}

// Daftar aktivitas
final List<Activity> activities = [
  Activity('Open Recruitment', 'Project • Pendidikan', '1 Okt 2024 - 1 Apr 2025', 'Aktivitas Virtual', 'Batas Registrasi 4 Hari Lagi'),
  Activity('Membalik Halaman #77', 'Event • Pengembangan Masyarakat', '28 September 2024', 'Kota Administrasi Jakarta Pusat', 'Batas Registrasi 3 Hari Lagi'),
  Activity('Prepare Yourself To Become A Data Analyst', 'Event • Sains dan Teknologi', '28 September 2024', 'Webinar', 'Batas Registrasi 3 Hari Lagi'),
  Activity('Aktifis Rehabilisasi Aset Alam', 'Event • Pengembangan Masyarakat', '22 Desember 2024', 'Kabupaten Pidie', 'Batas Registrasi 6 Hari Lagi'),
  Activity('Relawan Pasar Bahagia', 'Event • Lingkungan & Pengembangan', '19 Oktober 2024', 'Kota Administrasi Jakarta Pusat', 'Batas Registrasi 6 Hari Lagi'),
  Activity('Youthtalkshow #2', 'Event • Kepemimpinan & Organisasi', '28 September 2024', 'Up Youth Community', 'Batas Registrasi 3 Hari Lagi'),
  // Tambahkan lebih banyak aktivitas sesuai kebutuhan
];

// Widget untuk menampilkan Activity Card
class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kategori dan tanggal di bagian atas kartu
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  activity.category,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.favorite_border, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),
            // Judul kegiatan
            Text(
              activity.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            // Tanggal kegiatan
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 14, color: Colors.red),
                const SizedBox(width: 5),
                Text(
                  activity.date,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // Lokasi kegiatan
            Row(
              children: [
                const Icon(Icons.location_on, size: 14, color: Colors.red),
                const SizedBox(width: 5),
                Text(
                  activity.location,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
            const Spacer(),
            // Badge di bagian bawah kartu
            Text(
              activity.badge,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
