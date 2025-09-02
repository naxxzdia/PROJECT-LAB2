import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({super.key});

  final List<PageViewModel> pages = [
    PageViewModel(
      title: "Hello! Nadia.",
      body: "Welcome to Sakamoto World ~~",
      image: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            height: 320,
            width: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.yellow,
                  Colors.red,
                ],
                startAngle: 0.0,
                endAngle: 6.28,
              ),
              border: Border.all(color: Colors.white, width: 6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/front.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      decoration: const PageDecoration(
    pageColor: Color(0xFFFFEB3B),  // สีพื้นหลังเป็นสีเหลืองสดใส
    titleTextStyle: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color(0xFF8B0000),  // dark red
    ),
    bodyTextStyle: TextStyle(
      fontSize: 16,
      color: Color(0xFF8B0000),  // dark red
    ),
  ),

    ),
    PageViewModel(
      title: "Spread Joy with Every Moment",
      body: "Embrace the sweetness of life, where friendship, adventure, and a bit of pudding make everything brighter!",
      image: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Container(
            height: 320,
            width: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.yellow,
                  Colors.red,
                ],
                startAngle: 0.0,
                endAngle: 6.28,
              ),
              border: Border.all(color: Colors.white, width: 6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/sakamoto2.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFFFEB3B),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8B0000), // dark red
        ),
        bodyTextStyle: TextStyle(
          fontSize: 16,
          color: Color(0xFF8B0000), // dark red
        ),
      ),
    ),
    PageViewModel(
      title: "A New Beginning with Every Step",
      body: "Where every day brings a fresh start—full of laughter, friendship, and the sweetness of life’s simple joys.",
      image: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Container(
            height: 320,
            width: 320,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Colors.red,
                  Colors.pink,
                  Colors.orange,
                  Colors.yellow,
                  Colors.red,
                ],
                startAngle: 0.0,
                endAngle: 6.28,
              ),
              border: Border.all(color: Colors.white, width: 6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipOval(
                child: Image.asset(
                  "assets/images/sakamoto3.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      decoration: const PageDecoration(
        pageColor: Color(0xFFFFEB3B),
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Color(0xFF8B0000), // dark red
        ),
        bodyTextStyle: TextStyle(
          fontSize: 16,
          color: Color(0xFF8B0000), // dark red
        ),
      ),
    ),
  ];

  Future<void> onDone(context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ON_BOARDING', false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xFFFFF4D6),
      pages: pages,
      dotsDecorator: DotsDecorator(
        size: const Size(10, 10),
        activeSize: const Size(20, 10),
        color: const Color(0xFFFFE29A),
        activeColor: const Color(0xFFFFD369),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      showDoneButton: true,
      done: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 1.2),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, scale, child) => Transform.scale(
          scale: scale,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Start",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15, // เล็กลง
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.check_circle, color: Colors.red),
            ],
          ),
        ),
      ),
      showSkipButton: true,
      skip: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.fast_forward, color: Colors.red),
          SizedBox(width: 6),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 400),
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 15, // เล็กลง
            ),
            child: Text("Skip"),
          ),
        ],
      ),
      showNextButton: true,
      next: TweenAnimationBuilder<double>(
        tween: Tween(begin: 1.0, end: 1.2),
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        builder: (context, scale, child) => Transform.scale(
          scale: scale,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Next",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 15, // เล็กลง
                ),
              ),
              SizedBox(width: 6),
              Icon(Icons.arrow_forward, color: Colors.red),
            ],
          ),
        ),
      ),
      onDone: () => onDone(context),
      curve: Curves.easeInOut,
    );
  }
}