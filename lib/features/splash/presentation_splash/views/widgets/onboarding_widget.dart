import 'package:flutter/material.dart';
import '../../../../home/presentation_home/views_home/BottomNavigationBar.dart';
import '../../../data_splash/onboarding_info.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFffffff),
        ),
        child: PageView.builder(
          controller: controller,
          itemCount: contents.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (_, i) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TextButton(
                      child: Text(
                        "Skip",
                        style: TextStyle(color: Colors.deepPurple, fontSize: 16),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnavigationbar()));
                      },
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image.asset(
                    contents[i].image,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.6,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    contents[i].title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    contents[i].description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => Container(
                      height: currentIndex == index ? 12 : 8,
                      width: currentIndex == index ? 12 : 8,
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: index == currentIndex
                            ? Colors.blueAccent
                            : Colors.blue.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.pinkAccent.shade100,
                          Colors.blueAccent.shade100
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (currentIndex == contents.length - 1) {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottomnavigationbar()));
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                          setState(() {
                            currentIndex++;
                          });
                        }
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
