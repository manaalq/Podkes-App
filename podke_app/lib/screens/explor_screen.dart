import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:podke_app/screens/playing_screen.dart';

class ExplorScreen extends StatefulWidget {
  const ExplorScreen({super.key});

  @override
  State<ExplorScreen> createState() => _ExplorScreenState();
}

class _ExplorScreenState extends State<ExplorScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1D2B),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Row(
                children: [
                  const Icon(Icons.menu, color: Colors.white),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      "Podkes",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Image.asset(
                    'assets/images/notification.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.notifications,
                          color: Colors.white);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Search Field
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF292B3E),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Categories
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    buildCategory("All", 70),
                    buildCategory("Life", 80),
                    buildCategory("Comedy", 120),
                    buildCategory("Tech", 90),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Trending Title
              const Text(
                "Trending",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Content
              Expanded(
                child: isLoading
                    ? GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                        children: List.generate(4, (_) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[800]!,
                            highlightColor: Colors.grey[600]!,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[900],
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          );
                        }),
                      )
                    : GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.7,
                        physics: const BouncingScrollPhysics(),
                        children: [
                          buildPodcastCard(
                            context: context,
                            image: 'assets/images/image11.png',
                            title: "The missing 96 percent of the universe",
                            author: "Claire Malone",
                            navigate: true,
                          ),
                          buildPodcastCard(
                            context: context,
                            image: 'assets/images/image2.png',
                            title: "How Dolly Parton led me to an epiphany",
                            author: "Abumenyang",
                          ),
                          buildPodcastCard(
                            context: context,
                            image: 'assets/images/image33.png',
                            title: "The missing 96 percent of the universe",
                            author: "Tir McDohl",
                          ),
                          buildPodcastCard(
                            context: context,
                            image: 'assets/images/image44.png',
                            title: "Ngobam with Denny Caknan",
                            author: "Denny Kulon",
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget buildCategory(String title, double width) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF292B3E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  static Widget buildPodcastCard({
    required BuildContext context,
    required String image,
    required String title,
    required String author,
    bool navigate = false,
  }) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            image,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 140,
                color: Colors.grey,
                alignment: Alignment.center,
                child:
                    const Icon(Icons.image_not_supported, color: Colors.white),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 8),
        Text(
          author,
          style: const TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ],
    );

    return navigate
        ? GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PlayingScreen()),
              );
            },
            child: content,
          )
        : content;
  }
}
