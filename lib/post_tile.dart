import 'dart:math';

import 'package:flutter/material.dart';
import 'story_tile.dart';

class PostTile extends StatefulWidget {
  final int profilePic;
  final String username;
  final int postPic;
  final int likes;
  final int comments;
  final String message;

  PostTile(
      {@required this.profilePic,
      @required this.message,
      @required this.username,
      @required this.comments,
      @required this.likes,
      @required this.postPic});

  @override
  _PostTileState createState() => _PostTileState();
}

class _PostTileState extends State<PostTile>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin{

  Random rnd = Random();
  int min = 100;
  int max = 999;
  int likeCount;

  AnimationController bController;
  Animation bAnim;

  @override
  void initState() {
    super.initState();
    likeCount = min + rnd.nextInt(max - min);
    bController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    bAnim = IntTween(begin: 0, end: 25).animate(bController);
    bController.addListener(() {
      setState(() {
      });
    });
  }

  @override
  bool get wantKeepAlive => true;

  var xSavedFill = false;
  var xLikeFill = false;

  @override
  void dispose() {
    super.dispose();
    bController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      // old height 500, current height adjusts to child height
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              offset: Offset(2, 1),
              blurRadius: 8,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10, right: 12, left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: StoryTile(
                      outline: 3, profilePic: widget.profilePic, scale: 1),
                  width: 55,
                  height: 55,
                ),
                Container(
                  width: 150,
                  child: Text(
                    '${widget.username}',
                    style: TextStyle(fontFamily: 'Ub', fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: 75,
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: GestureDetector(
                  onDoubleTap: () {
                    if (xLikeFill == false) {
                      bController.forward();
                      setState(() {
                        likeCount++;
                      });
                    }
                    else{
                      setState(() {
                        likeCount--;
                      });
                    }
                    setState(() {
                      xLikeFill = !xLikeFill;
//                      if (xLikeFill == false) {
//                        bController.forward();
//                      }
                    });
                    bAnim.addStatusListener((status1) async{
                      if (status1 == AnimationStatus.completed) {
                        await Future.delayed(const Duration(milliseconds : 500));
                        bController.reverse();
                      }
                    });
                  },
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: 330,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(
                                  'images/post${widget.postPic}.jpg'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      Container(
                        height: 330,
                        child: Center(
                          child: Transform.scale(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white.withOpacity(0.7),
                              size: 70,
                            ),
                            scale: bController.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(
                      xLikeFill == false ? Icons.favorite_border : Icons.favorite,
                      color: xLikeFill == false ? Colors.black : Colors.red,
                    ),
                    onTap: () {
                      if (xLikeFill == false) {
                        bController.forward();
                        setState(() {
                          likeCount++;
                        });
                      }
                      else{
                        setState(() {
                          likeCount--;
                        });
                      }
                      setState(() {
                        xLikeFill = !xLikeFill;
                      });
                      bAnim.addStatusListener((status1) async{
                        if (status1 == AnimationStatus.completed) {
                        await Future.delayed(const Duration(milliseconds : 500));
                          bController.reverse();
                        }
                      });
                    },
                  ),
                  SizedBox(width: 2),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: Text(
                      '$likeCount',
                      style: TextStyle(fontFamily: 'Ub', fontSize: 20),
                      key: ValueKey<int>(likeCount),
                    ),
                  ),
                  SizedBox(width: 15),
                  Icon(
                    Icons.chat_bubble_outline,
                    size: 20,
                  ),
                  SizedBox(width: 2),
                  Text(
                    '${widget.comments}',
                    style: TextStyle(fontFamily: 'Ub', fontSize: 20),
                  ),
                  SizedBox(width: 155),
                  GestureDetector(
                    child: xSavedFill == false
                        ? Icon(Icons.bookmark_border)
                        : Icon(Icons.bookmark),
                    onTap: () {
                      setState(() {
                        xSavedFill = !xSavedFill;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 11, right: 11, top: 5),
                child: Text(
                  '${widget.username}: ${widget.message}',
                  style: TextStyle(fontFamily: 'Ub', fontSize: 15),
                )),
          ],
        ),
      ),
    );
  }
}
