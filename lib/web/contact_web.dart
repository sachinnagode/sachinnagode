import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sachin_nagwade/components.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactWeb extends StatefulWidget {
  const ContactWeb({super.key});

  @override
  State<ContactWeb> createState() => _ContactWebState();
}

class _ContactWebState extends State<ContactWeb> {
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 72.0,
              backgroundColor: Colors.tealAccent,
              child: CircleAvatar(
                radius: 70.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/me.png"),
              ),
            ),
            SizedBox(height: 15.0),
            SansBold("Sachin Nagwade", 30.0),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () async {
                    await launchUrlString(
                      "https://www.instagram.com/snagwade/",
                    );
                  },
                  icon: SvgPicture.asset(
                    "assets/instagram.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrlString("https://x.com/sachinnagode/");
                  },
                  icon: SvgPicture.asset(
                    "assets/twitter.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await launchUrlString("https://github.com/sachinnagode/");
                  },
                  icon: SvgPicture.asset(
                    "assets/github.svg",
                    color: Colors.black,
                    width: 35.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 500.0,
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(size: 25.0, color: Colors.black),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  "assets/contact_image.jpg",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
              title: Row(
                children: [
                  Spacer(flex: 3),
                  TabsWeb(title: "Home", route: '/'),
                  Spacer(flex: 3),
                  TabsWeb(title: "Works", route: "/works"),
                  Spacer(flex: 3),
                  TabsWeb(title: "Blog", route: "/blog"),
                  Spacer(flex: 3),
                  TabsWeb(title: "About", route: "/about"),
                  Spacer(flex: 3),
                  TabsWeb(title: "Contact", route: "/contact"),
                  Spacer(),
                ],
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 35.0),
              SansBold("Contact me", 40.0),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      TextForm(
                        text: "FirstName",
                        containerWidth: 350.0,
                        hitText: "Please type your first name",
                      ),
                      SizedBox(height: 15.0),
                      TextForm(
                        text: "Email",
                        containerWidth: 350,
                        hitText: "Please type email address",
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextForm(
                        text: "Last name",
                        containerWidth: 350.0,
                        hitText: "Please type your last name",
                      ),
                      SizedBox(height: 15.0),
                      TextForm(
                        hitText: "Please type your phone number",
                        containerWidth: 350.0,
                        text: "Phone number",
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              TextForm(
                text: "Message",
                containerWidth: widthDevice / 1.5,
                hitText: "Please type your message",
                maxLines: 10,
              ),
              SizedBox(height: 20.0),
              MaterialButton(
                elevation: 20.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                height: 60.0,
                minWidth: 200.0,
                color: Colors.tealAccent,
                child: SansBold("Submit", 20.0),
                onPressed: () {},
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
