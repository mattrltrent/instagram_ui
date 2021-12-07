import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:instagram_flutter/story_tile.dart';
import 'heart_feed_tile.dart';

class HeartScreen extends StatefulWidget {
  @override
  _HeartScreenState createState() => _HeartScreenState();
}

class _HeartScreenState extends State<HeartScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  AnimationController eController;
  Animation eAnim;

  @override
  void initState() {
    super.initState();
    eController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    eAnim = CurvedAnimation(parent: eController, curve: Curves.bounceOut);
    eController.forward();
    eController.addListener(() {
      setState(() {
        print(eController.value);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    eController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 153, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      SizedBox(height: 10,),
                      Text('Today', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.grey),),
                      HeartFeedTile(
                        postNum: 9,
                        profileNum: 1,
                        reactionTypeNum: 1,
                        username: 'jason.franks',
                      ),
                      HeartFeedTile(
                        postNum: 9,
                        profileNum: 3,
                        reactionTypeNum: 5,
                        username: 'jinx.winn',
                      ),
                      Text('Yesterday', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.grey),),
                      HeartFeedTile(
                        postNum: 11,
                        profileNum: 4,
                        reactionTypeNum: 1,
                        username: 'dave.davidson',
                      ),
                      Text('May 3', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.grey),),
                      HeartFeedTile(
                        postNum: 4,
                        profileNum: 5,
                        reactionTypeNum: 4,
                        username: 'tam.zu',
                      ),
                      HeartFeedTile(
                        postNum: 4,
                        profileNum: 6,
                        reactionTypeNum: 3,
                        username: 'nicola.rory',
                      ),
                      Text('May 2', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.grey),),
                      HeartFeedTile(
                        postNum: 6,
                        profileNum: 5,
                        reactionTypeNum: 4,
                        username: 'tam.zu',
                      ),
                      SizedBox(height: 38,),
                    ],
                  ),
                  Container(
                    color: Color(0xFFEDF0F6).withOpacity(1 - eController.value),
                    width: double.infinity,
                    height: 720,
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset(0, (-155) + (eAnim.value * 155)),
                    child: Container(
                      height: 155,     // eAnim.value * 155
                      width: double.infinity,
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(2, 1),
                          blurRadius: 8,
                        ),
                      ],
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              StoryTile(outline: 3, profilePic: 2, scale: 1.4),
                              Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Column(
                                  children: <Widget>[
                                    Text('Follow Requests', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.black),),
                                    Container(height: 10, color: Colors.transparent,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 7),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('2', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.black),),
                                          SizedBox(width: 20,),
                                          Container(
                                            width: 70,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(colors: [Colors.deepOrange, Colors.orangeAccent]),
                                              borderRadius: BorderRadius.all(Radius.circular(8)),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text('View', style: TextStyle(fontFamily: 'Ub', fontSize: 15, color: Colors.white),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}


