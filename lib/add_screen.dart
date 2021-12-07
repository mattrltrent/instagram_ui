import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  CameraController _controller;
  Future<void> _controllerInitializer;

  Future<CameraDescription> getCamera() async {
    print('getCamera called');
    final c = await availableCameras();
    if (front == true) {
      return c[0];
    } else {
      return c[1];
    }
  }

  void getInfo() async {
    print('before');
    await Future.delayed(Duration(milliseconds: 1000));
    print('after');
    getCamera().then((camera) {
      setState(() {
        _controller = CameraController(camera, ResolutionPreset.max);
        _controllerInitializer = _controller.initialize();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  void dispose() {
    super.dispose();
  }

  double zoom = 1.0;

  bool front = true;

  bool alreadyOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _controllerInitializer,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            alreadyOn = true;
            return Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Container(
                            decoration:
                                BoxDecoration(
                                    color: alreadyOn == true ? Colors.transparent : Colors.white,
                                    boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(2, 1),
                                blurRadius: 8,
                              ),
                            ]),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 100,
                            child: Transform.scale(
                              scale: zoom,
                              child: CameraPreview(_controller),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 518),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.deepOrange,
                                  Colors.orangeAccent
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 1),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.photo,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 1),
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 1),
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 550),
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      child: Slider(
                        divisions: 10,
                        label: '${zoom.round()}x',
                        min: 1.0,
                        max: 10.0,
                        activeColor: Colors.deepOrange,
                        inactiveColor: Colors.white,
                        value: zoom,
                        onChanged: (newZoom) {
                          setState(() {
                            zoom = newZoom;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    child: IconButton(
                        icon: Icon(
                          Icons.sync,
                          size: 35,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('sync');
                          setState(() {
                            front = !front;
                          });
                          getCamera();
                          getInfo();
                        }),
                    padding: EdgeInsets.all(5),
                  )
                ],
              ),
            );
          } else if (alreadyOn == true) {
            return Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10, top: 20),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 1),
                                    blurRadius: 8,
                                  ),
                                ]),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 100,
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.deepOrange),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 518),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.deepOrange,
                                  Colors.orangeAccent
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 1),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.photo,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 1),
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 1),
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 550),
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      child: Slider(
                        divisions: 10,
                        label: '${zoom.round()}x',
                        min: 1.0,
                        max: 10.0,
                        activeColor: Colors.deepOrange,
                        inactiveColor: Colors.white,
                        value: zoom,
                        onChanged: (newZoom) {
                          setState(() {
                            zoom = newZoom;
                          });
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('sync');
                      setState(() {
                        front = !front;
                      });
                      getCamera();
                      getInfo();
                    },
                    child: Padding(
                      child: Icon(
                        Icons.sync,
                        color: Colors.white,
                        size: 35,
                      ),
                      padding: EdgeInsets.all(13),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Transform.scale(
                          scale: 1.2,
                          child: Container(
                            decoration:
                                BoxDecoration(
                                    color: alreadyOn == true ? Colors.black : Colors.black,
                                    boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(2, 1),
                                blurRadius: 8,
                              ),
                            ]),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height - 100,
                            child: Center(
                              child: Container(
                                height: 50,
                                width: 50,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.deepOrange),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28,
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 518),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Center(
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.deepOrange,
                                  Colors.orangeAccent
                                ]),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    offset: Offset(2, 1),
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.photo,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 85,
                              width: 85,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 1),
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Colors.deepOrange,
                                    Colors.orangeAccent
                                  ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black45,
                                      offset: Offset(2, 1),
                                      blurRadius: 8,
                                    ),
                                  ]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    child: Icon(
                                      Icons.videocam,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 550),
                    child: Container(
                      height: 20,
                      width: double.infinity,
                      child: Slider(
                        divisions: 10,
                        label: '${zoom.round()}x',
                        min: 1.0,
                        max: 10.0,
                        activeColor: Colors.deepOrange,
                        inactiveColor: Colors.white,
                        value: zoom,
                        onChanged: (newZoom) {
                          setState(() {
                            zoom = newZoom;
                          });
                        },
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('sync');
                      setState(() {
                        front = !front;
                      });
                      getCamera();
                      getInfo();
                    },
                    child: Padding(
                      child: Icon(
                        Icons.sync,
                        color: Colors.white,
                        size: 35,
                      ),
                      padding: EdgeInsets.all(13),
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
// snapshot.connectionState == ConnectionState.done
//List<CameraDescription> cameras;
//
//class AddScreen extends StatefulWidget {
//
//  @override
//  _AddScreenState createState() => _AddScreenState();
//}
//
//
//class _AddScreenState extends State<AddScreen>{
//
//  Future<void> main() async {
//    cameras = await availableCameras();
//    runApp(AddScreen());
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: CameraApp(),
//    );
//  }
//}
//
//class CameraApp extends StatefulWidget {
//  @override
//  _CameraAppState createState() => _CameraAppState();
//}
//
//class _CameraAppState extends State<CameraApp> {
//  CameraController controller;
//  @override
//  void initState() {
//    super.initState();
//    controller = CameraController(cameras[0], ResolutionPreset.medium);
//    controller.initialize().then((_) {
//      if (!mounted){
//        return;
//      }
//      setState(() {});
//    });
//  }
//
//  @override
//  void dispose() {
//    controller.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    if (!controller.value.isInitialized){
//      return Container();
//    }
//    return CameraPreview(controller);
//  }
//}
