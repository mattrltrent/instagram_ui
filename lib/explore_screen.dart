import 'package:flutter/material.dart';
import 'mini_pic_tile.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  final textFieldController = TextEditingController();

  AnimationController gController;
  Animation gAnim;
  Animation ggAnim;

  @override
  void initState() {
    print('init again');
    super.initState();
    gController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    gAnim = CurvedAnimation(parent: gController, curve: Curves.bounceOut);
    ggAnim = CurvedAnimation(parent: gController, curve: Curves.easeOut);
    gController.forward();
    gController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    gController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Transform.scale(
                  scale: 1.2, // 1.2 + (ggAnim.value * 0.10)
                  child: Stack( // proportions are 120 * layer i think or smth like that
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MiniPicTile(
                            picNum: 17,
                            dimensionNum: 1,
                          ),
                          MiniPicTile(
                            picNum: 18,
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
                              picNum: 12,
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
                              picNum: 16,
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
                              picNum: 13,
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
                              picNum: 15,
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
                              picNum: 19,
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
                              picNum: 14,
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
                              picNum: 20,
                              dimensionNum: 3,
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
          Transform.scale(
            scale: gAnim.value, // gAnim.value
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 19, left: 16, right: 16),
                    child: Container(
                      height: 50,
                      width: 450,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(4, 1),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Explore A Boundless World', style: TextStyle(fontFamily: 'Ub', fontSize: 20, color: Colors.grey),),
                          SizedBox(width: 35,),
                          Icon(Icons.search, color: Colors.grey,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
