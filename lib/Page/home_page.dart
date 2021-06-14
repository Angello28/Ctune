import 'package:flutter/material.dart';
import 'package:ctunes/nav_drawer.dart';
import 'package:ctunes/class.dart';
import 'package:ctunes/template.dart';
import 'package:connectivity/connectivity.dart';

class HomePage extends StatefulWidget {
  final List<Tune> listRecommend;
  final List<Tune> listPopular;
  HomePage({this.listRecommend, this.listPopular});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int stateConnection;
  void returnState(int state){
    setState(() {
      stateConnection = state;
    });
  }

  void checkConnection() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
      if(event != ConnectivityResult.none){
        returnState(1);
      }
      else{
        returnState(0);
      }
    });
  }

  @override
  void initState(){
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    double defaultWidth = MediaQuery.of(context).size.width;
    double defaultHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff343434),
      drawer: NavDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffff0000)),
        backgroundColor: Color(0xff343434),
        elevation: 0,
      ),
      body: stateConnection == 0 ?
      Container(
        width: defaultWidth,
        height: defaultHeight,
        color: Color(0xff343434),
        child: Center(
          child: Image(
            image: AssetImage('assets/no-connection.png'),
            width: defaultWidth,
            height: defaultHeight,
          )
        ),
      )
      :
      SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(defaultWidth / 18),
            width: defaultWidth,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: defaultHeight / 50),
                  width: defaultWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Genre',
                        style: TextStyle(
                          color: Color(0xfff3f3f3),
                          fontWeight: FontWeight.bold,
                          fontSize: defaultHeight / 33,
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        height: defaultHeight / 30,
                        color: Color(0xfff3f3f3),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: defaultHeight / 40),
                  width: defaultWidth,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: listGenre.map((genre) => GenreTemplate(genre: genre)).toList()
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: defaultHeight / 100),
                  width: defaultWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recommend',
                        style: TextStyle(
                          color: Color(0xfff3f3f3),
                          fontWeight: FontWeight.bold,
                          fontSize: defaultHeight / 33,
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        height: defaultHeight / 30,
                        color: Color(0xfff3f3f3),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: defaultHeight / 40),
                  width: defaultWidth,
                  child: Column(
                    children: widget.listRecommend.map((tune) => MusicTileTemplate(tune: tune)).toList()
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: defaultHeight / 50),
                  width: defaultWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular',
                        style: TextStyle(
                          color: Color(0xfff3f3f3),
                          fontWeight: FontWeight.bold,
                          fontSize: defaultHeight / 33,
                        ),
                      ),
                      Divider(
                        thickness: 1.5,
                        height: defaultHeight / 30,
                        color: Color(0xfff3f3f3),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: defaultWidth,
                  child: Column(
                      children: widget.listPopular.map((tune) => MusicTileTemplate(tune: tune)).toList()
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
