import 'package:flutter/material.dart';
import 'story_tile.dart';
import 'post_tile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  Future<Null> handleRefresh() async {
    await Future.delayed(Duration(seconds: 1));
    print('reload');
    return null;
  }

  var storyBorder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 125, bottom: 47),
            child: RefreshIndicator(
              displacement: 26,
              color: Colors.deepOrange,
              onRefresh: handleRefresh,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    PostTile(
                      username: 'dave.davidson',
                      profilePic: 4,
                      postPic: 3,
                      message:
                          'This weekend me and my friend climbed the Agaz cliffs! Was an incredible experience. 10/10 recommend!',
                      comments: 15,
                      likes: 142,
                    ),
                    PostTile(
                      username: 'emily.val',
                      profilePic: 5,
                      postPic: 4,
                      message: 'Spent some time at my cabin these last few days, super refreshing!',
                      comments: 11,
                      likes: 123,
                    ),
                    PostTile(
                      username: 'jason.franks',
                      profilePic: 1,
                      postPic: 5,
                      message: 'Sometimes you just got to stop and meditate.',
                      comments: 21,
                      likes: 140,
                    ),
                    PostTile(
                      username: 'tam.zu',
                      profilePic: 5,
                      postPic: 2,
                      message:
                          'Who else here loves the fog!? It\'s just so beautiful. Yesterday it was just so thick!',
                      comments: 16,
                      likes: 129,
                    ),
                    PostTile(
                      username: 'nicola.rory',
                      profilePic: 6,
                      postPic: 1,
                      message: 'Love this shot I got of Mike at Witlyn Lake!',
                      comments: 11,
                      likes: 141,
                    ),
                    PostTile(
                      username: 'jinx.winn',
                      profilePic: 3,
                      postPic: 6,
                      message: 'Ngl, this is probably my favorite picture on my profile.',
                      comments: 10,
                      likes: 101,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 125,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(2, 1),
                    blurRadius: 8,
                  ),
                ]),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.camera_alt),
                          SizedBox(
                            width: 96,
                          ),
                          Expanded(
                              child: Text(
                            'Instagram',
                            style: TextStyle(fontFamily: 'Pacifico', fontSize: 20),
                          )),
                          Icon(Icons.live_tv),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.send),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                          StoryTile(
                            profilePic: 3,
                            outline: 4, // person story == 4
                            scale: 1,
                          ),
                          StoryTile(
                            profilePic: 1,
                            outline: 1,
                            scale: 1,
                          ),
                          StoryTile(
                            profilePic: 3,
                            outline: 1,
                            scale: 1,
                          ),
                          StoryTile(
                            profilePic: 4,
                            outline: 1,
                            scale: 1,
                          ),
                          StoryTile(
                            profilePic: 5,
                            outline: 1,
                            scale: 1,
                          ),
                          StoryTile(
                            profilePic: 6,
                            outline: 1,
                            scale: 1,
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
    );
  }
}
