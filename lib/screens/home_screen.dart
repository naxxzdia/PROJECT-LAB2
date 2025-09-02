import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'profile_screen.dart'; // Import your ProfileScreen widget
import 'dart:async';
import '../screens/intro_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _pageIndex = 0;
  int _selectedFilter = 0;
  Timer? _inactivityTimer;

  final List<String> filters = ['All', 'Architecture', 'Interior', 'Art'];

  final List<Map<String, String>> items = [
    {
      'image': 'assets/images/taro1.jpg',
      'title': 'Former Legendary Hitman',
      'description': 'Taro Sakamoto was once the most feared and skilled hitman in the underworld, known for his unmatched abilities and intelligence.',
      'category': 'Architecture',
    },
    {
      'image': 'assets/images/taro2.jpg',
      'title': 'Now a Family Man & Shop Owner',
      'description': 'After getting married, he retired from the assassin world and now runs a small convenience store while living peacefully with his family.',
      'category': 'Interior',
    },
    {
      'image': 'assets/images/taro3.jpg',
      'title': 'Changed Appearance & Personality',
      'description': 'Since leaving his assassin life, he gained weight and became a chubby, kind, and warmhearted father — but he still retains his deadly skills and instincts.',
      'category': 'Art',
    },
    {
      'image': 'assets/images/taro4.jpg',
      'title': 'Protective of His Loved Ones',
      'description': 'Even though he is retired, Sakamoto does hesitate to fight when his family or friends are in danger, showing his legendary assassin skills once again.',
      'category': 'Architecture',
    },
  ];

  List<Map<String, String>> get filteredItems {
    if (_selectedFilter == 0) return items;
    return items.where((item) => item['category'] == filters[_selectedFilter]).toList();
  }

  List<Widget> get _pages => [
        // Gallery Page
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      "GALLERIA",
                      style: TextStyle(
                        color: Color(0xFF8B0000), // dark red
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.black54),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.menu, color: Colors.black54),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Filter buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(filters.length, (index) {
                      final selected = _selectedFilter == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          label: Text(
                            filters[index],
                            style: TextStyle(
                              color: selected ? Colors.white : Color(0xFF8B0000),
                              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                          selected: selected,
                          selectedColor: Colors.black,
                          backgroundColor: Colors.grey[200],
                          onSelected: (val) {
                            setState(() {
                              _selectedFilter = index;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: selected ? 2 : 0,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              // Grid
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 2,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 120,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 10, right: 12),
                            child: Text(
                              item['title']!,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF8B0000),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 12, top: 2, right: 12),
                            child: Text(
                              item['description']!,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF8B0000),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Saved Page
        Container(
          color: Colors.white,
          child: const Center(child: Text('Saved Page', style: TextStyle(fontSize: 20))),
        ),
        // Artists Page
        Container(
          color: Colors.white,
          child: const Center(child: Text('Artists Page', style: TextStyle(fontSize: 20))),
        ),
        // Profile Page
        ProfileScreen(),
      ];

  void _resetInactivityTimer() {
    _inactivityTimer?.cancel();
    _inactivityTimer = Timer(const Duration(seconds: 10), () {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => OnBoardingPage()),
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _resetInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: _resetInactivityTimer,
      onPanDown: (_) => _resetInactivityTimer(),
      child: Scaffold(
        backgroundColor: const Color(0xFFFFEB3B), // สีเหลืองสดใสเหมือน intro
        body: _pages[_pageIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color(0xFFFFF4D6), // สีครีมเหมือน intro
          color: Colors.white,
          buttonBackgroundColor: const Color(0xFFFFEB3B), // สีเหลืองสดใส
          animationDuration: const Duration(milliseconds: 400),
          items: const [
            Icon(Icons.home, size: 28, color: Color(0xFF8B0000)),
            Icon(Icons.favorite_border, size: 28, color: Color(0xFF8B0000)),
            Icon(Icons.people_outline, size: 28, color: Color(0xFF8B0000)),
            Icon(Icons.person_outline, size: 28, color: Color(0xFF8B0000)),
          ],
          onTap: (index) {
            setState(() {
              _pageIndex = index;
            });
            _resetInactivityTimer();
          },
        ),
      ),
    );
  }
}