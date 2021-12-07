import 'package:flutter/material.dart';

class MiniPicTile extends StatelessWidget {

  final int picNum;
  final int dimensionNum;

  MiniPicTile({@required this.dimensionNum, @required this.picNum});

  double getDimensionWidth(){
    switch (dimensionNum){
      case 1: {
        return 110.0;
      }
      break;
      case 2: {
        return 110.0;
      }
      break;
      case 3: {
        return 230.0;
      }
      break;
      case 4: {
        return 230.0;
      }
      break;
    }
  }

  double getDimensionHeight(){
    switch (dimensionNum){
      case 1: {
        return 110.0;
      }
      break;
      case 2: {
        return 230.0;
      }
      break;
      case 3: {
        return 110.0;
      }
      break;
      case 4: {
        return 230.0;
      }
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        height: getDimensionHeight(),
        width: getDimensionWidth(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(fit: BoxFit.cover, image: AssetImage('images/post$picNum.jpg')),
        ),
      ),
    );
  }
}