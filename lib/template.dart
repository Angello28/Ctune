import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ctunes/class.dart';
import 'package:ctunes/Page/genre_page.dart';
import 'loading.dart';
import 'package:battery/battery.dart';

class GenreTemplate extends StatelessWidget {
  final Genre genre;
  GenreTemplate({this.genre});

  @override
  Widget build(BuildContext context) {
    double defaultWidth = MediaQuery.of(context).size.width;
    double defaultHeight = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => GenrePage(genre: genre)),
        );
      },
      child: Container(
        width: defaultWidth / 2.35,
        padding: EdgeInsets.only(top: defaultHeight / 45, bottom: defaultHeight / 45),
        margin: EdgeInsets.only(bottom: defaultHeight / 50),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/${genre.bg}"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          ),
        ),
        child: Center(
          child: Text(
            genre.name,
            style: TextStyle(
                color: Color(0xfff3f3f3),
                fontSize: defaultHeight / 35,
                fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}

class MusicTileTemplate extends StatefulWidget {
  final Tune tune;
  MusicTileTemplate({this.tune});
  @override
  _MusicTileTemplateState createState() => _MusicTileTemplateState();
}

class _MusicTileTemplateState extends State<MusicTileTemplate> {

  final Battery _battery = Battery();
  int _batteryLevel;

  @override
  Widget build(BuildContext context) {
    double defaultWidth = MediaQuery.of(context).size.width;

    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: widget.tune.cover,
        placeholder: (context, url) => Image(image: AssetImage("assets/album.png")),
        width: defaultWidth/8,
        height: defaultWidth/8,
      ),
      title: Text(
        widget.tune.title,
        style: TextStyle(
            color: Color(0xfff3f3f3)
        ),
      ),
      subtitle: Text(
        widget.tune.creator,
        style: TextStyle(
            color: Color(0xfff3f3f3)
        ),
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () async
      {
        final int batteryLevel = await _battery.batteryLevel;
        setState(() {
          _batteryLevel = batteryLevel;
        });
        if(batteryLevel <= 20 ){
          showDialog<void>(
            context: context,
            builder: (_) => AlertDialog(
              content: Text('Your Battery is: $_batteryLevel%, can\'t play anything this time'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          );
        }
        else {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => Loading(tune: widget.tune)),
          );
        }
      },
    );
  }
}

