import 'dart:typed_data';
import 'package:flutter/cupertino.dart';

class Genre {
  String name;
  String bg;

  Genre({this.name, this.bg});
}

class Tune{
  String title;
  String creator;
  String cover;
  String musicUrl;
  Uint8List songBytes;

  Tune({this.title, this.creator, this.cover, this.musicUrl, this.songBytes});
}

class AudioInstance{
  String songName;
  Uint8List songBytes;

  AudioInstance({this.songName, this.songBytes});
}

Genre piano = Genre(name: 'Piano', bg: 'piano.png');
Genre guitar = Genre(name: 'Guitar', bg: 'guitar.png');
Genre edm = Genre(name: 'EDM', bg: 'edm.jpg');
Genre metal = Genre(name: 'Metal', bg: 'metal.png');
Genre hip_hop = Genre(name: 'Hip Hop', bg: 'hiphop.png');
Genre music_cover = Genre(name: 'Music Cover', bg: 'musiccover.png');
Genre calm = Genre(name: 'Calm', bg: 'calm.png');
Genre romance = Genre(name: 'Romance', bg: 'romance.jpg');

Tune tune_1 = Tune(title: 'Title', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_2 = Tune(title: 'Piano', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_3 = Tune(title: 'Guitar', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_4 = Tune(title: 'EDM', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_5 = Tune(title: 'Metal', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_6 = Tune(title: 'Hip Hop', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_7 = Tune(title: 'Music Cover', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_8 = Tune(title: 'Calm', creator: 'Singer or Creator', cover: 'ncs.png');
Tune tune_9 = Tune(title: 'Romance', creator: 'Singer or Creator', cover: 'ncs.png');

List<Genre> listGenre = [piano, guitar, edm, metal, hip_hop, music_cover, calm, romance];

List<Tune> listTune1 = [tune_1, tune_2];
List<Tune> listTune2 = [tune_3, tune_4];
List<Tune> listPianoGenre = [tune_2, tune_2, tune_2, tune_2, tune_2, tune_2, tune_2, tune_2, tune_2, tune_2];
List<Tune> listGuitarGenre = [tune_3, tune_3, tune_3, tune_3, tune_3, tune_3, tune_3, tune_3, tune_3, tune_3];
List<Tune> listEDMGenre = [tune_4, tune_4, tune_4 , tune_4, tune_4, tune_4, tune_4, tune_4, tune_4, tune_4];
List<Tune> listMetalGenre = [tune_5, tune_5, tune_5, tune_5, tune_5, tune_5, tune_5, tune_5, tune_5, tune_5];
List<Tune> listHipHopGenre = [tune_6, tune_6, tune_6, tune_6, tune_6, tune_6, tune_6, tune_6, tune_6, tune_6];
List<Tune> listMusicCoverGenre = [tune_7, tune_7, tune_7, tune_7, tune_7, tune_7, tune_7, tune_7, tune_7, tune_7];
List<Tune> listCalmGenre = [tune_8, tune_8, tune_8, tune_8, tune_8, tune_8, tune_8, tune_8, tune_8, tune_8];
List<Tune> listRomanceGenre = [tune_9, tune_9, tune_9, tune_9, tune_9, tune_9, tune_9, tune_9, tune_9, tune_9];