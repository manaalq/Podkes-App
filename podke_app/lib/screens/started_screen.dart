import 'package:flutter/material.dart';
import 'package:podke_app/screens/botum_nav_bar.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 29, 43, 1),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  // Page 1
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/started_photo.png',
                            height: 300, fit: BoxFit.cover),
                        const SizedBox(height: 30),
                        const Text(
                          'Podkes',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'A podcast is an episodic series of spoken word \ndigital audio files that a user can download to a \npersonal device for easy listening.',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  // Page 2
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(0),
                          ),
                          child: Image.asset(
                            'assets/images/sec_photo.png',
                            height: 300,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          'Discover',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Explore trending and featured podcasts.',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Page indicators (dots)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                2,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(4),
                  width: _currentPage == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.white : Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Next button
            GestureDetector(
              onTap: () {
                if (_currentPage < 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavBar()),
                  );
                }
              },
              child: Container(
                width: 70,
                height: 70,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 24),
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                ),
                child:
                    const Icon(Icons.arrow_forward, color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
