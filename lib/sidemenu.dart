import 'package:flutter/material.dart';
import 'package:pertemuan3_aplikasi/home_page.dart';
import 'package:pertemuan3_aplikasi/login_page.dart';
import 'package:pertemuan3_aplikasi/activity_page.dart';
import 'package:pertemuan3_aplikasi/guid_page.dart';
import 'package:pertemuan3_aplikasi/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);

  Future<String> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? 'Guest';
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder<String>(
        future: _loadUsername(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          String username = snapshot.data ?? 'Guest';

          return ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue[900]!, Colors.blue[500]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Text(
                        username[0].toUpperCase(),
                        style: TextStyle(fontSize: 40, color: Colors.blue[900]),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      username,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              _buildListTile(
                context,
                title: 'Home',
                icon: Icons.home,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              _buildListTile(
                context,
                title: 'Activity',
                icon: Icons.list,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const ActivityPage()),
                  );
                },
              ),
              _buildListTile(
                context,
                title: 'Guid',
                icon: Icons.info,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const GuidePage()),
                  );
                },
              ),
              _buildListTile(
                context,
                title: 'Settings',
                icon: Icons.settings,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingsPage()),
                  );
                },
              ),
              _buildListTile(
                context,
                title: 'Logout',
                icon: Icons.logout,
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, {
        required String title,
        required IconData icon,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.blue[800],
      ),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.blue[900],
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      onTap: onTap,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}
