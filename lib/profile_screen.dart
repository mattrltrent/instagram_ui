import 'package:flutter/material.dart';
import 'package:instagram_flutter/story_tile.dart';
import 'mini_pic_tile.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  AnimationController fController;
  Animation fAnim;

  @override
  void initState() {
    super.initState();
    fController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    fAnim = CurvedAnimation(parent: fController, curve: Curves.bounceOut);
    fController.forward();
    fAnim.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    fController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 276, bottom: 48),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 25),
                child: Stack(
                  children: <Widget>[
                    Stack(
                      // proportions are 120 * layer i think or smth like that
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MiniPicTile(
                              picNum: 1,
                              dimensionNum: 1,
                            ),
                            MiniPicTile(
                              picNum: 3,
                              dimensionNum: 4,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 120),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MiniPicTile(
                                picNum: 9,
                                dimensionNum: 2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 240),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 120,
                                height: 120,
                              ),
                              Container(
                                color: Colors.transparent,
                                width: 120,
                                height: 120,
                              ),
                              MiniPicTile(
                                picNum: 4,
                                dimensionNum: 2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 240),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 120,
                                height: 120,
                              ),
                              MiniPicTile(
                                picNum: 2,
                                dimensionNum: 1,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 360),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MiniPicTile(
                                picNum: 6,
                                dimensionNum: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 480),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              MiniPicTile(
                                picNum: 10,
                                dimensionNum: 2,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 480),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 120,
                                height: 120,
                              ),
                              MiniPicTile(
                                picNum: 5,
                                dimensionNum: 3,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 600),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.transparent,
                                width: 120,
                                height: 120,
                              ),
                              MiniPicTile(
                                picNum: 11,
                                dimensionNum: 3,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Color(0xFFEDF0F6).withOpacity(1 - fController.value),
                          width: double.infinity,
                          height: 720,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Transform.translate(
                offset: Offset(0, (-300) + (fAnim.value * 300)),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(2, 1),
                        blurRadius: 8,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'melody.bell',
                              style: TextStyle(fontFamily: 'Ub', fontSize: 17, color: Colors.grey),
                            ),
                            Icon(
                              Icons.more_vert,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              child: StoryTile(outline: 3, profilePic: 4, scale: 1.5),
                              padding: EdgeInsets.only(top: 10, bottom: 0, left: 15),
                            ),
                            Text(
                              'Melody',
                              style: TextStyle(fontFamily: 'Ub', fontSize: 25),
                            ),
                            SizedBox(
                              height: 1,
                            ),
                            Text(
                              'Just going with the flow',
                              style: TextStyle(fontFamily: 'Indie', fontSize: 20),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Followers',
                                      style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '278',
                                      style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 25,
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Posts',
                                      style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '9',
                                      style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 25,
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      'Following',
                                      style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '111',
                                      style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
