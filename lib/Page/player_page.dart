import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:ctunes/class.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:disk_space/disk_space.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PlayerPage extends StatefulWidget with WidgetsBindingObserver{
  final Tune tune;
  PlayerPage({this.tune});

  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {

  bool playing = false;
  bool isEverPlayed = false;

  AudioPlayer player;

  Duration position = new Duration();
  Duration musicLength = new Duration();

  int stateConnection;
  void returnState(int state){
    setState(() {
      stateConnection = state;
    });
  }

  void checkConnection() {
    setState(() {
      Connectivity().onConnectivityChanged.listen((ConnectivityResult event) {
        if(event != ConnectivityResult.none){
          returnState(1);
        }
        else{
          returnState(0);
        }
      });
    });
  }

  Widget slider(double size){
    return Container(
      width: size,
      child: Slider.adaptive(
          activeColor: Color(0xfff3f3f3),
          inactiveColor: Color(0xfff3f3f3),
          value: position.inSeconds.toDouble(),
          max: musicLength.inSeconds.toDouble(),
          onChanged: (value){
            seekToSec(value.toInt());
          }),
    );
  }

  void seekToSec(int sec){
    Duration newPos = Duration(seconds: sec);
    player.seek(newPos);
  }

  void stopMusic(){
    setState(() {
      player.stop();
      player.release();
      playing = false;
    });
  }

  @override
  void initState(){
    super.initState();
    checkConnection();
    player = AudioPlayer();
    player.setUrl(widget.tune.musicUrl);
    player.setReleaseMode(ReleaseMode.LOOP);

    player.onDurationChanged.listen((Duration d){
      setState(() {
        musicLength = d;
      });
    });

    player.onAudioPositionChanged.listen((Duration p){
      setState(() {
        position = p;
      });
    });

    player.onPlayerCompletion.listen((event) {
      setState(() {
        position = musicLength;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var waktu = new NumberFormat("00");

    double defaultWidth = MediaQuery.of(context).size.width;
    double defaultHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async {
        stopMusic();
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff343434),
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
        Container(
          padding: EdgeInsets.fromLTRB(defaultWidth / 10, defaultHeight / 15, defaultWidth / 10, defaultHeight / 50),
          width: defaultWidth,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: widget.tune.cover,
                placeholder: (context, url) => Image(image: AssetImage("assets/album.png")),
                width: defaultHeight / 3.5,
                height: defaultHeight / 3.5,
              ),
              SizedBox(
                height: defaultHeight / 35,
              ),
              Text(
                widget.tune.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: defaultHeight / 25,
                    color: Color(0xfff3f3f3)
                ),
              ),
              SizedBox(
                height: defaultHeight / 60,
              ),
              Text(
                widget.tune.creator,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: defaultHeight / 45,
                    color: Color(0xbbf3f3f3)
                ),
              ),
              SizedBox(
                height: defaultHeight / 60,
              ),
              slider(defaultWidth),
              Container(
                width: defaultWidth / 1.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${waktu.format(position.inMinutes)}:${waktu.format(position.inSeconds.remainder(60))}',
                      style: TextStyle(
                          fontSize: defaultHeight / 60,
                          color: Color(0xfff3f3f3)
                      ),
                    ),
                    Text(
                      '${waktu.format(musicLength.inMinutes)}:${waktu.format(musicLength.inSeconds.remainder(60))}',
                      style: TextStyle(
                          fontSize: defaultHeight / 60,
                          color: Color(0xfff3f3f3)
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: defaultHeight / 60,
              ),
              IconButton(
                icon: Icon(playing ? Icons.pause_circle_filled_rounded : Icons.play_circle_fill_rounded),
                iconSize: defaultHeight / 10,
                color: Color(0xfff3f3f3),
                onPressed: (){
                  if(!playing){
                    if(!isEverPlayed){
                      setState(() {
                        player.playBytes(widget.tune.songBytes);
                        playing = true;
                        isEverPlayed = true;
                      });
                    }
                    else{
                      setState(() {
                        player.resume();
                        playing = true;
                      });
                    }
                  }
                  else{
                    setState(() {
                      player.pause();
                      playing = false;
                    });
                  }
                },
              )
            ],
          ),
        ),
        floatingActionButton: stateConnection == 0 ?
        Container(
          width: 0,
          height: 0,
        )
            :
        Container(
          margin: EdgeInsets.only(right: defaultWidth / 50),
          child: SizedBox(
            width: defaultWidth / 6,
            height: defaultHeight / 8,
            child: FloatingActionButton(
              child: Icon(Icons.download_sharp),
              elevation: 0,
              backgroundColor: Color(0xffff0000),
              onPressed: () async{
                final status = await Permission.storage.request();
                double freeSpace = await DiskSpace.getFreeDiskSpace;
                if(status.isGranted){
                  if(freeSpace < 100.00){
                    return showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Insufficient Storage", style: TextStyle(color:Color(0xffffffff))),
                          content: Text(
                              "You don't have enough space in your external storage, minimum 100 MB free required. Your free space : ${freeSpace.toStringAsFixed(0)} MB",
                              style: TextStyle(color:Color(0xffffffff))),
                          actions: [
                            FlatButton(
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                child: Text("Ok", style: TextStyle(color:Color(0xffff0000)))
                            )
                          ],
                          backgroundColor: Color(0xff343434),
                        )
                    );
                  }
                  else{
                    Directory extDir = await getExternalStorageDirectory();
                    String privateFolder = "";
                    List<String> folders = extDir.path.split("/");
                    for(int x = 1; x < folders.length; x++){
                      String folder = folders[x];
                      if(folder!="Android"){
                        privateFolder += "/" + folder;
                      }
                      else
                        break;
                    }
                    privateFolder = privateFolder + "/Ctunes";
                    extDir = Directory(privateFolder);
                    if(!await extDir.exists()){
                      await extDir.create(recursive: true);
                    }
                    if(await extDir.exists()){
                      final id = await FlutterDownloader.enqueue(
                        url: widget.tune.musicUrl,
                        savedDir: extDir.path,
                        fileName: '${widget.tune.title}.mp3',
                        showNotification: true,
                        openFileFromNotification: false,
                      );
                    }
                  }
                }
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}