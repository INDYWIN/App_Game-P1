import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gametest1/menug.dart';

void main() {
  runApp(mygame());
}

class mygame extends StatelessWidget {
  const mygame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/BG1.jpg"), fit: BoxFit.cover),
          ),
          child: mygameM(),
        ),
      ),
    );
  }
}

class mygameM extends StatefulWidget {
  const mygameM({super.key});
  @override
  State<mygameM> createState() => StartGame();
}

class StartGame extends State<mygameM> {
  var name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0.25),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.35,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                color: const Color.fromARGB(0, 255, 255, 255),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                  ),
                  // -----------------------------------------------------กล่องข้อความ-----------------------------------------------------
                  // ignore: prefer_const_constructors
                  TextField(controller: name,
                    style: (TextStyle(
                      color: Colors.white,
                    )),
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 255, 255),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255),
                            width: 3.0),
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),
                      hintText: 'ชื่อ-นามสกุล',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(125, 255, 255, 255),
                      ),
                      filled: true,
                      fillColor: Color(0x9A000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  // -----------------------------------------------------กล่องข้อความ-----------------------------------------------------
                  // -----------------------------------------------------ปุ่มเริ่ม-----------------------------------------------------
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 111, 216, 79),
                      shape: RoundedRectangleBorder(
                        // ignore: prefer_const_constructors
                        side: BorderSide(
                            color: Color.fromARGB(255, 163, 255, 145),
                            width: 5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(150, 75),
                    ),
                    label: Text(
                      "เริ่ม",
                      style: (TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.play_arrow,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 40,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => menugamestart(namem: name.text)),
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  // -----------------------------------------------------ปุ่มเริ่ม-----------------------------------------------------
                  // -----------------------------------------------------ปุมออก-----------------------------------------------------
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 109, 109),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: Color.fromARGB(255, 255, 143, 143),
                            width: 5),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: Size(150, 75),
                    ),
                    label: Text(
                      "ออก",
                      style: (TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      )),
                    ),
                    // ignore: prefer_const_constructors
                    icon: Icon(
                      Icons.highlight_off,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 40,
                    ),
                    onPressed: () => {exit(0)},
                  ),
                  // -----------------------------------------------------ปุมออก-----------------------------------------------------
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
