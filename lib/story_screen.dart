import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> with SingleTickerProviderStateMixin{

  AnimationController dController;
  Animation dAnim;

  var val;

  var startNum = 21;

  @override
  void initState() {
    dController = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
    dAnim = IntTween(begin: 0, end: 340).animate(dController);
    dController.addListener(() {
      setState(() {
        val  = dAnim.value.toDouble();
      });
    });
    dController.forward();
    dAnim.addStatusListener((status1) {
      if (status1 == AnimationStatus.completed) {
        setState(() {
          if (startNum > 21){
            startNum = 21;
            Navigator.pop(context);
          }
          startNum++;
          dController.forward(from: 0);
        });

      }
    });
    super.initState();
  }

  @override
  void dispose() {
    dController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTapDown: (d) {
                dController.stop();
              },
              onTapUp: (u) {
                dController.forward();
                },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'images/post$startNum.jpg'
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(child: Container(color: Colors.white, height: 2, width: val), padding: EdgeInsets.all(10),), // 1 - 340
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: AssetImage('images/pp6.png'),
                        radius: 30,
                      ),
                      SizedBox(width: 5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.deepOrange, Colors.orangeAccent]),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(child: Text('2 hrs', style: TextStyle(fontFamily: 'Ub', fontSize: 15, color: Colors.white),), padding: EdgeInsets.symmetric(horizontal: 5),),
                              ],
                            ),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [Colors.deepOrange, Colors.orangeAccent]),
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(child: Text('nicola.rory', style: TextStyle(fontFamily: 'Ub', fontSize: 15, color: Colors.white),), padding: EdgeInsets.symmetric(horizontal: 5),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 143,),
                      Container(
                        height: 57,
                        width: 50,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [Colors.deepOrange, Colors.orangeAccent]),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(child: Icon(Icons.send, color: Colors.white,), padding: EdgeInsets.symmetric(horizontal: 5),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
