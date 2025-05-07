import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1D2B),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text(
          'Library',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Played Recently Section
            Container(
              width: double.infinity,
              height: 330,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF252836),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Played recently',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  _buildListTile(
                    image: 'assets/images/image33.png',
                    title: 'Podcast Medoan',
                    subtitle: 'Today',
                  ),
                  const SizedBox(height: 12),
                  _buildListTile(
                    image: 'assets/images/image2.png',
                    title: 'Podcast Antono',
                    subtitle: 'Yesterday',
                  ),
                  const SizedBox(height: 12),
                  _buildListTile(
                    image: 'assets/images/image33.png',
                    title: 'Podcast Medoan',
                    subtitle: 'Yesterday',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            //  Playlist Section
            Container(
              width: double.infinity,
              height: 320,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF252836),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your playlist',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        width: 54,
                        height: 54,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1.5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Create Playlist',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildListTile(
                    image: 'assets/images/Album Art.png',
                    title: 'Kumpulan kocakers',
                    subtitle: '4 Channel • 20 Playlist',
                  ),
                  const SizedBox(height: 12),
                  _buildListTile(
                    image: 'assets/images/Album Art-2.png',
                    title: 'Membagongkan',
                    subtitle: 'Yesterday',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Colors.white60,
                fontSize: 16,
              ),
            ),
          ],
        )
      ],
    );
  }
}
