import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          <Widget>[
                            Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Text("Salman Mohammed Yaqoob",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18)),
                                  Text("10", style: TextStyle(fontSize: 18))
                                ]),
                            Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: const [
                                  Text("Salman Mohammed Yaqoob",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18)),
                                  Text("10", style: TextStyle(fontSize: 18))
                                ]),
                            Flex(
                                direction: Axis.horizontal,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: const [
                                  Text("Salman Mohammed Yaqoob",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 18)),
                                  Text("10", style: TextStyle(fontSize: 18))
                                ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
