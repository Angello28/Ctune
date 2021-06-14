import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'class.dart';
import 'package:ctunes/Page/home_page.dart';
import 'package:just_audio/just_audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ctunes/class.dart';
import 'package:rxdart/rxdart.dart';

class Loading extends StatefulWidget {
  final Tune tune;
  Loading({this.tune});

  @override
  _LoadingState createState() => _LoadingState();
}
AudioPlayer player = AudioPlayer();

class _LoadingState extends State<Loading> {
  List<Tune> listAllTunePopular = [];
  List<Tune> listAllTuneRecommendation = [];
  List<Tune> topPopular = [];
  List<Tune> topRecommendation = [];

  Function _sound = (){
    player.play();
    return 1;
  };

  Map <int, Widget> output = {1 : Loading()};

  void show(List<QuerySnapshot> document){
    for (int i = 0 ; i < document.length; i++) {
      List<Tune> tempRecommendation = [];
      List<Tune> tempPopular = [];
      tempRecommendation = document[i].docs.map((doc) =>
          Tune(
            title: doc['title'],
            creator: doc['creator'],
            cover: doc['cover'],
            musicUrl: doc['musicUrl'],
          )).whereType<Tune>().toList();

      tempPopular = document[i].docs.map((doc) =>
          Tune(
            title: doc['title'],
            creator: doc['creator'],
            cover: doc['cover'],
            musicUrl: doc['musicUrl'],
          )).whereType<Tune>().toList();

      for(int j = 0 ; j < tempPopular.length ;j++) {
        listAllTuneRecommendation.add(tempRecommendation[j]);
        listAllTunePopular.add(tempPopular[j]);
      }
    }

    listAllTuneRecommendation.shuffle();
    listAllTunePopular.shuffle();
    for(int i = 0 ; i < 7; i++){
      topPopular.add(listAllTunePopular[i]);
      topRecommendation.add(listAllTuneRecommendation[i]);
    }
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) =>
          HomePage(
              listRecommend: topRecommendation,
              listPopular: topPopular
          ))
      );
    });
  }

  @override
  void initState(){
    super.initState();
    _sound();
    player.setAsset('assets/SC_Audio.mp3');
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double defaultHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff343434),
      body: StreamBuilder(
        stream: CombineLatestStream.list([
          FirebaseFirestore.instance.collection('edm').snapshots(),
          FirebaseFirestore.instance.collection('calm').snapshots(),
          FirebaseFirestore.instance.collection('cover').snapshots(),
          FirebaseFirestore.instance.collection('guitar').snapshots(),
          FirebaseFirestore.instance.collection('hiphop').snapshots(),
          FirebaseFirestore.instance.collection('piano').snapshots(),
          FirebaseFirestore.instance.collection('rock').snapshots(),
          FirebaseFirestore.instance.collection('romance').snapshots(),
        ]),

        builder: (context, snapshot){
          if(snapshot.hasData){
            show(snapshot.data);
          }
          return Container(
            height: defaultHeight,
            padding: EdgeInsets.only(top: defaultHeight / 2.5),
            child: Column(
              children: [
                Center(
                  child: Image(
                    image: AssetImage('assets/ctune.png'),
                    width: defaultHeight / 5,
                    height: defaultHeight / 5,
                  ),
                ),
                SizedBox(height: defaultHeight / 3.3),
                Center(
                  child: Text(
                    'by',
                    style: TextStyle(
                      fontSize: defaultHeight / 50,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Crewmates',
                    style: TextStyle(
                      fontSize: defaultHeight / 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
