import 'package:flutter/material.dart';
import 'package:quiz_u/app/screens/leaderboard/leaderboard.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/otp/otp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_u/app/screens/profile/profile.dart';
import 'package:quiz_u/app/screens/success/success.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quiz U ⏳"),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleTextStyle: TextStyle(color: Colors.black),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.white,
              backgroundColor: Colors.white70,
              onTap: (value) {
                setState(() {
                  _selectedIndex = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home, color: Colors.grey),
                  activeIcon:
                      FaIcon(FontAwesomeIcons.home, color: Colors.black),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.trophy, color: Colors.grey),
                  activeIcon:
                      FaIcon(FontAwesomeIcons.trophy, color: Colors.black),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidUser, color: Colors.grey),
                  activeIcon:
                      FaIcon(FontAwesomeIcons.solidUser, color: Colors.black),
                  label: '',
                ),
              ]),
        ),
        body: findPage(),
      ),
    );
  }

  Widget findPage() {
    if (_selectedIndex == 1) {
      return LeaderBoardScreen();
    } else if (_selectedIndex == 2) {
      return ProfileScreen();
    } else {
      return homePageDesign();
    }
  }

  Widget homePageDesign() {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text(
                  "Ready to test your knowledge and challenge other?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.black87,
                      backgroundColor: Colors.grey,
                      minimumSize: Size(88, 46),
                      textStyle: TextStyle(fontSize: 26),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(2.0)),
                      ),
                    ),
                    onPressed: () => {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return SuccessScreen();
                      }))
                    },
                    child: Text('Quiz Me!'),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Text(
                  "Answer as much questions correctly within 2 minutes",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
