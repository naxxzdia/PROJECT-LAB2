import 'package:flutter/material.dart';

// Define a heading text style if not provided by app_constant.dart
final TextStyle headingtextStyle = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255), // สีเหลืองสดใสเหมือน intro
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back_ios_new_rounded, size: 22, color: Color(0xFF8B0000)),
                    Text("Profile", style: headingtextStyle.copyWith(color: Color(0xFF8B0000))),
                    Icon(Icons.more_vert, size: 26, color: Color(0xFF8B0000)),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Avatar
              CircleAvatar(
                radius: 44,
                backgroundImage: AssetImage(
                  'assets/images/taro1.1.jpg',
                ),
                backgroundColor: Color(0xFFFFF4D6),
              ),
              const SizedBox(height: 14),
              // Name
              Text(
                "Sakamoto Taro",
                style: headingtextStyle.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B1B06), // dark brown
                ),
              ),
              const SizedBox(height: 4),
              // Subtitle
              Text(
                "The Legendary Hit Man",
                style: TextStyle(color: Color(0xFFB71C1C), fontSize: 15, fontWeight: FontWeight.w600), // deep red
              ),
              const SizedBox(height: 12),
              // Description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  "Taro Sakamoto is the main protagonist of the series Sakamoto Days.",
                  style: TextStyle(color: Color(0xFF6C4F3D), fontSize: 14, fontStyle: FontStyle.italic), // brown italic
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 18),
              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _StatItem(count: "2", label: "Projects", color: Color(0xFFB71C1C)),
                  _StatItem(count: "27", label: "Years", color: Color(0xFF4B1B06)),
                  _StatItem(count: "45", label: "Awards", color: Color(0xFFB71C1C)),
                ],
              ),
              const SizedBox(height: 18),
              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B0000),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text("Follow"),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Color(0xFF8B0000),
                      side: const BorderSide(color: Color(0xFF8B0000)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 12,
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Message"),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Tabs
              DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.black,
                      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(text: "Projects"),
                        Tab(text: "About"),
                        Tab(text: "Reviews"),
                      ],
                    ),
                    SizedBox(
                      height: 260,
                      child: TabBarView(
                        children: [
                          // Projects Tab
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: _ProjectCard(
                                    image: 'assets/images/taro1.jpg',
                                    title: 'Overall Skill Level',
                                    subtitle: 'Even among the Order, Sakamoto is known to be the strongest hitman of all time, holding both immense skill in combat and also excelling in all aspects of killing.',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: _ProjectCard(
                                    image: 'assets/images/taro2.jpg',
                                    title: 'Enhanced Strength',
                                    subtitle: 'Sakamoto is quite powerful even after retiring and his fitness level decreasing drastically as a result.',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // About Tab
                          Center(
                            child: Text(
                              "About info...",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          // Reviews Tab
                          Center(
                            child: Text(
                              "Reviews info...",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
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
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;
  final Color color;
  const _StatItem({required this.count, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: color),
          ),
          const SizedBox(height: 2),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const _ProjectCard({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: Image.asset(
            image,
            height: 110,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
