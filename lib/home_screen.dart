import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_profile/contants.dart';
import 'package:my_profile/header.dart';
import 'package:my_profile/pdf.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageno = 1;

  iconCard(String icon, Size size) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
      padding: EdgeInsets.all(KDefaultPadding / 2),
      height: 62,
      width: 62,
      decoration: BoxDecoration(
        color: KBackgroundColor,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 15),
            blurRadius: 22,
            color: KPrimaryColor.withOpacity(0.22),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: KPrimaryColor.withOpacity(0.05),
          ),
        ],
      ),
      child:
          icon.contains(".svg", 0) ? SvgPicture.asset(icon) : Image.asset(icon),
    );
  }

  drawer(Size size) {
    print('drawer execute');
    return Container(
      color: KBackgroundColor,
      height: size.height,
      width: size.width * 0.2,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: KDefaultPadding * 3),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: EdgeInsets.symmetric(horizontal: KDefaultPadding),
                icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  offset: Offset(0, 25),
                  blurRadius: 30,
                  color: KPrimaryColor.withOpacity(0.3),
                ),
                BoxShadow(
                  offset: Offset(25, 25),
                  blurRadius: 30,
                  color: KPrimaryColor.withOpacity(0.3),
                ),
                BoxShadow(
                  offset: Offset(-25, 0),
                  blurRadius: 30,
                  color: KPrimaryColor.withOpacity(0.3),
                ),
                BoxShadow(
                  offset: Offset(-25, -25),
                  blurRadius: 30,
                  color: KPrimaryColor.withOpacity(0.3),
                ),
              ]),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/logo.jpeg'),
                maxRadius: 30.0,
              ),
            ),
            Tooltip(
              message: 'Over View',
              decoration: BoxDecoration(color: KPrimaryColor),
              preferBelow: false,
              child: GestureDetector(
                child: iconCard("assets/icons/person.png", size),
                onTap: () {
                  setState(() {
                    pageno = 1;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            Tooltip(
              message: 'Projects',
              decoration: BoxDecoration(color: KPrimaryColor),
              preferBelow: false,
              child: GestureDetector(
                child: iconCard("assets/icons/project.png", size),
                onTap: () {
                  setState(() {
                    pageno = 2;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
            Tooltip(
              message: 'Resume',
              decoration: BoxDecoration(color: KPrimaryColor),
              preferBelow: false,
              child: GestureDetector(
                child: iconCard("assets/icons/resume.png", size),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PDFScreen(context)));
                },
              ),
            ),
            Tooltip(
              message: 'Contact me',
              decoration: BoxDecoration(color: KPrimaryColor),
              preferBelow: false,
              child: GestureDetector(
                child: iconCard("assets/icons/contact.png", size),
                onTap: () {
                  setState(() {
                    pageno = 3;
                  });
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  overview(Size size) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),/
      padding: EdgeInsets.all(KDefaultPadding),
      width: size.width,
      height: size.height * 0.70,
      decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: KPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: KPrimaryColor.withOpacity(0.22),
            ),
          ]),
      child: SingleChildScrollView(
        child: Text(
          "I am a hybrid Android Developer, ML/AI Developer and Competetive coder. I am pursuing 3rd year CS  E student of Bharati Vidyapeeth's College Of Engineering. My passion is develop creative things. My main skill is creating app with different UI. My Hobbies are reading light novel, playing game etc.",
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }

  project(Size size) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),/
      padding: EdgeInsets.all(KDefaultPadding),
      width: size.width,
      height: size.height * 0.70,
      decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: KPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: KPrimaryColor.withOpacity(0.22),
            ),
          ]),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Projects :',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: KPrimaryColor,
              elevation: 5,
              margin: EdgeInsets.only(bottom: KDefaultPadding * 0.8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'IUAPP (June,20)',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Image Uploading App is a image sharing app which is made by flutter.\n" +
                          "Important feature-\n" +
                          "1.Email and Mobile Number Verification ,\n" +
                          "2. Sign up through Firebase\n" +
                          "3. Change User Profile\n" +
                          "4. Sharing Image among one media",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Link :',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                        FlatButton(
                          onPressed: () async {
                            HapticFeedback.vibrate();
                            String url =
                                "https://colab.research.google.com/drive/1PMMIONJg-rUHaX61zJ7XXL5gJ3t3ci4P?usp=sharing";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: false,
                                forceWebView: false,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            } else {
                              print('Could not launch $url');
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            'Github',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: KPrimaryColor,
              elevation: 5,
              margin: EdgeInsets.only(bottom: KDefaultPadding * 0.8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Skype Clone (June,20)',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Skype Clone is a hybrid application which is developed using flutter. Skype Clone has same functionality as original Skype such as Chat message, End to End Video Calling,etc. This app is used firebase storage,firebase database and authorization etc.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Link :',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                        FlatButton(
                          onPressed: () async {
                            HapticFeedback.vibrate();
                            String url =
                                "https://colab.research.google.com/drive/1PMMIONJg-rUHaX61zJ7XXL5gJ3t3ci4P?usp=sharing";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: false,
                                forceWebView: false,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            } else {
                              print('Could not launch $url');
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            'Github',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: KPrimaryColor,
              elevation: 5,
              margin: EdgeInsets.only(bottom: KDefaultPadding * 0.8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Image Captioning (Nov,19)',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "This project is made by CNN and RNN approach",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Link :',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                        FlatButton(
                          onPressed: () async {
                            HapticFeedback.vibrate();
                            String url =
                                "https://colab.research.google.com/drive/1PMMIONJg-rUHaX61zJ7XXL5gJ3t3ci4P?usp=sharing";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: false,
                                forceWebView: false,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            } else {
                              print('Could not launch $url');
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            'Colab',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: KPrimaryColor,
              elevation: 5,
              margin: EdgeInsets.only(bottom: KDefaultPadding * 0.8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Gender Detection (July,19)',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Gender detection is a model that detect a person's gender is male or female. This project is made by LSTM approach.",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Link :',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                        FlatButton(
                          onPressed: () async {
                            HapticFeedback.vibrate();
                            String url =
                                "https://colab.research.google.com/drive/1PMMIONJg-rUHaX61zJ7XXL5gJ3t3ci4P?usp=sharing";
                            if (await canLaunch(url)) {
                              await launch(
                                url,
                                forceSafariVC: false,
                                forceWebView: false,
                                headers: <String, String>{
                                  'my_header_key': 'my_header_value'
                                },
                              );
                            } else {
                              print('Could not launch $url');
                              throw 'Could not launch $url';
                            }
                          },
                          child: Text(
                            'Colab',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  resume(Size size) {
//
//  }

  contact(Size size) {
    return Container(
//      margin: EdgeInsets.symmetric(vertical: size.height * 0.03),/
      padding: EdgeInsets.all(KDefaultPadding),
      width: size.width,
      height: size.height * 0.70,
      decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 15),
              blurRadius: 22,
              color: KPrimaryColor.withOpacity(0.22),
            ),
            BoxShadow(
              offset: Offset(-15, -15),
              blurRadius: 20,
              color: KPrimaryColor.withOpacity(0.22),
            ),
          ]),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Contact with me",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    MdiIcons.phone,
                    color: Colors.blue,
                    size: 35,
                  ),
                  onPressed: () async {
                    HapticFeedback.vibrate();
                    String url = "8800152602";
                    launch('tel:+${url}');
                  },
                ),
                IconButton(
                  icon: Icon(
                    MdiIcons.email,
                    color: Color(0xffdd4b39),
                    size: 35,
                  ),
                  onPressed: () async {
                    HapticFeedback.vibrate();
                    String url = "deep.agg2299@gmail.com";
                    launch('mailto:+${url}');
                  },
                ),
                IconButton(
                  icon: Icon(
                    MdiIcons.whatsapp,
                    color: Color(0xFF25D366),
                    size: 35,
                  ),
                  onPressed: () async {
                    HapticFeedback.vibrate();
                    String url = "918800152602";
                    await launch("https://wa.me/${url}?text=Hello");
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    MdiIcons.linkedin,
                    color: Color(0xff0077B5),
                    size: 35,
                  ),
                  onPressed: () async {
                    HapticFeedback.vibrate();
                    String url =
                        "https://www.linkedin.com/in/deepak-aggarwal-8b37a5135/";
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                        forceWebView: false,
                        headers: <String, String>{
                          'my_header_key': 'my_header_value'
                        },
                      );
                    } else {
                      print('Could not launch $url');
                      throw 'Could not launch $url';
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    MdiIcons.facebook,
                    color: Color(0xFF3b5998),
                    size: 35,
                  ),
                  onPressed: () async {
                    HapticFeedback.vibrate();
                    String url = "https://www.facebook.com/dpkagg12";
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                        forceWebView: false,
                        headers: <String, String>{
                          'my_header_key': 'my_header_value'
                        },
                      );
                    } else {
                      print('Could not launch $url');
                      throw 'Could not launch $url';
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    MdiIcons.instagram,
                    color: Color(0xffe4405f),
                    size: 35,
                  ),
                  onPressed: () async {
                    HapticFeedback.vibrate();
                    String url = "https://www.instagram.com/dpkagg/";
                    if (await canLaunch(url)) {
                      await launch(
                        url,
                        forceSafariVC: false,
                        forceWebView: false,
                        headers: <String, String>{
                          'my_header_key': 'my_header_value'
                        },
                      );
                    } else {
                      print('Could not launch $url');
                      throw 'Could not launch $url';
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> _list =
        new List.of([overview(size), project(size), contact(size)]);
    return Scaffold(
        backgroundColor: KPrimaryColor.withOpacity(0.75),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
        ),
        drawer: drawer(size),
        body: Header(
          size: size,
          child: _list[pageno - 1],
        ));
  }
}
