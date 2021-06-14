import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ctunes/class.dart';
import 'package:ctunes/template.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class GenrePage extends StatefulWidget {
  final Genre genre;
  GenrePage({this.genre});

  @override
  _GenrePageState createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {

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

    String listGenreName = widget.genre.name;
    Stream listGenre;

    if(listGenreName == 'Piano'){
      listGenre = FirebaseFirestore.instance.collection('piano').snapshots();
    }
    else if(listGenreName == 'Guitar'){
      listGenre = FirebaseFirestore.instance.collection('guitar').snapshots();
    }
    else if(listGenreName == 'EDM'){
      listGenre = FirebaseFirestore.instance.collection('edm').snapshots();
    }
    else if(listGenreName == 'Metal'){
      listGenre = FirebaseFirestore.instance.collection('rock').snapshots();
    }
    else if(listGenreName == 'Hip Hop'){
      listGenre = FirebaseFirestore.instance.collection('hiphop').snapshots();
    }
    else if(listGenreName == 'Music Cover'){
      listGenre = FirebaseFirestore.instance.collection('cover').snapshots();
    }
    else if(listGenreName == 'Calm'){
      listGenre = FirebaseFirestore.instance.collection('calm').snapshots();
    }
    else{
      listGenre = FirebaseFirestore.instance.collection('romance').snapshots();
    }

    return Scaffold(
      backgroundColor: Color(0xff343434),
      appBar: AppBar(
        title: Text(widget.genre.name),
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
      StreamBuilder(
        stream: listGenre,
        builder: (context, snapshot){
        if(!snapshot.hasData){
          return Container(
            height: defaultHeight,
            padding: EdgeInsets.only(top: defaultHeight / 3.5),
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
          );
        }
        return Container(
          padding: EdgeInsets.fromLTRB(defaultWidth / 30, defaultHeight / 100, defaultWidth / 30, defaultHeight / 100),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.docs.length,
            itemBuilder: (context, index) => MusicTileTemplate(tune: Tune(
              title: snapshot.data.docs[index]['title'],
              creator: snapshot.data.docs[index]['creator'],
              cover: snapshot.data.docs[index]['cover'],
              musicUrl: snapshot.data.docs[index]['musicUrl'],
            ))
          ),
        );
      })
    );
  }
}
