import 'package:flutter/material.dart';

class PlayingScreen extends StatelessWidget {
  const PlayingScreen({super.key});

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
          'Now Playing',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                'assets/images/image11.png',
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'The missing 96 percent of the universe',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              textAlign: TextAlign.start,
              'Claire Malone',
              style: TextStyle(
                color: Colors.white60,
              ),
            ),
            const SizedBox(height: 50),

            Image.asset(
              'assets/images/Screenshot 1446-11-09 at 9.40.41 PM.png',
              height: 60,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16),
            //Time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('24:32', style: TextStyle(color: Colors.white60)),
                Text('34:00', style: TextStyle(color: Colors.white60)),
              ],
            ),
            const SizedBox(height: 70),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.skip_previous, color: Colors.white, size: 32),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFF292B3E),
                  child: Icon(Icons.play_arrow, color: Colors.white, size: 36),
                ),
                Icon(Icons.skip_next, color: Colors.white, size: 32),
              ],
            )
          ],
        ),
      ),
    );
  }
}
