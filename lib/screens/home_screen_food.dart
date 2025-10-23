import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/home_screen_food2.dart';

class HomeScreenFood extends StatefulWidget {
  const HomeScreenFood({super.key});

  @override
  State<HomeScreenFood> createState() => _HomeScreenFoodState();
}

class _HomeScreenFoodState extends State<HomeScreenFood> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      "highlight": "Delivery",
      "title": "Quick Delivery at Your Doorstep",
      "desc":
          "Home delivery and online reservation system for restaurants and care",
    },
    {
      "highlight": "Meals",
      "title": "Fresh Meals Everyday",
      "desc": "Get healthy and delicious meals delivered fresh daily",
    },
    {
      "highlight": "Ordering",
      "title": "Easy Online Ordering",
      "desc": "Order from anywhere with just a few clicks",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/food_wallpaper.jfif'),
              ),
            ),
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(color: Colors.black.withOpacity(0)),
          ),

          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/chef.png'),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 445),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 55, 55, 55),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.amber
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      itemCount: _pages.length,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) {
                        final page = _pages[index];
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        "${page["title"]!
                                            .replaceAll(page["highlight"]!, "")
                                            .trimRight()} ",
                                  ),
                                  TextSpan(
                                    text: page["highlight"]!,
                                    style: const TextStyle(color: Colors.amber),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              page["desc"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_currentPage == _pages.length - 1) {
                          print("Get Started!");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreenFood2(),
                            ),
                          );
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Text(
                        _currentPage == _pages.length - 1
                            ? "Let's Get Started"
                            : "Next",
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreenFood2(),
                        ),
                      );
                    },
                    child: const Text(
                      "SKIP",
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
