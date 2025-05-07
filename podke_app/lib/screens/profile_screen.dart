import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1D2B),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          // Profile Image
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/profile_image.png'),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Change Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Settings Container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFF292B3E),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildProfileOption(
                    context: context,
                    icon: Icons.brightness_6,
                    color: Colors.amber,
                    title: "Change Theme",
                  ),
                  buildDivider(),
                  buildProfileOption(
                    context: context,
                    icon: Icons.lock,
                    color: Colors.purple,
                    title: "Privacy",
                  ),
                  buildDivider(),
                  buildProfileOption(
                    context: context,
                    icon: Icons.info_outline,
                    color: Colors.lightBlue,
                    title: "About",
                  ),
                  buildDivider(),
                  buildProfileOption(
                    context: context,
                    icon: Icons.logout,
                    color: Colors.red,
                    title: "Logout",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProfileOption({
    required BuildContext context,
    required IconData icon,
    required Color color,
    required String title,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () {
        if (title == "Logout") {
          _showLogoutDialog(context);
        } else {
          // يمكنك وضع أي إجراءات أخرى هنا لبقية العناصر
        }
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF292B3E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          "Confirm Logout",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Are you sure you want to logout?",
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
            onPressed: () {
              Navigator.pop(context);
              // ضع هنا كود تسجيل الخروج إذا لزم
            },
          ),
        ],
      ),
    );
  }

  Widget buildDivider() {
    return const Divider(
      color: Colors.white10,
      height: 1,
      indent: 20,
      endIndent: 20,
    );
  }
}
