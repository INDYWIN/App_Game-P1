import 'dart:convert';
import 'dart:math';

import 'package:gametest1/main.dart';
import 'package:gametest1/menug.dart';
import 'package:gametest1/gameplus.dart';
import 'package:gametest1/gamesubtract.dart';
import 'package:gametest1/gamemultiply.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class gamesubtract extends StatefulWidget {
  static Future<void> navigatorPush(BuildContext context) async {
    return Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => gamesubtract(),
      ),
    );
  }

  var nameg;
  gamesubtract({this.nameg});

  @override
  gamesubtractd createState() => gamesubtractd();
}

class gamesubtractd extends State<gamesubtract> {
  int _scor = 0; //--เก็บค่าของคะแนน
  int _life = 3; //--เก็บค่าของพลังชีวิต (จำนวนครั้งที่สามารถตอบผิด)
  int _loopplus = 1; //--นับลูปเพื่อแสดงเลขของด่านตามจำนวนการลูป
  @override
  Widget build(BuildContext context) {
    //-----------------------------สุ่มเลขและเก็บไว้ในตัวแปล num(1-4)-----------------------------//
    var num1 = Random().nextInt(20);
    var num2 = Random().nextInt(20);
    var num3 = Random().nextInt(20);
    var num4 = Random().nextInt(20);
    //-----------------------------/สุ่มเลขและเก็บไว้ในตัวแปล num(1-4)-----------------------------//

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
                        color: Color.fromARGB(255, 255, 250, 123),
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
                    //-----------------------------แสดงโจทย์-----------------------------//
                    Row(
                      //-----------------------------แสดงโจทย์(เงื่อนไขถ้า num1 มากกว่า num2 ให้แสดงโจทย์แรก ถ้าไม่ให้แสดงโจทย์สอง)-----------------------------//
                      children: [
                        if (num1 > num2)
                          //-----------------------------โจทย์แรก-----------------------------//
                          Text(
                            "${num1} - ${num3} = ??",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        //-----------------------------/โจทย์แรก-----------------------------//
                        else
                          //-----------------------------โจทย์สอง-----------------------------//
                          Text(
                            "${num2} - ${num4} = ??",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        //-----------------------------/โจทย์สอง-----------------------------//
                      ],
                      //-----------------------------/แสดงโจทย์(เงื่อนไขถ้า num1 มากกว่า num2 ให้แสดงโจทย์แรก ถ้าไม่ให้แสดงโจทย์สอง)-----------------------------//
                    ),
                    //-----------------------------/แสดงโจทย์-----------------------------//
                    //-----------------------------แสดงการตั้งโจทย์-----------------------------//
                    /*เงื่อนไขแบบเดียวกับการแสดงโจทย์*/

                    //----------num1 && num2
                    Row(children: [
                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                      if (num1 > num2)
                        Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "${num1} ",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        )
                      else
                        Container(
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "${num2} ",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        )
                    ]),
                    //----------/num1 && num2

                    //---------- [ - ]
                    Row(children: [
                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Text(
                        "-",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )
                    ]),
                    //---------- [ - ]

                    //----------num3 && num4
                    Row(children: [
                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                      if (num1 > num2)
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.black)),
                          ),
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "${num3}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        )
                      else
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            border:
                                Border(bottom: BorderSide(color: Colors.black)),
                          ),
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "${num4}",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ),
                        )
                    ]),
                    //----------/num3 && num4

                    //---------- [ ?? ]
                    Row(children: [
                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: MediaQuery.of(context).size.width * 0.35,
                          padding: EdgeInsets.only(right: 30.0),
                          child: Text(
                            "??",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.right,
                          ))
                    ]),
                    //---------- [ ?? ]

                    //----------เส้นคำตอบ
                    Row(children: [
                      Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        height: MediaQuery.of(context).size.height * 0.005,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(
                                color: Colors.black,
                              )),
                        ),
                      )
                    ]),
                    //----------/เส้นคำตอบ
                    //-----------------------------/แสดงการตั้งโจทย์-----------------------------//

                    Flexible(fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                    /*-----------------------------------------------อธิบาย-----------------------------------------------*/
                    /*การทำงานจะแสดง ตัวเลือกที่1 = num1-num3 กับ ตัวเลือกที่2 = num2-num4 */
                    /*กรณีที่ ตัวเลือกที่1 จะถูกก็ต่อเมื่อ num1 มากกว่า num2 ถ้าไม่ ตัวเลือกที่2 ก็จะถูก*/
                    /*อธิบาย : เพราะการจะแสดงโจทย์ จะเอาค่าที่มากกว่ามาแสดงเช่น num1 มากกว่าก็จะแสดง num1-num3 ทำให้ค่าตรงกับ ตัวเลือกที่1*/
                    /*อธิบาย : ถ้า num2 มากกว่าจะแสดง num2-num4 ทำให้ค่าตรงกับ ตัวเลือกที่2*/
                    /*เพิ่มเติม : ในเกมส์ที่ 1-4 จะมีการทำงานแบบเดียวกับเกมส์แรก เปลียนที่ + - x ÷ */
                    /*-----------------------------------------------อธิบาย-----------------------------------------------*/

                    //-----------------------------แสดงตัวเลือกคำตอบ-----------------------------//
                    Row(
                      children: <Widget>[
                        //-----------------------------แสดงตัวเลือกคำตอบที่1-----------------------------//
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 255, 250, 123),
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
                              "${num1 - num3}",
                              style: (TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              )),
                            ),
                            //-----------------------------หลังจากกดเลือก-----------------------------//
                            onPressed: () {
                              //-----------------------------กรณีตอบถูก-----------------------------//
                              if (num1 > num2)
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('คุณตอบถูก'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => {
                                          Navigator.pop(context),
                                          //-----------------------------การทำงานหลังตอบถูก-----------------------------//
                                          setState(() {
                                            _loopplus++;
                                            _scor += 20;
                                          })
                                          //-----------------------------/การทำงานหลังตอบถูก-----------------------------//
                                        },
                                        child: const Text('ไปต่อ'),
                                      ),
                                    ],
                                  ),
                                );
                              //-----------------------------/กรณีตอบถูก-----------------------------//

                              //-----------------------------กรณีตอบผิด-----------------------------//
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
                                          //-----------------------------การทำงานหลังตอบผิด-----------------------------//
                                          setState(() {
                                            _life--;
                                          })
                                          //-----------------------------การทำงานหลังตอบผิด-----------------------------//
                                        },
                                        child: const Text('ตอบอีกรอบ'),
                                      ),
                                    ],
                                  ),
                                );
                              //-----------------------------/กรณีตอบผิด-----------------------------//
                            },
                            //-----------------------------/หลังจากกดเลือก-----------------------------//
                          ),
                        ),
                        //-----------------------------/แสดงตัวเลือกคำตอบที่1-----------------------------//
                        Flexible(
                            fit: FlexFit.tight, child: SizedBox()), //ช่องไฟ

                        //-----------------------------แสดงตัวเลือกคำตอบที่2-----------------------------//
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 255, 250, 123),
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
                              "${num2 - num4}",
                              style: (TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              )),
                            ),
                            //-----------------------------หลังจากกดเลือก-----------------------------//
                            onPressed: () {
                              //-----------------------------กรณีตอบผิด-----------------------------//
                              if (num1 > num2)
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('คุณตอบผิด'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => {
                                          Navigator.pop(context),
                                          //-----------------------------การทำงานหลังตอบผิด-----------------------------//
                                          setState(() {
                                            _life--;
                                          })
                                          //-----------------------------/การทำงานหลังตอบผิด-----------------------------//
                                        },
                                        child: const Text('ตอบอีกรอบ'),
                                      ),
                                    ],
                                  ),
                                );
                              //-----------------------------/กรณีตอบผิด-----------------------------//

                              //-----------------------------กรณีตอบถูก-----------------------------//
                              else
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('คุณตอบถูก'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => {
                                          Navigator.pop(context),
                                          //-----------------------------การทำงานหลังตอบถูก-----------------------------//
                                          setState(() {
                                            _loopplus++;
                                            _scor += 20;
                                          })
                                          //-----------------------------/การทำงานหลังตอบถูก-----------------------------//
                                        },
                                        child: const Text('ไปต่อ'),
                                      ),
                                    ],
                                  ),
                                );
                              //-----------------------------/กรณีตอบถูก-----------------------------//
                            },
                            //-----------------------------/หลังจากกดเลือก-----------------------------//
                          ),
                        ),
                        //-----------------------------/แสดงตัวเลือกคำตอบที่2-----------------------------//
                      ],
                    ),
                    //-----------------------------/แสดงตัวเลือกคำตอบ-----------------------------//
                    Flexible(fit: FlexFit.tight, child: SizedBox()),
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
