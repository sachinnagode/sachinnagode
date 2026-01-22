import 'package:flutter/material.dart';
import 'package:sachin_nagwade/components.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({super.key});

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(size: 25.0, color: Colors.black),
        title: TabsWebList(),
      ),
      body: ListView(
        children: [
          // First Section
          Container(
            height: heightDevice - 56.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.tealAccent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 20.0,
                      ),
                      child: SansBold("Hello I'm", 15.0),
                    ),
                    SizedBox(height: 15.0),
                    SansBold(getName(), 55.0),
                    Sans("Flutter Developer", 55.0),
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Icon(Icons.email),
                        SizedBox(width: 20.0),
                        Sans("sachinnagode@gmail.com", 10.0),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 20.0),
                        Sans("+91 7709593451", 10.0),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Row(
                      children: [
                        Icon(Icons.location_pin),
                        SizedBox(width: 20.0),
                        Sans("Pune, India", 10.0),
                      ],
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.tealAccent,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(getCircleImageName()),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Second Section
          Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            height: heightDevice / 1.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/web.jpg", height: heightDevice / 1.9),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15.0),
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
                      15,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        tealContainer("Flutter"),
                        SizedBox(width: 7.0),
                        tealContainer("Firebase"),
                        SizedBox(width: 7.0),
                        tealContainer("Android"),
                        SizedBox(width: 7.0),
                        tealContainer("Ios"),
                        SizedBox(width: 7.0),
                        tealContainer("Windows"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          //   Third Section
          Container(
            height: heightDevice / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("What I do?", 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      imagePath: "assets/webL.png",
                      text: "Web development",
                      fit: BoxFit.contain,
                      reverse: false,
                    ),
                    AnimatedCard(
                      imagePath: "assets/app.png",
                      text: "App development",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                    AnimatedCard(
                      imagePath: "assets/firebase.png",
                      text: "Back-end development",
                      fit: BoxFit.contain,
                      reverse: false,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          // Fourth Section
          ContactFormWeb(),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
