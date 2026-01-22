import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';
import 'package:sachin_nagwade/Constants.dart';
import 'package:url_launcher/url_launcher_string.dart';

class TabsWeb extends StatefulWidget {
  final title;
  final route;

  const TabsWeb({super.key, this.title, this.route});

  @override
  State<TabsWeb> createState() => _TabsWebState();
}

class _TabsWebState extends State<TabsWeb> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isSelected = true;
          });
        },
        onExit: (_) {
          setState(() {
            isSelected = false;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.elasticIn,
          style: isSelected
              ? GoogleFonts.openSans(
                  shadows: [Shadow(color: Colors.black, offset: Offset(0, -5))],
                  fontSize: 23.0,
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationThickness: 2,
                  decorationColor: Colors.tealAccent,
                )
              : GoogleFonts.openSans(fontSize: 20.0, color: Colors.black),
          child: Text(widget.title),
        ),
      ),
    );
  }
}

class TabsMobile extends StatefulWidget {
  final title;
  final route;

  const TabsMobile({super.key, this.title, this.route});

  @override
  State<TabsMobile> createState() => _TabsMobileState();
}

class _TabsMobileState extends State<TabsMobile> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        widget.title,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
    );
  }
}

class SansBold extends StatelessWidget {
  final text;
  final size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final text;
  final size;

  const Sans(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.openSans(fontSize: size));
  }
}

class AbelCustom extends StatelessWidget {
  final text;
  final size;
  final color;
  final fontWeight;

  const AbelCustom({
    super.key,
    @required this.text,
    @required this.size,
    this.color,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.abel(
        fontSize: size,
        color: color == null ? Colors.black : color,
        fontWeight: fontWeight == null ? FontWeight.normal : fontWeight,
      ),
    );
  }
}

class TextForm extends StatelessWidget {
  @required
  final text;
  final containerWidth;
  final hitText;
  final maxLines;
  final maxLength;
  final controller;
  final validator;

  // final hint

  const TextForm({
    super.key,
    this.text,
    this.containerWidth,
    this.hitText,
    this.maxLines,
    this.maxLength,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Sans(text, 16.0),
        SizedBox(height: 5.0),
        SizedBox(
          width: containerWidth,
          child: TextFormField(
            maxLines: maxLines,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.tealAccent, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
              ),
              hintText: hitText,
              hintStyle: GoogleFonts.poppins(),
            ),
          ),
        ),
      ],
    );
  }
}

class AnimatedCard extends StatefulWidget {
  final imagePath;
  final text;
  final fit;
  final reverse;
  final height;
  final width;

  const AnimatedCard({
    super.key,
    @required this.imagePath,
    this.text,
    this.fit,
    this.height,
    this.width,
    this.reverse,
  });

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  late Animation<Offset> _animation = Tween(
    begin: widget.reverse == true ? Offset(0, 0.08) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : Offset(0, 0.08),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Card(
        elevation: 30.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: Colors.tealAccent),
        ),
        shadowColor: Colors.tealAccent,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
                height: widget.height == null ? 200.0 : widget.height,
                width: widget.width == null ? 200.0 : widget.width,
                fit: widget.fit == null ? null : widget.fit,
              ),
              SizedBox(height: 10),
              widget.text == null ? SizedBox() : SansBold(widget.text, 15.0),
            ],
          ),
        ),
      ),
    );
  }
}

class TabsWebList extends StatefulWidget {
  const TabsWebList({super.key});

  @override
  State<TabsWebList> createState() => _TabsWebListState();
}

class _TabsWebListState extends State<TabsWebList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(flex: 3),
        TabsWeb(title: Tabs.HOME_TAB, route: Tabs.HOME_ROUTE),
        Spacer(flex: 3),
        TabsWeb(title: Tabs.WORKS_TAB, route: Tabs.WORKS_ROUTE),
        Spacer(flex: 3),
        TabsWeb(title: Tabs.BLOG_TAB, route: Tabs.BLOG_ROUTE),
        Spacer(flex: 3),
        TabsWeb(title: Tabs.ABOUT_TAB, route: Tabs.ABOUT_ROUTE),
        Spacer(flex: 3),
        TabsWeb(title: Tabs.CONTACT_TAB, route: Tabs.CONTACT_ROUTE),
        Spacer(),
      ],
    );
  }
}

class DrawersWeb extends StatelessWidget {
  const DrawersWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              backgroundImage: AssetImage(getImageName()),
            ),
          ),
          SizedBox(height: 5.0),
          SansBold(getName(), 30.0),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getContactsList(),
          ),
        ],
      ),
    );
  }
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.black),
              ),
              child: Image.asset(
                getCircleImageName(),
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          TabsMobile(title: Tabs.HOME_TAB, route: Tabs.HOME_ROUTE),
          SizedBox(height: 20.0),
          TabsMobile(title: Tabs.WORKS_TAB, route: Tabs.WORKS_ROUTE),
          SizedBox(height: 20.0),
          TabsMobile(title: Tabs.BLOG_TAB, route: Tabs.BLOG_ROUTE),
          SizedBox(height: 20.0),
          TabsMobile(title: Tabs.ABOUT_TAB, route: Tabs.ABOUT_ROUTE),
          SizedBox(height: 20.0),
          TabsMobile(title: Tabs.CONTACT_TAB, route: Tabs.CONTACT_ROUTE),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: getContactsList(),
          ),
        ],
      ),
    );
  }
}

// common variable for the ContactFormWeb and ContactFormMobile
final TextEditingController _firstNameController = TextEditingController();
final TextEditingController _lastNameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _phoneController = TextEditingController();
final TextEditingController _messageController = TextEditingController();

class ContactFormWeb extends StatefulWidget {
  const ContactFormWeb({super.key});

  @override
  State<ContactFormWeb> createState() => _ContactFormWebState();
}

class _ContactFormWebState extends State<ContactFormWeb> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
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
                    controller: _firstNameController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "First name is required";
                      }
                    },
                  ),
                  SizedBox(height: 15.0),
                  TextForm(
                    text: "Email",
                    containerWidth: 350,
                    hitText: "Please type email address",
                    controller: _emailController,
                    validator: (text) {
                      if (text.toString().isEmpty) {
                        return "Email is required";
                      }
                    },
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
                    controller: _lastNameController,
                  ),
                  SizedBox(height: 15.0),
                  TextForm(
                    hitText: "Please type your phone number",
                    containerWidth: 350.0,
                    text: "Phone number",
                    controller: _phoneController,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hitText: "Please type your message",
            maxLines: 5,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
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
            onPressed: () async {
              // logger.d(_firstNameController.text);
              final addData = new AddDataFireStore();
              if (formKey.currentState!.validate()) {
                await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                );
                formKey.currentState!.reset();
                dialogError(context);
              }
            },
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class ContactFormMobile extends StatefulWidget {
  const ContactFormMobile({super.key});

  @override
  State<ContactFormMobile> createState() => _ContactFormMobileState();
}

class _ContactFormMobileState extends State<ContactFormMobile> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return Form(
      key: formKey,
      child: Wrap(
        runSpacing: 20.0,
        spacing: 20.0,
        alignment: WrapAlignment.center,
        children: [
          SansBold("Contact me", 35.0),
          TextForm(
            containerWidth: widthDevice / 1.4,
            text: "First name",
            hitText: "Please type your first name",
            controller: _firstNameController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "First name is required";
              }
            },
          ),
          TextForm(
            containerWidth: widthDevice / 1.4,
            text: "Last name",
            hitText: "Please type your last name",
            controller: _lastNameController,
          ),
          TextForm(
            containerWidth: widthDevice / 1.4,
            text: "Email",
            hitText: "Please type email address",
            controller: _emailController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Email is required";
              }
            },
          ),
          TextForm(
            hitText: "Please type your phone number",
            text: "Phone number",
            containerWidth: widthDevice / 1.4,
            controller: _phoneController,
          ),
          TextForm(
            text: "Message",
            containerWidth: widthDevice / 1.5,
            hitText: "Please type your message",
            maxLines: 10,
            controller: _messageController,
            validator: (text) {
              if (text.toString().isEmpty) {
                return "Message is required";
              }
            },
          ),
          MaterialButton(
            elevation: 20.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 60.0,
            minWidth: widthDevice / 2.2,
            color: Colors.tealAccent,
            child: SansBold("Submit", 20.0),
            onPressed: () async {
              // logger.d(_firstNameController.text);
              final addData = new AddDataFireStore();
              if (formKey.currentState!.validate()) {
                await addData.addResponse(
                  _firstNameController.text,
                  _lastNameController.text,
                  _emailController.text,
                  _phoneController.text,
                  _messageController.text,
                );
                formKey.currentState!.reset();
                dialogError(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class UserContact {
  final iconImage;
  final hyperLink;

  UserContact({this.iconImage, this.hyperLink});
}

class UserProfile {
  final name;
  final List<UserContact> userContactsList;

  UserProfile({this.name, required this.userContactsList});
}

class AddDataFireStore {
  var logger = Logger();
  CollectionReference response = FirebaseFirestore.instance.collection(
    FireStoreCollections.MESSAGES,
  );

  Future<void> addResponse(
    final firstName,
    final lastName,
    final email,
    final phoneNumber,
    final message,
  ) async {
    return response
        .add({
          FireStoreColumns.FIRST_NAME: firstName,
          FireStoreColumns.LAST_NAME: lastName,
          FireStoreColumns.EMAIL: email,
          FireStoreColumns.PHONE_NUMBER: phoneNumber,
          FireStoreColumns.MESSAGE: message,
        })
        .then((value) => logger.d(AppConstants.SUCCESS))
        .catchError((error) => logger.e(error));
  }
}

// Methods/Function

Future dialogError(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: SansBold(AppConstants.MESSAGE_SUBMITTED, 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
  );
}

IconButton urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, color: Colors.black, width: 35.0),
    onPressed: () async {
      await launchUrlString(url);
    },
  );
}

Container tealContainer(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.tealAccent,
        style: BorderStyle.solid,
        width: 2.0,
      ),
      borderRadius: BorderRadius.circular(5.0),
    ),
    padding: EdgeInsets.all(7.0),
    child: Text(text, style: GoogleFonts.openSans(fontSize: 15.0)),
  );
}

// This can be taken from Database

List<UserContact> userContactsList = [
  UserContact(
    iconImage: "assets/instagram.svg",
    hyperLink: "https://www.instagram.com/snagwade/",
  ),
  UserContact(
    iconImage: "assets/twitter.svg",
    hyperLink: "https://x.com/sachinnagode/",
  ),
  UserContact(
    iconImage: "assets/github.svg",
    hyperLink: "https://github.com/sachinnagode/",
  ),
];
UserProfile _userProfile = UserProfile(
  name: 'Sachin Nagwade',
  userContactsList: userContactsList,
);

List<IconButton> getContactsList() {
  return _userProfile.userContactsList
      .map((element) => urlLauncher(element.iconImage, element.hyperLink))
      .toList();
}

String getName() {
  return _userProfile.name;
}

String getImageName() {
  return "assets/me.png";
}

String getCircleImageName() {
  return "assets/me_circle.png";
}
