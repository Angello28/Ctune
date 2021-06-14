import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:intl/intl.dart';
import 'package:ctunes/class.dart';

class PlayerForStorage extends StatefulWidget {
  final AudioInstance audio;
  PlayerForStorage({this.audio});

  @override
  _PlayerForStorageState createState() => _PlayerForStorageState();
}

class _PlayerForStorageState extends State<PlayerForStorage> {
  bool playing = true;
  bool isEverPlayed = true;

  AudioPlayer player;

  Duration position = new Duration();
  Duration musicLength = new Duration();

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
    player = AudioPlayer();
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

    player.playBytes(widget.audio.songBytes);
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
        body: Container(
          padding: EdgeInsets.fromLTRB(defaultWidth / 10, defaultHeight / 15, defaultWidth / 10, defaultHeight / 50),
          width: defaultWidth,
          child: Column(
            children: [
              Image(image: AssetImage("assets/album.png"),
                width: defaultHeight / 3.5,
                height: defaultHeight / 3.5,
              ),
              SizedBox(
                height: defaultHeight / 35,
              ),
              Text(
                widget.audio.songName,
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
                'Ctune',
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
                        player.playBytes(widget.audio.songBytes);
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
      ),
    );
  }
}
