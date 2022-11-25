import 'package:gametest1/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class menugamestart extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => menugamestart(),
      ),
    );
  }

  var namem;
  menugamestart({this.namem});

  @override
  menugame createState() => menugame();
}

class menugame extends State<menugamestart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("")),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BG1.jpg"), fit: BoxFit.cover),
        ),child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "${widget.namem}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
