import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gametest1/menug.dart';

void main() {
  runApp(mygame()); //---สั่ง Run Class mygane
}

class mygame extends StatelessWidget {
  const mygame({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //-----------แก้แป้นพิมพ์กินหน้าจอ-------------//
        resizeToAvoidBottomInset: false,
        //-----------/แก้แป้นพิมพ์กินหน้าจอ-------------//
        //------------------------------ภาพพื้นหลัง------------------------------//
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/BG1.jpg"), fit: BoxFit.cover),
          ),
          child: mygameM(), //--Class mygameM เริ่มทำงานภายใต้ Class mygame
        ),
        //------------------------------/ภาพพื้นหลัง------------------------------//
      ),
    );
  }
} //Class mygame

class mygameM extends StatefulWidget {
  const mygameM({super.key});
  @override
  //--สั่งให้ Class StartGame เริ่มทำงานภายใต้ Class mygameM ให้อยู่กลางหน้าจอ
  State<mygameM> createState() => StartGame();
} //Class mygameM

class StartGame extends State<mygameM> {
  //----------------name ใช้เก็บค่า ชื่อ-สกุล ที่กรอกใน TextField
  var name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //------------------------------จัดUIต่างๆให้อยู่ตรงกลาง------------------------------//
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        //------------------------------/จัดUIต่างๆให้อยู่ตรงกลาง------------------------------//
        children: [
          //------------------------------ช่องไฟ------------------------------//
          Padding(
            padding: const EdgeInsets.only(top: 75, bottom: 75),
          ),
          //------------------------------/ช่องไฟ------------------------------//

          //------------------------------กล่องUI กรอกชื่อ------------------------------//
          SizedBox(
            width: 250,
            //------------------------------ช่องกรอกชื่อ------------------------------//
            child: TextField(
              controller: name, //-------เก็บค่าที่กรอกไว้ในname
              style: (TextStyle(
                color: Colors.white,
              )),
              //------------------------------ตกแต่งTextField------------------------------//
              decoration: const InputDecoration(
                hintText: 'ชื่อ-นามสกุล',
                hintStyle: TextStyle(
                  color: Color.fromARGB(125, 255, 255, 255),
                ),
                filled: true,
                fillColor: Color(0x9A000000),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255), width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
              ),
              //------------------------------/ตกแต่งTextField------------------------------//
              textAlign: TextAlign.center,
            ),
            //------------------------------/ช่องกรอกชื่อ------------------------------//
          ),
          //------------------------------/กล่องUI กรอกชื่อ------------------------------//

          //------------------------------ช่องไฟ------------------------------//
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
          ),
          //------------------------------/ช่องไฟ------------------------------//

          //------------------------------กล่องUI เริ่ม------------------------------//
          SizedBox(
            //------------------------------ปุมแบบมีicon(กดเริ่ม)------------------------------//
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 111, 216, 79),
                shape: RoundedRectangleBorder(
                  // ignore: prefer_const_constructors
                  side: BorderSide(
                      color: Color.fromARGB(255, 163, 255, 145), width: 5),
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
                Icons.play_arrow, //----------กำหนดรูป icon
                color: Color.fromARGB(255, 255, 255, 255),
                size: 40,
              ),
              //------------------------------กำนหนดทำงานหลังกดป่ม(กดเริ่ม)------------------------------//
              onPressed: () {
                //push ไปหน้าต่อไปโดยกำหนดให้ไปที่ Class menugamestart ของ menug.dart
                //พร้อมส่งค่าของ name เป็น text เก็บที่ namem ใน Class menugamestart
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => menugamestart(namem: name.text)),
                );
              },
              //------------------------------/กำนหนดทำงานหลังกดป่ม(กดเริ่ม)------------------------------//
            ),
            //------------------------------/ปุมแบบมีicon(กดเริ่ม)------------------------------//
          ),
          //------------------------------/กล่องUI เริ่ม------------------------------//

          //------------------------------ช่องไฟ------------------------------//
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
          ),
          //------------------------------/ช่องไฟ------------------------------//

          //------------------------------กล่องUI ออก------------------------------//
          SizedBox(
            //------------------------------ปุมแบบมีicon(กดออก)------------------------------//
            child: TextButton.icon(
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 109, 109),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Color.fromARGB(255, 255, 143, 143), width: 5),
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
              //------------------------------กำหนดการทำงานหลังกด------------------------------//
              onPressed: () {
                //------------------------------แจ้ยืนยันในการกดออก------------------------------//
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('ออกจากเกมส์'),
                    content: const Text('ต้องการออกจากเกมส์ใช่ไหม'),
                    actions: <Widget>[
                      //------------------------------ยกเลิกยังอย่หน้าแรกต่อ------------------------------//
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('ยกเลิก'),
                      ),
                      //------------------------------/ยกเลิกยังอย่หน้าแรกต่อ------------------------------//
                      //------------------------------ออกโปรแกรมจะปิดทันที------------------------------//
                      TextButton(
                        onPressed: () => {exit(0)},
                        child: const Text('ออก'),
                      ),
                      //------------------------------/ออกโปรแกรมจะปิดทันที------------------------------//
                    ],
                  ),
                );
                //------------------------------/แจ้ยืนยันในการกดออก------------------------------//
              },
              //------------------------------/กำหนดการทำงานหลังกด------------------------------//
            ),
            //------------------------------/ปุมแบบมีicon(กดออก)------------------------------//
          ),
          //------------------------------/กล่องUI ออก------------------------------//
        ],
      ),
    );
  }
}
