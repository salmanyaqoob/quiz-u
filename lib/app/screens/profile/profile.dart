import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProfileScreenStateful(
      title: "Enter Name",
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
              FaIcon(
                FontAwesomeIcons.signOut,
                color: Colors.black,
              )
            ]),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 50),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              "Name: Salman Yaqoob",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const Text(
              "Mobile: +966 5664548686",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Divider(
                color: Colors.grey,
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
            Column(
              children: [
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("2022-10-22 10:00AM",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18)),
                      Text("10", style: TextStyle(fontSize: 18))
                    ]),
                Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("2022-10-22 10:00AM",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 18)),
                      Text("10", style: TextStyle(fontSize: 18))
                    ]),
              ]
            )
          ],
        ),
      )),
    );
  }
}
