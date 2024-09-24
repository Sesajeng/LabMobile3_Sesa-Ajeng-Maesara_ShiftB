import 'package:flutter/material.dart';
import 'package:pertemuan3_aplikasi/sidemenu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
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
            const Text(
              'Pengaturan Akun',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsOption('Ubah Nama', Icons.person, () {
            }),
            _buildSettingsOption('Ubah Email', Icons.email, () {
            }),
            _buildSettingsOption('Ubah Password', Icons.lock, () {
            }),
            const SizedBox(height: 32),
            const Text(
              'Preferensi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            _buildSettingsOption('Notifikasi', Icons.notifications, () {
            }),
            _buildSettingsOption('Tema Gelap', Icons.brightness_2, () {
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue[800]),
      title: Text(title),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios),
    );
  }
}
