import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_crew/services/localDB.dart';
import 'package:travel_crew/views/home.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageController = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 75),
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() => isLastPage = index == 2);
            },
            children: [
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("lib/assets/images/onboardPic1.png"),
                    Image.asset("lib/assets/images/onboardText1.png"),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Flexible(
                      child: Image.asset("lib/assets/images/onboardPic2.png"),
                      flex: 2,
                    ),
                    Flexible(
                      child: Image.asset("lib/assets/images/onboardText2.png"),
                      flex: 2,
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: [
                    Flexible(
                      child: Image.asset("lib/assets/images/onboardPic3.png"),
                      flex: 2,
                    ),
                    Flexible(
                      child: Image.asset("lib/assets/images/onboardText3.png"),
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1)),
                  minimumSize: Size.fromHeight(75),
                  backgroundColor: Colors.black.withOpacity(0.8)
                ),
                onPressed: () async {
                  await LocalDB.setShowHome(true);
                  // final prefs = await SharedPreferences.getInstance();
                  // prefs.setBool("showHome", true);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text("Get Started", style: TextStyle(color: Colors.white),))
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: 75,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          pageController.jumpToPage(2);
                        },
                        child: Text("Skip")),
                    Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            radius: 20, expansionFactor: 2, spacing: 5),
                        onDotClicked: (index) => pageController.animateToPage(
                            index,
                            duration: Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        },
                        child: Text("Next")),
                  ],
                ),
              ),
      ),
    );
  }
}
