import 'package:flutter/material.dart';
import 'story_tile.dart';

class HeartFeedTile extends StatelessWidget {
  final int postNum;
  final String username;
  final int reactionTypeNum;
  final int profileNum;

  HeartFeedTile(
      {@required this.username,
      @required this.postNum,
      @required this.profileNum,
      @required this.reactionTypeNum});

  String getReactionType() {
    switch (reactionTypeNum) {
      case 1:
        {
          return 'Liked Your Post';
        }
        break;
      case 2:
        {
          return 'Unliked Your Post';
        }
        break;
      case 3:
        {
          return 'Commented On Your Post';
        }
        break;
      case 4:
        {
          return 'Saved Your Post';
        }
        break;
      case 5:
        {
          return 'Shared Your Post';
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          StoryTile(outline: 3, profilePic: profileNum == 2 ? 3 : profileNum, scale: 1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                username,
                style: TextStyle(fontFamily: 'Ub', fontSize: 15, color: Colors.black),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  getReactionType(),
                  style: TextStyle(
                      fontFamily: 'Ub',
                      fontSize: 15,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                ),
                width: 180,
              ),
            ],
          ),
          SizedBox(
            width: 38,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:
                  DecorationImage(image: AssetImage('images/post$postNum.jpg'), fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }
}
