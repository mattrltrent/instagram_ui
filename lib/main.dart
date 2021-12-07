import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram_flutter/add_screen.dart';
import 'package:instagram_flutter/behavior.dart';
import 'package:instagram_flutter/explore_screen.dart';
import 'package:instagram_flutter/heart_screen.dart';
import 'package:instagram_flutter/home_screen.dart';
import 'package:instagram_flutter/profile_screen.dart';
import 'nav_button_tile.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  final controller = PageController(
    initialPage: 0,
  );

  int page = 0; // current page (0-4); total 5 page

  void pgChange(int passedPage){
    setState(() {
      page = passedPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyBehavior(),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: pgChange,
            controller: controller,
            children: <Widget>[
              HomeScreen(),
              ExploreScreen(),
              AddScreen(),
              HeartScreen(),
              ProfileScreen(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: 48,
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
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      NavButtonTile(page: page, controller: controller, navButtonNum: 0, icon: Icons.home,),
                      NavButtonTile(page: page, controller: controller, navButtonNum: 1, icon: Icons.search,),
                      NavButtonTile(page: page, controller: controller, navButtonNum: 2, icon: Icons.add_box,),
                      NavButtonTile(page: page, controller: controller, navButtonNum: 3, icon: Icons.favorite_border,),
                      NavButtonTile(page: page, controller: controller, navButtonNum: 4, icon: Icons.person_outline,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ), // normally go to HomeScreen()
    );
  }
}



// take a screenshot of just the homepage with 'dark mode'
