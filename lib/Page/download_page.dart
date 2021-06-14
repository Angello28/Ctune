import 'dart:io';
import 'package:flutter/material.dart';
import 'package:id3/id3.dart';
import 'player_storage_page.dart';
import 'package:ctunes/class.dart';

class DownloadPage extends StatefulWidget {
  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  MP3Instance mp3instance;
  Future<List<AudioInstance>> fetchStorage() async{
    List<AudioInstance> listAudio = [];
    AudioInstance musicFromStorage;
    Directory dir = Directory('/sdcard/Ctunes/');
    List<FileSystemEntity> _files;
    _files = dir.listSync(recursive: true, followLinks: false);
    for(FileSystemEntity entity in _files) {
      String path = entity.path;
      if(path.endsWith('.mp3')){
        musicFromStorage  = new AudioInstance();
        mp3instance = new MP3Instance(path);
        musicFromStorage.songName = path.replaceAll("/sdcard/Ctunes/", "");
        musicFromStorage.songBytes = mp3instance.mp3Bytes;
        listAudio.add(musicFromStorage);
      }
    }
    return listAudio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff343434),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffff0000)),
        backgroundColor: Color(0xff343434),
        elevation: 0,
        title: Text('Download'),
      ),
      body: FutureBuilder(
        future: fetchStorage(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return AudioTile(listAudio: snapshot.data);
          }
          else{
            return Center(
              child:Text("No Data",
                style: TextStyle(
                color: Color(0xfff3f3f3)
                ),
              ),
            );
          }
        }
      )
    );
  }
}

class AudioTile extends StatefulWidget {
  final List<AudioInstance> listAudio;
  AudioTile({this.listAudio});

  @override
  _AudioTileState createState() => _AudioTileState();
}

class _AudioTileState extends State<AudioTile> {
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listAudio == null? 0 : widget.listAudio.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.music_note, color: Color(0xfff3f3f3)),
            title: Text(
              widget.listAudio[index].songName,
              style: TextStyle(
                  color: Color(0xfff3f3f3)
              ),
            ),
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlayerForStorage(audio: widget.listAudio[index])),
              );
            },
          );
        }
    );
  }
}