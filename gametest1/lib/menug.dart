import 'package:gametest1/main.dart';
import 'package:gametest1/menug.dart';
import 'package:gametest1/gameplus.dart';
import 'package:gametest1/gamesubtract.dart';
import 'package:gametest1/gamemultiply.dart';
import 'package:gametest1/gamedivision.dart';
import 'package:gametest1/gamegeometry.dart';
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

  var namem; //----------namem เก็บค่าจาก name ที่อยู่ใน main.dart
  menugamestart({this.namem}); //------------แชร์ name ให้ใช้ได้ใน menug.dart

  @override
  menugame createState() => menugame();
}

class menugame extends State<menugamestart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //-----------แก้แป้นพิมพ์กินหน้าจอ-------------//
      resizeToAvoidBottomInset: false,
      //-----------/แก้แป้นพิมพ์กินหน้าจอ-------------//
      body: Container(
        //------------------------------ภาพพื้นหลัง------------------------------//
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/BG2.jpg"), fit: BoxFit.cover),
        ),
        //------------------------------/ภาพพื้นหลัง------------------------------//
        child: Column(
          //------------------------------จัดUIต่างๆให้อยู่ตรงกลาง------------------------------//
          mainAxisAlignment: MainAxisAlignment.center,
          //------------------------------/จัดUIต่างๆให้อยู่ตรงกลาง------------------------------//
          children: [
            //------------------------------กล่องUI บวก------------------------------//
            SizedBox(
              width: 250,
              height: 70,
              //------------------------------ปุมกดไปเกมส์การบวก------------------------------//
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 144, 255, 144),
                  shape: RoundedRectangleBorder(
                    // ignore: prefer_const_constructors
                    side: BorderSide(
                        color: Color.fromARGB(255, 0, 189, 47), width: 5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Text(
                      "การบวก ( + )",
                      style: (TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MN_NUTELLA',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color.fromARGB(255, 0, 110, 30),
                      )),
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "การบวก ( + )",
                      style: (const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'MN_NUTELLA',
                          color: Colors.white)),
                    ),
                  ],
                ),
                //------------------------------กำหนดการทำงานหลังกด------------------------------//
                onPressed: () {
                  //หลังกดให้ไปที่ class gameplus อยู่ที่ gameplus.dart
                  //และส่งค่าจาก namem ไปให้ nameg
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => gameplus(
                        nameg: widget.namem,
                      ),
                    ),
                  );
                },
                //------------------------------/กำหนดการทำงานหลังกด------------------------------//
              ),
              //------------------------------/ปุมกดไปเกมส์การบวก------------------------------//
            ),
            //------------------------------/กล่องUI บวก------------------------------//

            //------------------------------ช่องไฟ------------------------------//
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            //------------------------------/ช่องไฟ------------------------------//

            //------------------------------กล่องUI ลบ------------------------------//
            SizedBox(
              width: 250,
              height: 70,
              //------------------------------ปุมกดไปเกมส์การลบ------------------------------//
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 255, 153),
                  shape: RoundedRectangleBorder(
                    // ignore: prefer_const_constructors
                    side: BorderSide(
                        color: Color.fromARGB(255, 173, 212, 0), width: 5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Text(
                      "การลบ ( - )",
                      style: (TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MN_NUTELLA',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color.fromARGB(255, 80, 110, 0),
                      )),
                    ),
                    Text(
                      "การลบ ( - )",
                      style: (TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'MN_NUTELLA',
                          color: Colors.white)),
                    ),
                  ],
                ),
                //------------------------------กำหนดการทำงานหลังกด------------------------------//
                onPressed: () {
                  //หลังกดให้ไปที่ class gamesubtract อยู่ที่ gamesubtract.dart
                  //และส่งค่าจาก namem ไปให้ nameg
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => gamesubtract(
                        nameg: widget.namem,
                      ),
                    ),
                  );
                },
                //------------------------------/กำหนดการทำงานหลังกด------------------------------//
              ),
              //------------------------------/ปุมกดไปเกมส์การลบ------------------------------//
            ),
            //------------------------------/กล่องUI ลบ------------------------------//

            //------------------------------ช่องไฟ------------------------------//
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            //------------------------------/ช่องไฟ------------------------------//

            //------------------------------กล่องUI คูณ------------------------------//
            SizedBox(
              width: 250,
              height: 70,
              //------------------------------ปุมกดไปเกมส์การคูณ------------------------------//
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 144, 144, 255),
                  shape: RoundedRectangleBorder(
                    // ignore: prefer_const_constructors
                    side: BorderSide(
                        color: Color.fromARGB(255, 0, 72, 206), width: 5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Text(
                      "การบคูณ ( x )",
                      style: (TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MN_NUTELLA',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color.fromARGB(255, 0, 39, 110),
                      )),
                    ),
                    Text(
                      "การบคูณ ( x )",
                      style: (TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'MN_NUTELLA',
                          color: Colors.white)),
                    ),
                  ],
                ),
                //------------------------------กำหนดการทำงานหลังกด------------------------------//
                onPressed: () {
                  //หลังกดให้ไปที่ class gamemultiply อยู่ที่ gamemultiply.dart
                  //และส่งค่าจาก namem ไปให้ nameg
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => gamemultiply(
                        nameg: widget.namem,
                      ),
                    ),
                  );
                },
                //------------------------------/กำหนดการทำงานหลังกด------------------------------//
              ),
              //------------------------------/ปุมกดไปเกมส์การคูณ------------------------------//
            ),
            //------------------------------/กล่องUI คูณ------------------------------//

            //------------------------------ช่องไฟ------------------------------//
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            //------------------------------/ช่องไฟ------------------------------//

            //------------------------------กล่องUI หาร------------------------------//
            SizedBox(
              width: 250,
              height: 70,
              //------------------------------ปุมกดไปเกมส์การหาร------------------------------//
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 144, 255, 255),
                  shape: RoundedRectangleBorder(
                    // ignore: prefer_const_constructors
                    side: BorderSide(
                        color: Color.fromARGB(255, 0, 206, 189), width: 5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Text(
                      "การหาร ( ÷ )",
                      style: (TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MN_NUTELLA',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color.fromARGB(255, 0, 120, 110),
                      )),
                    ),
                    Text(
                      "การหาร ( ÷ )",
                      style: (TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'MN_NUTELLA',
                          color: Colors.white)),
                    ),
                  ],
                ),
                //------------------------------กำหนดการทำงานหลังกด------------------------------//
                onPressed: () {
                  //หลังกดให้ไปที่ class gamedivision อยู่ที่ gamedivision.dart
                  //และส่งค่าจาก namem ไปให้ nameg
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => gamedivision(
                        nameg: widget.namem,
                      ),
                    ),
                  );
                },
                //------------------------------/กำหนดการทำงานหลังกด------------------------------//
              ),
              //------------------------------/ปุมกดไปเกมส์การหาร------------------------------//
            ),
            //------------------------------/กล่องUI หาร------------------------------//

            //------------------------------ช่องไฟ------------------------------//
            Padding(
              padding: const EdgeInsets.all(5.0),
            ),
            //------------------------------/ช่องไฟ------------------------------//

            //------------------------------กล่องUI รูปทรงเรขาคณิต------------------------------//
            SizedBox(
              width: 250,
              height: 70,
              //------------------------------ปุมกดไปเกมส์รูปทรงเรขาคณิต------------------------------//
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 144, 255),
                  shape: RoundedRectangleBorder(
                    // ignore: prefer_const_constructors
                    side: BorderSide(
                        color: Color.fromARGB(255, 196, 0, 186), width: 5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Stack(
                  children: [
                    Text(
                      "รูปทรงเรขาคณิต( □ )",
                      style: (TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'MN_NUTELLA',
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Color.fromARGB(255, 120, 0, 110),
                      )),
                    ),
                    Text(
                      "รูปทรงเรขาคณิต( □ )",
                      style: (TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'MN_NUTELLA',
                          color: Colors.white)),
                    ),
                  ],
                ),
                //------------------------------กำหนดการทำงานหลังกด------------------------------//
                onPressed: () {
                  //หลังกดให้ไปที่ class gamegeometry อยู่ที่ gamegeometry.dart
                  //และส่งค่าจาก namem ไปให้ nameg
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => gamegeometry(
                        nameg: widget.namem,
                      ),
                    ),
                  );
                },
                //------------------------------/กำหนดการทำงานหลังกด------------------------------//
              ),
              //------------------------------/ปุมกดไปเกมส์รูปทรงเรขาคณิต------------------------------//
            ),
            //------------------------------/กล่องUI รูปทรงเรขาคณิต------------------------------//

            //------------------------------ช่องไฟ------------------------------//
            Padding(
              padding: const EdgeInsets.all(15.0),
            ),
            //------------------------------/ช่องไฟ------------------------------//

            //------------------------------กล่องUI กดกลับ------------------------------//
            SizedBox(
              width: 150,
              //------------------------------ปุมกดกลับไปหน้าแรก------------------------------//
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 109, 109),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Color.fromARGB(255, 255, 143, 143), width: 5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                label: Text(
                  "กลับ",
                  style: (TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'MN_NUTELLA',
                  )),
                ),

                // ignore: prefer_const_constructors
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 40,
                ),
                //------------------------------กำหนดการทำงานหลังกด------------------------------//
                onPressed: () => {
                  //ปิด menug.dart และเปิด main.dart โดยที่ไม่ส่งค่าอะไร
                  Navigator.pop(context),
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => mygame()))
                },
                //------------------------------/กำหนดการทำงานหลังกด------------------------------//
              ),
              //------------------------------/ปุมกดกลับไปหน้าแรก------------------------------//
            ),
            //------------------------------/กล่องUI กดกลับ------------------------------//
          ],
        ),
      ),
    );
  }
}
