import 'package:flutter/material.dart';
import 'class.dart';
import 'package:http/http.dart' as http;
import 'package:ctunes/Page/player_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:connectivity/connectivity.dart';

class Loading extends StatefulWidget {
  final Tune tune;
  Loading({this.tune});

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int stateConnection;

  void returnState(int state){
    setState(() {
      stateConnection = state;
    });
  }

  void checkConnection() async{
    await Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      if(event != ConnectivityResult.none){
        returnState(1);
      }
      else{
        Navigator.pop(this.context);
      }
    });
  }

  void getSong() async{
    http.Response file = await http.get(widget.tune.musicUrl);
    widget.tune.songBytes = file.bodyBytes;
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => PlayerPage(tune: widget.tune)));
  }

  @override
  void initState() {
    super.initState();
    getSong();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff343434),
      body: Container(
        height: defaultHeight,
        padding: EdgeInsets.only(top: defaultHeight / 2.5),
        child: Column(
          children: [
            SpinKitChasingDots(
              color: Color(0xffff0000),
              size: defaultHeight / 8,
            ),
            SizedBox(height: defaultHeight / 10),
            Text(
                'Loading',
                style: TextStyle(
                fontSize: defaultHeight / 30,
                fontWeight: FontWeight.bold,
                color: Color(0xffff0000),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

