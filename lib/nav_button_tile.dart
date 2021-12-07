import 'package:flutter/material.dart';

class NavButtonTile extends StatefulWidget{

  final int page;
  final PageController controller;
  final int navButtonNum;
  final IconData icon;

  const NavButtonTile({@required this.page, @required this.controller, @required this.navButtonNum, @required this.icon});

  @override
  _NavButtonTileState createState() => _NavButtonTileState();
}

class _NavButtonTileState extends State<NavButtonTile> with SingleTickerProviderStateMixin {

  AnimationController aController;
  Animation anim;

  @override
  void initState() {
    super.initState();
    aController = AnimationController(
      duration: Duration(milliseconds: 25),
      vsync: this,
    );
    anim = IntTween(begin: 100, end: 80).animate(aController);
    aController.addListener((){
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    aController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Transform.scale(
        scale: anim.value / 100, // 1.0 -> 0.75 -> 1.0 [25]
        child: Icon(
          widget.icon,
          size: 30,
          color: widget.page == widget.navButtonNum
              ? Colors.black
              : Colors.black.withOpacity(0.5),
        ),
      ),
      onTap: () {
        widget.controller.animateToPage(widget.navButtonNum,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn);
        aController.forward();
        anim.addStatusListener((status){
          if (status == AnimationStatus.completed){
          aController.reverse();
        }
      });
      },
    );
  }
}