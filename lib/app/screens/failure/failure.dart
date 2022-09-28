import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_u/app/screens/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:quiz_u/app/screens/home/home_bindings.dart';
import 'package:quiz_u/app/screens/quiz/quiz.dart';
import 'package:quiz_u/app/screens/quiz/quiz_bindings.dart';

class FailureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FailureScreenStateful(
      title: "Failure",
    );
  }
}

class FailureScreenStateful extends StatefulWidget {
  FailureScreenStateful({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FailureScreenState createState() => _FailureScreenState();
}

class _FailureScreenState extends State<FailureScreenStateful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                    //       return HomeScreen();
                                    //     }))
                                    Get.off(HomeScreen(), routeName: "/home", binding: HomeBinding())
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.close,
                                    color: Colors.black,
                                  ))
                            ]),
                        Image.asset(
                          'assets/images/failure.png',
                          width: 150,
                          alignment: Alignment.centerRight,
                        ),
                        Text(
                          "Wrong Answer",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.black87,
                            backgroundColor: Colors.grey,
                            minimumSize: Size(88, 46),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            textStyle: TextStyle(fontSize: 26),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(2.0)),
                            ),
                          ),
                          onPressed: () => {
                            // Navigator.push(context, MaterialPageRoute(
                            //     builder: (BuildContext context) {
                            //       return HomeScreen();
                            //     }))
                            Get.off(QuizScreen(), routeName: "/quiz", binding: QuizBinding())
                          },
                          child: Text('Try Again'),
                        ),
                      ],
                    )))));
  }
}
