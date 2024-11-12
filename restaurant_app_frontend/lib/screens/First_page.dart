import 'package:flutter/material.dart';
import 'content_model.dart';

class Onbording extends StatefulWidget {
  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  late PageController _controller;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    _animationController = AnimationController(
      vsync: this, // Now works with the mixin
      duration: Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDEDEC),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                  _animationController.forward(from: 0); // Restart animation
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container with a fade-in scale animation on the image
                      ScaleTransition(
                        scale: Tween<double>(begin: 0.9, end: 1.0).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: Container(
                          color: Color(0xFFFDEDEC),
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            contents[i].image,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Animated title text
                      FadeTransition(
                        opacity: _animationController,
                        child: Text(
                          contents[i].title,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4E0D0D),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Animated description
                      Expanded(
                        child: SingleChildScrollView(
                          child: FadeTransition(
                            opacity: _animationController,
                            child: Text(
                              contents[i].discription,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF555555),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Dots Indicator with smooth width transition
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.only(right: 5),
                  height: 10,
                  width: currentIndex == index ? 25 : 10,
                  decoration: BoxDecoration(
                    color: Color(0xFF8B0000),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),

          // Next/Continue Button with animation
          Padding(
            padding: EdgeInsets.all(40),
            child: SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    // Navigate to the home page when the last page is reached
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (_) => Home(), // Replace with actual Home widget
                    //   ),
                    // );
                  } else {
                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF8B0000),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
