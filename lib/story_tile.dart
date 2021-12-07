import 'package:flutter/material.dart';
import 'package:instagram_flutter/story_screen.dart';

class StoryTile extends StatefulWidget {

  final int profilePic;
  final int outline;
  final double scale;

  StoryTile({@required this.outline, @required this.profilePic, @required this.scale});

  @override
  _StoryTileState createState() => _StoryTileState();
}

class _StoryTileState extends State<StoryTile> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  bool swit = false;

  Color getOutline() {
    if (widget.outline == 1 && swit == true){
      return Colors.grey;
    }
    else if (widget.outline == 1){
      return Colors.deepOrange;
    }
    else if (widget.outline == 2){
      return Colors.grey;
    }
    else if (widget.outline == 3) {
      return Colors.transparent;
    }
    else if (widget.outline == 4) {
      return Colors.blue; // for personal story
    }
  }

  double getWidth() {
    if (widget.outline == 1 && swit == true){
      return 1.0;
    }
    else if (widget.outline == 1){
      return 2.0;
    }
    else if (widget.outline == 2){
      return 1.0;
    }
    else if (widget.outline == 3){ // doesn't matter is transparent?
      return 1.0;
    }
    else if (widget.outline == 4){ // for personal story
      return 2.0;
    }
  }

  double getOpacity(){
    if (widget.outline == 4){
      return 0.80;
    }
    else {
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.scale,
      child: GestureDetector(
        onTap: () {
          setState(() {
            swit = true;
          });
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StoryScreen()));
        },
        child: Padding(
          padding: EdgeInsets.only(right: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: getOutline(), width: getWidth()),
                shape: BoxShape.circle),
            child: SizedBox(
              width: 60,
              child: Padding(
                child: CircleAvatar(
                  backgroundColor: Colors.lightBlueAccent,
                  radius: 50,
                  child: widget.outline != 4 ? ClipOval(
                    child: Opacity(child: Image.asset('images/pp${widget.profilePic}.png'), opacity: getOpacity()),
                  ) : Center(
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: ClipOval(
                            child: Opacity(child: Image.asset('images/pp${widget.profilePic}.png'), opacity: getOpacity()),
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(child: Icon(Icons.add, color: Colors.white, size: 35), alignment: Alignment.center,),
                      ],
                    ),
                  ),
                ),
                padding: EdgeInsets.all(1),
              ),
            ),
          ),
        ),
      ),
    );
  }
}