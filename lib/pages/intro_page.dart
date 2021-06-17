import 'package:cocktail_one/pages/homePages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  var pages = [
    PageViewModel(
      title: "The Margarita House",
      body: "It’s beginning to look a lot like cocktails...",
      image: SvgPicture.asset(
        'assets/one.svg',
        fit: BoxFit.cover,
        height: 200,
      ),
      decoration: PageDecoration(
        pageColor: Colors.indigoAccent.withBlue(5),
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 16.0, color: Colors.white),
      ),
    ),
    PageViewModel(
      title: "The Margarita House",
      body: "I have mixed drinks about feelings...",
      image: SvgPicture.asset(
        'assets/two.svg',
        fit: BoxFit.cover,
        height: 190,
      ),
      decoration: PageDecoration(
        pageColor: Colors.indigoAccent.withBlue(5),
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 16.0, color: Colors.white),
      ),
    ),
    PageViewModel(
      title: "The Margarita House",
      body:
          "Be a pineapple: stand tall, wear a crown, and be sweet on the inside...",
      image: SvgPicture.asset(
        'assets/three.svg',
        fit: BoxFit.cover,
        height: 200,
      ),
      decoration: PageDecoration(
        pageColor: Colors.indigoAccent.withBlue(5),
        titleTextStyle: TextStyle(
          color: Colors.orange,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        bodyTextStyle: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 16.0, color: Colors.white),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(
          pages: pages,
          onDone: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomePages(),
              ),
            );
          },
          onSkip: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomePages(),
              ),
            );
          },
          showSkipButton: true,
          globalBackgroundColor: Colors.indigoAccent.withBlue(5),
          skip: const Icon(
            Icons.skip_next,
            color: Colors.white,
          ),
          next: const Icon(
            Icons.navigate_next,
            color: Colors.white,
          ),
          done: const Text(
            "Done",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          ),
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              activeColor: Colors.amberAccent,
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))),
        ),
      ),
    );
  }
}
