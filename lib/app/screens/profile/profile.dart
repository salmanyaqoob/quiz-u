import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_u/app/screens/splash/app_controller.dart';
import 'package:get/get.dart';

import '../home/home_controller.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreenStateful(
      title: "Profile",
    );
  }
}

class ProfileScreenStateful extends StatefulWidget {
  ProfileScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreenStateful> {
  final AppController appController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    homeController.getMyScores();
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton.icon(
                  onPressed: () => {appController.logout()},
                  icon: const FaIcon(
                    FontAwesomeIcons.signOut,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade900),
                )
              ]),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Name: ${appController.name.value}",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              Text(
                "Mobile: ${appController.mobile.value}",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: Colors.white60,
                  height: 1,
                  thickness: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 30),
                child: Text(
                  "My Score",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              Expanded(
                child: Obx(() => loadMyScores()),
              )
            ],
          ),
        ));
  }

  Widget loadMyScores() {
    if (homeController.loadingMyScores.value) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    } else {
      return ListView.builder(
          itemCount: null == homeController.myScores
              ? 0
              : homeController.myScores.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("${homeController.myScores[index]['datetime']}",
                  style: TextStyle(color: Colors.white)),
              trailing: Text(
                "${homeController.myScores[index]['score']}",
                style: TextStyle(color: Colors.blue.shade900, fontSize: 15),
              ),
            );
          });
    }
  }
}
