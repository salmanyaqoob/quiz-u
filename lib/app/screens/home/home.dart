import 'package:flutter/material.dart';
import 'package:quiz_u/app/screens/home/home_controller.dart';
import 'package:quiz_u/app/screens/leaderboard/leaderboard.dart';
import 'package:quiz_u/app/screens/login/login.dart';
import 'package:quiz_u/app/screens/otp/otp.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_u/app/screens/profile/profile.dart';
import 'package:quiz_u/app/screens/quiz/quiz.dart';
import 'package:quiz_u/app/screens/quiz/quiz_bindings.dart';
import 'package:quiz_u/app/screens/success/success.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(onWillPop: () => _onWillPop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Quiz U ⏳"),
          automaticallyImplyLeading: false,
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: CircularNotchedRectangle(),
          notchMargin: 10.0,
          child: Obx(()=>BottomNavigationBar(
              currentIndex: controller.selectedIndex.value,
              onTap: (value) {
                controller.updateSelectedIndex(value);
                _selectedIndex = value;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.home, color: Colors.grey),
                  activeIcon:
                  FaIcon(FontAwesomeIcons.home, color: Colors.deepPurple),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.trophy, color: Colors.grey),
                  activeIcon:
                  FaIcon(FontAwesomeIcons.trophy, color: Colors.deepPurple),
                  label: 'Leaderboard',
                ),
                BottomNavigationBarItem(
                  icon: FaIcon(FontAwesomeIcons.solidUser, color: Colors.grey),
                  activeIcon:
                  FaIcon(FontAwesomeIcons.solidUser, color: Colors.deepPurple),
                  label: 'Profile',
                ),
              ])),
        ),
        body: Obx(() => findPage(context)),
      ),
      );
  }

  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await _showExitBottomSheet(context);
    return exitResult ?? false;
  }

  Future<bool?> _showExitBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: _buildBottomSheet(context),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          'Do you really want to exit the app?',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCEL'),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('YES, EXIT'),
            ),
          ],
        ),
      ],
    );
  }

  Widget findPage(BuildContext context) {
    if (controller.selectedIndex.value == 1) {
      return LeaderBoardScreen();
    } else if (controller.selectedIndex.value == 2) {
      return ProfileScreen();
    } else {
      return homePageDesign(context);
    }
  }

  Widget homePageDesign(BuildContext context) {
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
                      primary: Colors.white,
                      backgroundColor: Theme.of(context).buttonColor,
                      minimumSize: Size(88, 46),
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      textStyle: TextStyle(fontSize: 26),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      ),
                    ),
                    onPressed: () => {
                      Get.to(QuizScreen(), binding: QuizBinding(), routeName: "/quiz")
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (BuildContext context) {
                      //       return SuccessScreen();
                      //     }))
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

