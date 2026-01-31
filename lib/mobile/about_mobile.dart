import 'package:flutter/material.dart';

import '../components.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({super.key});

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            children: [
              //   Introduction First Section
              //Intro First Section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.tealAccent,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(
                    radius: 110.0,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      "assets/me_circle.png",
                      filterQuality: FilterQuality.high,
                    ),
                    // backgroundImage: AssetImage("assets/me_circle.png"),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              //   About me, Second section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    Sans(
                      "Hello! I'm Sachin Nagwade I Specialize in flutter development",
                      15.0,
                    ),
                    Sans(
                      "I strive to ensure astounding performance with state of",
                      15.0,
                    ),
                    Sans(
                      "the art security for Android, Ios, Web, Mac, Linux and Windows",
                      15.0,
                    ),
                    SizedBox(height: 10.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Flutter"),
                        tealContainer("Firebase"),
                        tealContainer("Android"),
                        tealContainer("Ios"),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.0),
              // Third Section What I do
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SansBold("What I do?", 40.0),
                  AnimatedCard(imagePath: "assets/webL.png", width: 200.0),
                  SizedBox(height: 30.0),
                  SansBold("Web development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "I 'm here to build your presence online with state of thr art web apps",
                15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(
                    imagePath: "assets/app.png",
                    width: 200.0,
                    reverse: true,
                  ),
                  SizedBox(height: 30.0),
                  SansBold("App development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "Do you need a high-performance, responsive and beautiful app? Don't worry, I've got you covered.",
                15.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "assets/firebase.png", width: 200.0),
                  SizedBox(height: 30.0),
                  SansBold("Back-end development", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Sans(
                "Do you want your back-end to be highly scalable and secure? Let's have a conversation on how I can help you with that.",
                15.0,
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
