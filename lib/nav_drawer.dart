import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ctunes/Page/about_us_page.dart';
import 'package:ctunes/Page/download_page.dart';
import 'package:ctunes/Page/guide_page.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultHeight = MediaQuery.of(context).size.height;
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(left: defaultHeight / 70, right: defaultHeight / 70, top: defaultHeight / 15),
        color: Color(0xff343434),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: defaultHeight / 50, right: defaultHeight / 50),
              height: defaultHeight / 5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/ctune.png"),
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Color(0xfff3f3f3), size:defaultHeight / 25),
              title: Text(
                'Home',
                style: TextStyle(
                    color: Color(0xfff3f3f3),
                    fontSize: defaultHeight / 45
                ),
              ),
              onTap: () => {Navigator.of(context).pop()},
            ),
            SizedBox(
              height: defaultHeight / 100,
            ),
            ListTile(
              leading: Icon(Icons.info_outline, color: Color(0xfff3f3f3), size:defaultHeight / 25),
              title: Text('About', style: TextStyle(
                  color: Color(0xfff3f3f3),
                  fontSize: defaultHeight / 45
              ),
              ),
              onTap: () => {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutUs()),
                )
              },
            ),
            SizedBox(
              height: defaultHeight / 100,
            ),
            ListTile(
              leading: Icon(Icons.menu_book, color: Color(0xfff3f3f3), size:defaultHeight / 25),
              title: Text('Guide', style: TextStyle(
                  color: Color(0xfff3f3f3),
                  fontSize: defaultHeight / 45
              ),
              ),
              onTap: () => {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GuidePage()),
                )
              },
            ),
            SizedBox(
              height: defaultHeight / 100,
            ),
            ListTile(
              leading: Icon(Icons.download_sharp, color: Color(0xfff3f3f3), size:defaultHeight / 25),
              title: Text('Download', style: TextStyle(
                  color: Color(0xfff3f3f3),
                  fontSize: defaultHeight / 45
              ),
              ),
              onTap: () => {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DownloadPage()),
                )
              },
            ),
            SizedBox(
              height: defaultHeight / 100,
            ),
            Divider(
              thickness: 1.5,
              height: defaultHeight / 20,
              color: Color(0xfff3f3f3),
            ),
            SizedBox(
              height: defaultHeight / 100,
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Color(0xfff3f3f3), size:defaultHeight / 25),
              title: Text('Quit', style: TextStyle(
                  color: Color(0xfff3f3f3),
                  fontSize: defaultHeight / 45
              ),
              ),
              onTap: () => {SystemNavigator.pop()},
            ),
          ],
        ),
      ),
    );
  }
}