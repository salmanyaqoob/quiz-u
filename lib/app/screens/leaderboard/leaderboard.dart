import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/home/home_controller.dart';

class LeaderBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LeaderBoardScreenStateful(
      title: "Enter Name",
    );
  }
}

class LeaderBoardScreenStateful extends StatefulWidget {
  LeaderBoardScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreenStateful> {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    homeController.getTopScores();

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              "Leaderboard",
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(child: Obx(() => loadLeaderBoard()))
        ],
      ),
    ));
  }

  Widget loadLeaderBoard() {
    if (homeController.loadingLeaderBoard.value) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      );
    } else {
      return ListView.builder(
          itemCount: null == homeController.topScores
              ? 0
              : homeController.topScores!.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("${homeController.topScores![index]!.name}"),
              trailing: Text(
                "${homeController.topScores![index]!.score}",
                style: TextStyle(color: Colors.green, fontSize: 15),
              ),
            );
          });
    }
  }
}
