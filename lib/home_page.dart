import 'package:flutter/material.dart';
import 'package:pertemuan3_aplikasi/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? namauser;

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namauser = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.blue[800],

              ),
              child: Center(
                child: Text(
                  'Ambil Peran Jadi Relawan\nUbah niat baik jadi aksi baik hari ini',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Call to action button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  // Button action
                },
                child: const Text(
                  'Cari Aktivitas',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            // Stats Section
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatCard('Relawan', '282,813', Icons.person, Colors.blue[700]),
                  _buildStatCard('Organisasi', '6,208', Icons.business, Colors.blue[500]),
                  _buildStatCard('Aktivitas', '10,911', Icons.volunteer_activism, Colors.blue[300]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Ini adalah halaman User ${namauser ?? 'Guest'}',
                style: const TextStyle(fontSize: 18, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon, Color? color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? Colors.blue,
          ),
          child: Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          count,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
