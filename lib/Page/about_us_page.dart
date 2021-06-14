import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double defaultWidth = MediaQuery.of(context).size.width;
    double defaultHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff343434),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xffff0000)),
        backgroundColor: Color(0xff343434),
        elevation: 0,
        title: Text('About Us'),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(defaultWidth / 30, 0.0, defaultWidth / 30, defaultHeight / 30),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: defaultHeight / 40,
                    ),
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.only(bottom: defaultHeight / 50),
                      color: Color(0xff343434),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                          color: Color(0xffff0000),
                        ),
                      ),
                      child: Column(
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget> [
                                SizedBox(height: defaultHeight/30),
                                CircleAvatar(
                                  backgroundImage: AssetImage('assets/aset2.jpeg'),
                                  radius: defaultHeight / 15,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      SizedBox(height: defaultHeight/90),
                                      Text(
                                        '181110999',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                          color: Color(0xfff3f3f3),
                                          fontSize: defaultHeight / 50,
                                        ),
                                      ),
                                      SizedBox(height: defaultHeight/90),
                                      Text(
                                        'Rivaldi Lubis',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Inter',
                                          color: Color(0xfff3f3f3),
                                          fontSize: defaultHeight / 50,
                                        ),
                                      ),
                                      SizedBox(height: defaultHeight/90),
                                      Container(
                                        width: defaultWidth/1.5,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ListTile(
                                              leading: Icon (
                                                Icons.mail,
                                                color: Color(0xfff3f3f3),
                                              ),
                                              title: Text(
                                                'rivaldilubis12@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xfff3f3f3),
                                                  fontSize: defaultHeight / 55,
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Icon (
                                                Icons.phone,
                                                color: Color(0xfff3f3f3),
                                              ),
                                              title: Text(
                                                '085107107761',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xfff3f3f3),
                                                  fontSize: defaultHeight / 55,
                                                ),
                                              ),
                                            ),
                                            ListTile(
                                              leading: Icon (
                                                Icons.camera,
                                                color: Color(0xfff3f3f3),
                                              ),
                                              title: Text(
                                                'valdilbs',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xfff3f3f3),
                                                  fontSize: defaultHeight / 50,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: defaultHeight/90),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          Divider(
                            indent: defaultWidth/30,
                            endIndent: defaultWidth/30,
                            thickness: 2.0,
                            height: defaultHeight / 30,
                            color: Color(0xffff0000),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget> [
                              SizedBox(height: defaultHeight/50),
                              CircleAvatar(
                                backgroundImage: AssetImage('assets/aset1.jpeg'),
                                radius: defaultHeight / 15,
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    SizedBox(height: defaultHeight/90),
                                    Text(
                                      '181111331',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                        color: Color(0xfff3f3f3),
                                        fontSize: defaultHeight / 50,
                                      ),
                                    ),
                                    SizedBox(height: defaultHeight/90),
                                    Text(
                                      'Erwin',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Inter',
                                        color: Color(0xfff3f3f3),
                                        fontSize: defaultHeight / 50,
                                      ),
                                    ),
                                    SizedBox(height: defaultHeight/90),
                                    Container(
                                      width: defaultWidth/1.5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ListTile(
                                              leading: Icon (
                                                Icons.mail,
                                                color: Color(0xfff3f3f3),
                                              ),
                                              title: Text(
                                                'erwinzhuo39@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xfff3f3f3),
                                                  fontSize: defaultHeight / 55,
                                                ),
                                              ),
                                          ),
                                          ListTile(
                                              leading: Icon (
                                                Icons.phone,
                                                color: Color(0xfff3f3f3),
                                              ),
                                              title: Text(
                                                '082161792811',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xfff3f3f3),
                                                  fontSize: defaultHeight / 50,
                                                ),
                                              ),
                                          ),
                                          ListTile(
                                              leading: Icon (
                                                Icons.camera,
                                                color: Color(0xfff3f3f3),
                                              ),
                                              title: Text(
                                                'erwin.zhuo',
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  color: Color(0xfff3f3f3),
                                                  fontSize: defaultHeight / 50,
                                                ),
                                              ),
                                          ),
                                          SizedBox(height: defaultHeight/90),
                                          SizedBox(height: defaultHeight/90),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: defaultHeight/90)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
      )
    );
  }
}
