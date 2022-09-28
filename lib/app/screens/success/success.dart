import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/failure/failure.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_u/app/screens/home/home_bindings.dart';
import 'package:share_plus/share_plus.dart';

class SuccessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SuccessScreenStateful(
      title: "Enter Name",
    );
  }
}

class SuccessScreenStateful extends StatefulWidget {
  SuccessScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreenStateful> {

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    String score = (data[0] != null)?data[0]:"";
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SafeArea(
            child: Center(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () => {
                                        // Navigator.push(context,
                                        //     MaterialPageRoute(builder:
                                        //         (BuildContext context) {
                                        //   return HomeScreen();
                                        // }))
                                    Get.off(HomeScreen(), routeName: "/home", binding: HomeBinding())
                                      },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.close,
                                    color: Colors.black,
                                  ))
                            ]),
                        Image.asset(
                          'assets/images/success.png',
                          width: 150,
                          alignment: Alignment.centerRight,
                        ),
                        Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "You have completed",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "$score",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Text(
                                "correct answers!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.black,
                                ),
                              ),
                            ]),
                        ElevatedButton.icon(
                          onPressed: () => {
                          Share.share('I answered $score correct answers in QuizU!')
                          },
                          icon: Icon(
                            // <-- Icon
                            Icons.share,
                            size: 24.0,
                          ),
                          label: Text('Share'),
                          style:
                              ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade900),
                        ),
                        SizedBox(height: 100,)
                      ],
                    )))));
  }
}
