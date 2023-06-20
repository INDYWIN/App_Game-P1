import 'dart:convert';
import 'dart:math';

import 'package:gametest1/main.dart';
import 'package:gametest1/menug.dart';
import 'package:gametest1/gameplus.dart';
import 'package:gametest1/gamesubtract.dart';
import 'package:gametest1/gamemultiply.dart';
import 'package:gametest1/gamedivision.dart';
import 'package:gametest1/gamegeometry.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class gamegeometry extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => gamegeometry(),
      ),
    );
  }

  var nameg;
  gamegeometry({this.nameg});

  @override
  gamegeometryd createState() => gamegeometryd();
}

class gamegeometryd extends State<gamegeometry> {
  int _scor = 0; //--เก็บค่าของคะแนน
  int _life = 3; //--เก็บค่าของพลังชีวิต (จำนวนครั้งที่สามารถตอบผิด)
  int _loopplus = 1; //--นับลูปเพื่อแสดงเลขของด่านตามจำนวนการลูป
  //----------------------------------------------------------เก็บรูปที่เป็นโจทย์----------------------------------------------------------//
  static const gameSet1 = [
    "images/gameGeometry/1-1.jpg",
    "images/gameGeometry/2-1.jpg",
    "images/gameGeometry/3-1.jpg",
    "images/gameGeometry/4-1.jpg",
  ];
  static const gameSet2 = [
    "images/gameGeometry/1-2.jpg",
    "images/gameGeometry/2-2.jpg",
    "images/gameGeometry/3-2.jpg",
    "images/gameGeometry/4-2.jpg",
  ];
  static const gameSet3 = [
    "images/gameGeometry/1-3.jpg",
    "images/gameGeometry/2-3.jpg",
    "images/gameGeometry/3-3.jpg",
    "images/gameGeometry/4-3.jpg",
  ];
  static const gameSet4 = [
    "images/gameGeometry/1-4.jpg",
    "images/gameGeometry/2-4.jpg",
    "images/gameGeometry/3-4.jpg",
    "images/gameGeometry/4-4.jpg",
  ];
  //----------------------------------------------------------/เก็บรูปที่เป็นโจทย์----------------------------------------------------------//

  //----------------------------------------------------------สร้างตัวอปรเพื่อไว้แสดงรูปจากการสุ่ม----------------------------------------------------------//
  late String setImg1;
  late String setImg2;
  late String setImg3;
  late String setImg4;
  //----------------------------------------------------------/สร้างตัวอปรเพื่อไว้แสดงรูปจากการสุ่ม----------------------------------------------------------//

  //----------------------------------------------------------สุ่มรูปจากใน gameSet(1-4) และเก็บที่ setImg(1-4)----------------------------------------------------------//
  @override
  void initState() {
    super.initState();

    final imgSet1 = _gameSet1();
    setState(() => setImg1 = imgSet1);

    final imgSet2 = _gameSet2();
    setState(() => setImg2 = imgSet2);

    final imgSet3 = _gameSet3();
    setState(() => setImg3 = imgSet3);

    final imgSet4 = _gameSet4();
    setState(() => setImg4 = imgSet4);
  }

  String _gameSet1() {
    final randomIndex = Random().nextInt(gameSet1.length);
    return gameSet1[randomIndex];
  }

  String _gameSet2() {
    final randomIndex = Random().nextInt(gameSet2.length);
    return gameSet2[randomIndex];
  }

  String _gameSet3() {
    final randomIndex = Random().nextInt(gameSet3.length);
    return gameSet3[randomIndex];
  }

  String _gameSet4() {
    final randomIndex = Random().nextInt(gameSet4.length);
    return gameSet4[randomIndex];
  }
  //----------------------------------------------------------/สุ่มรูปจากใน gameSet(1-4) และเก็บที่ setImg(1-4)----------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //-----------------------------ภาพพื้นหลัง-----------------------------//
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BG3.jpg"), fit: BoxFit.cover),
        ),
        //-----------------------------ภาพพื้นหลัง-----------------------------//
        child: Stack(
          children: [
            if (_life >= 1) // life >= 1 คือถ้า life ยังไม่หมดให้เกมส์ทำงานต่อไป
              /*Align จะคล้ายๆกับ SizedBox แต่จะมีอิสระหลายๆอย่างมากกว่า*/
              //-----------------------------Align กล่องเก็บ สถานะ ชื่อ / คะแนน / พลังชีวิต-----------------------------//
              Align(
                alignment: AlignmentDirectional(0, -0.77),
                //-----------------------------สถานะ ชื่อ / คะแนน / พลังชีวิต -----------------------------//
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.83,
                  height: MediaQuery.of(context).size.height * 0.13,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //-----------------------------กำหนดเงื่อนไขการแสดงของหัวใจ-----------------------------//
                          if (_life == 3)
                            Image(image: AssetImage("images/Life/max.png")),
                          if (_life == 2)
                            Image(image: AssetImage("images/Life/2 - 3.png")),
                          if (_life == 1)
                            Image(image: AssetImage("images/Life/1 - 3.png")),
                          //-----------------------------/กำหนดเงื่อนไขการแสดงของหัวใจ-----------------------------//
                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //-----------------------------คะแนน-----------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.30,
                            padding: EdgeInsets.only(right: 10.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 3,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                color: Color.fromARGB(108, 255, 255, 255)),
                            child: Text(
                              " $_scor ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                          ),
                          //-----------------------------/คะแนน-----------------------------//
                        ],
                      ),
                      Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                      //-----------------------------แสดงชื่อ-----------------------------//
                      Row(
                        children: [
                          Text(" "),
                          Text(
                            "ชื่อ : ${widget.nameg}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      //-----------------------------/แสดงชื่อ-----------------------------//

                      Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ
                    ],
                  ),
                ),
                //-----------------------------/สถานะ ชื่อ / คะแนน / พลังชีวิต -----------------------------//
              ),
            //-----------------------------/Align กล่องเก็บ สถานะ ชื่อ / คะแนน / พลังชีวิต-----------------------------//
            if (_life >= 1) // life >= 1 คือถ้า life ยังไม่หมดให้เกมส์ทำงานต่อไป
              //-----------------------------Align กล่องเก็บ การทำงานของเกมส์ / โจทย์ / คำตอบ / ตัวเลือก-----------------------------//
              Align(
                alignment: AlignmentDirectional(0, 0.45),
                child: Container(
                  color: Color.fromARGB(0, 255, 255, 255),
                  width: MediaQuery.of(context).size.width * 0.80,
                  height: MediaQuery.of(context).size.height * 0.60,
                  child: Column(children: [
                    //-----------------------------แสดงจำนวนด่านตาม _loopplus-----------------------------//
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.06,
                      padding: EdgeInsets.only(top: 3.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        color: Color.fromARGB(255, 255, 144, 255),
                      ),
                      child: Text(
                        'ด่านที่ ' + '$_loopplus',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      margin: EdgeInsets.only(bottom: 25.0),
                    ),
                    //-----------------------------/แสดงจำนวนด่านตาม _loopplus-----------------------------//

                    //--------------------------------------------------------อธิบาย--------------------------------------------------------//
                    /*ในเกมส์ที่ 5 จะใช้รูปจาก setImg(1-4) มาเป็นโจทย์ setImg1 จะเป็นด่านที่1 และจะเรียงตามเลขใน setImg จะมีรูปทรง 4 แบบ คือ สี่เหลี่ยม วงกลม สามเหลี่ยม และหกเหลี่ยม*/
                    /*การทำงานตัวคำตอบ ค่าตัวเลือกที่1 เป็น☐ ตัวเลือกที่2 เป็น△ ตัวเลือกที่3 เป็น◯ ตัวเลือกที่4 เป็น⎔ และจะลูปทั้งหมด 4 รอบในแต่ละรอบ setImg1 จะสุ่มรูปออกมาเป็นรูปทรงต่าง*/
                    /*ถ้าในด่านที่1 setImg1 สุ่มมาเป็น สี่เหลี่ยม ก็จะมี่ค่าที่ตรงกับ ค่าตัวเลือกที่1 เป็น☐ และจะสุ่มรูปใหม่จาก setImg2 ในด่าน2 กรณีตอบถูก ถ้าตอบผิดรูปจะไม่มีการสุ่มใหม่แต่จะและใช้รูปเดิมจนดว่าจะตอบถูก*/
                    //--------------------------------------------------------/อธิบาย--------------------------------------------------------//

                    //--------------------------------------------------------แสดงโจทย์--------------------------------------------------------//
                    if (_loopplus == 1)
                      //-----------------------------โจทย์ด่านที่1-----------------------------//
                      SizedBox(
                        child: Container(
                          child: Image.asset(
                            setImg1,
                            width: 150,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    //-----------------------------/โจทย์ด่านที่1-----------------------------//
                    if (_loopplus == 2)
                      //-----------------------------โจทย์ด่านที่2-----------------------------//
                      SizedBox(
                        child: Container(
                          child: Image.asset(
                            setImg2,
                            width: 150,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    //-----------------------------/โจทย์ด่านที่2-----------------------------//
                    if (_loopplus == 3)
                      //-----------------------------โจทย์ด่านที่3-----------------------------//
                      SizedBox(
                        child: Container(
                          child: Image.asset(
                            setImg3,
                            width: 150,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    //-----------------------------/โจทย์ด่านที่3-----------------------------//
                    if (_loopplus == 4)
                      //-----------------------------โจทย์ด่านที่4-----------------------------//
                      SizedBox(
                        child: Container(
                          child: Image.asset(
                            setImg4,
                            width: 150,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    //-----------------------------/โจทย์ด่านที่4-----------------------------//
                    //--------------------------------------------------------/แสดงโจทย์--------------------------------------------------------//

                    Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่1 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//
                    if (_loopplus == 1)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก☐--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "☐",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg1 == "images/gameGeometry/1-1.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก☐--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก△--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "△",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg1 == "images/gameGeometry/2-1.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก△--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่1 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่2 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//
                    if (_loopplus == 2)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก☐--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "☐",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg2 == "images/gameGeometry/1-2.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก☐--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก△--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "△",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg2 == "images/gameGeometry/2-2.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก△--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่2 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่3 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//
                    if (_loopplus == 3)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก☐--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "☐",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg3 == "images/gameGeometry/1-3.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก☐--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก△--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "△",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg3 == "images/gameGeometry/2-3.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------ตัวเลือก△--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่3 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่4 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//
                    if (_loopplus == 4)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก☐--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "☐",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg4 == "images/gameGeometry/1-4.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก☐--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก△--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "△",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg4 == "images/gameGeometry/2-4.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------ตัวเลือก△--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่4 ตัวเลือก☐ ตัวเลือก△--------------------------------------------------------//

                    Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่1 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//
                    if (_loopplus == 1)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก◯--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "◯",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg1 == "images/gameGeometry/3-1.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก◯--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก⎔--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "⎔",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg1 == "images/gameGeometry/4-1.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก⎔--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่1 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่2 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//
                    if (_loopplus == 2)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก◯--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "◯",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg2 == "images/gameGeometry/3-2.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก◯--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก⎔--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "⎔",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg2 == "images/gameGeometry/4-2.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก⎔--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่2 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่3 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//
                    if (_loopplus == 3)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก◯--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "◯",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg3 == "images/gameGeometry/3-3.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก◯--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก⎔--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "⎔",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg3 == "images/gameGeometry/4-3.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก⎔--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่3 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//

                    //--------------------------------------------------------แสดงตัวเลือกคำตอบในด่านที่4 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//
                    if (_loopplus == 4)
                      Row(
                        children: <Widget>[
                          //--------------------------------------------------------ตัวเลือก◯--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "◯",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg4 == "images/gameGeometry/3-4.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก◯--------------------------------------------------------//

                          Flexible(
                              fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                          //--------------------------------------------------------ตัวเลือก⎔--------------------------------------------------------//
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 144, 255),
                                shape: RoundedRectangleBorder(
                                  // ignore: prefer_const_constructors
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      width: 4),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                minimumSize: const Size(150, 75),
                              ),
                              child: Text(
                                "⎔",
                                style: (TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900,
                                )),
                              ),
                              onPressed: () {
                                //--------------------------------------------------------กรณีตอบถูก--------------------------------------------------------//
                                if (setImg4 == "images/gameGeometry/4-4.jpg")
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบถูก'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _loopplus++;
                                              _scor += 25;
                                            })
                                          },
                                          child: const Text('ไปต่อ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบถูก--------------------------------------------------------//
                                //--------------------------------------------------------กรณีตอบผิด--------------------------------------------------------//
                                else
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('คุณตอบผิด'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () => {
                                            Navigator.pop(context),
                                            setState(() {
                                              _life--;
                                            })
                                          },
                                          child: const Text('ตอบอีกรอบ'),
                                        ),
                                      ],
                                    ),
                                  );
                                //--------------------------------------------------------/กรณีตอบผิด--------------------------------------------------------//
                              },
                            ),
                          ),
                          //--------------------------------------------------------/ตัวเลือก⎔--------------------------------------------------------//
                        ],
                      ),
                    //--------------------------------------------------------/แสดงตัวเลือกคำตอบในด่านที่4 ตัวเลือก◯ ตัวเลือก⎔--------------------------------------------------------//
                  ]),
                ),
              ),
            //-----------------------------/Align กล่องเก็บ การทำงานของเกมส์ / โจทย์ / คำตอบ / ตัวเลือก-----------------------------//

            /*------------------------------------------เงื่อนไขการจบเกมส์------------------------------------------*/

            //-----------------------------ถ้า _life น้อยกว่า 1 และคะแนน(_scor) = 0 จะเข้าเงื่อนไขเกมส์ Over -----------------------------//
            if (_life < 1 && _scor == 0)
              //-----------------------------ภาพแสดงถึงเกมส์ Over-----------------------------//
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/Life/Fail.png",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            //-----------------------------/ภาพแสดงถึงเกมส์ Over-----------------------------//
            if (_life < 1 && _scor == 0)
              //-----------------------------ปุ่มกดกลับไปหน้า menu-----------------------------//
              Container(
                alignment: AlignmentDirectional(0, -0.55),
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
                    "",
                    style: (TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    )),
                  ),
                  // ignore: prefer_const_constructors
                  icon: Icon(
                    Icons.restart_alt,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 40,
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('กลับไปหน้าเมนู'),
                      content: const Text('ต้องการกลับไปหน้าเลือกเมนูใช่ไหม'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('ยกเลิก'),
                        ),
                        TextButton(
                          onPressed: () =>
                              {Navigator.pop(context), Navigator.pop(context)},
                          child: const Text('กลับ'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            //-----------------------------/ปุ่มกดกลับไปหน้า menu-----------------------------//
            //-----------------------------/ถ้า _life น้อยกว่า 1 และคะแนน(_scor) = 0 จะเข้าเงื่อนไขเกมส์ Over -----------------------------//

            //-----------------------------ถ้า _life น้อยกว่า 1 และคะแนน(_scor) มากกว่า 20 จะเข้าเงื่อนไขเกมส์ Over แต่ก็ยังมีคะแนนอยู่-----------------------------//
            if (_life < 1 && _scor >= 20)
              //-----------------------------ภาพแสดงหลังจบ-----------------------------//
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/Life/scor2.png",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            //-----------------------------/ภาพแสดงหลังจบ-----------------------------//
            if (_life < 1 && _scor >= 20)
              //-----------------------------ปุ่มกดกลับไปหน้า menu และการแสดง คะแนน-----------------------------//
              Column(
                children: [
                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                  //-----------------------------ปุ่มกดกลับไปหน้า menu-----------------------------//
                  Container(
                    alignment: AlignmentDirectional(0, -0.55),
                    child: TextButton.icon(
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
                        "",
                        style: (TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        )),
                      ),
                      // ignore: prefer_const_constructors
                      icon: Icon(
                        Icons.restart_alt,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 40,
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('กลับไปหน้าเมนู'),
                          content:
                              const Text('ต้องการกลับไปหน้าเลือกเมนูใช่ไหม'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('ยกเลิก'),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.pop(context),
                                Navigator.pop(context)
                              },
                              child: const Text('กลับ'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //-----------------------------ปุ่มกดกลับไปหน้า menu-----------------------------//

                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ
                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ
                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                  //-----------------------------แสดงคะแนนที่ได้-----------------------------//
                  Container(
                    width: MediaQuery.of(context).size.width * 0.60,
                    padding: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        color: Color.fromARGB(155, 0, 0, 0)),
                    child: Text(
                      " $_scor ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //-----------------------------/แสดงคะแนนที่ได้-----------------------------//

                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ
                ],
              ),
            //-----------------------------/ปุ่มกดกลับไปหน้า menu และการแสดง คะแนน-----------------------------//
            //-----------------------------ถ้า _life น้อยกว่า 1 และคะแนน(_scor) มากกว่า 20 จะเข้าเงื่อนไขเกมส์ Over แต่ก็ยังมีคะแนนอยู่-----------------------------//

            //-----------------------------ถ้าะคะแนน(_scor) = 100 จะเข้าเงื่อนไขการชนะเกมส์-----------------------------//
            if (_scor == 100)
              //-----------------------------ภาพแสดงหลังชนะเกมส์-----------------------------//
              Container(
                constraints: const BoxConstraints.expand(),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/Life/Succeed.png",
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            //-----------------------------/ภาพแสดงหลังชนะเกมส์-----------------------------//
            if (_scor == 100)
              //-----------------------------ปุ่มกดกลับไปหน้า menu และการแสดง คะแนน-----------------------------//
              Column(
                children: [
                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                  //-----------------------------ปุ่มกดกลับไปหน้า menu-----------------------------//
                  Container(
                    alignment: AlignmentDirectional(0, -0.55),
                    child: TextButton.icon(
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
                        "",
                        style: (TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        )),
                      ),
                      // ignore: prefer_const_constructors
                      icon: Icon(
                        Icons.restart_alt,
                        color: Color.fromARGB(255, 255, 255, 255),
                        size: 40,
                      ), //
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('กลับไปหน้าเมนู'),
                          content:
                              const Text('ต้องการกลับไปหน้าเลือกเมนูใช่ไหม'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('ยกเลิก'),
                            ),
                            TextButton(
                              onPressed: () => {
                                Navigator.pop(context),
                                Navigator.pop(context)
                              },
                              child: const Text('กลับ'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //-----------------------------/ปุ่มกดกลับไปหน้า menu-----------------------------//

                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ
                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                  //-----------------------------แสดงคะแนนที่ได้-----------------------------//
                  Container(
                    width: MediaQuery.of(context).size.width * 0.80,
                    padding: EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                        color: Color.fromARGB(155, 0, 0, 0)),
                    child: Text(
                      " $_scor ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  //-----------------------------/แสดงคะแนนที่ได้-----------------------------//

                  Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ
                ],
              ),
            //-----------------------------/ปุ่มกดกลับไปหน้า menu และการแสดง คะแนน-----------------------------//
            //-----------------------------ถ้าะคะแนน(_scor) = 100 จะเข้าเงื่อนไขการชนะเกมส์-----------------------------//
          ],
        ),
      ),
    );
  }
}
