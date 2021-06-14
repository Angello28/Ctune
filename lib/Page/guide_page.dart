import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';

class GuidePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double defaultWidth = MediaQuery.of(context).size.width;
    double defaultHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xff343434),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color(0xffff0000)),
          backgroundColor: Color(0xff343434),
          elevation: 0,
          title: Text('Guide'),
        ),
        body: Container(
          width: defaultWidth,
          height: defaultHeight,
          padding: EdgeInsets.only(left: defaultWidth / 16, right: defaultWidth / 16),
          child: CarouselSlider(
            options: CarouselOptions(
              height: defaultHeight,
              enableInfiniteScroll: false,
              viewportFraction: 1.0,
              autoPlay: false
            ),
            items: [
              Container(
                child: Center(
                  child: Container(
                    height: defaultHeight / 1.7,
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/ctune.png'), width: defaultWidth / 2),
                        Text('Welcome to Ctune\'s App Guide', textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: defaultHeight / 32,
                            color: Color(0xfff3f3f3),
                            fontWeight: FontWeight.bold
                        )),
                        SizedBox(height: defaultHeight / 20),
                        Text('This guide will explain about how to use this app properly and correctly', textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: defaultHeight / 43,
                            color: Color(0xfff3f3f3),
                        )),
                        SizedBox(height: defaultHeight / 20),
                        Text('Slide to next page →', textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: defaultHeight / 43,
                              color: Color(0xfff3f3f3),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Introduction', textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: defaultHeight / 35,
                              color: Color(0xfff3f3f3),
                              fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: defaultHeight / 50),
                      Text('When you first time open this app, you will see the home page like this.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide1.png')),
                      SizedBox(height: defaultHeight / 50),
                      Text('This page consist of 4 section.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Text('1. Side menu', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Text('Side menu will open when you click the burger menu icon on the top-left of the screen.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide2.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('In this side menu, you can see 5 menus including this guide and quit app option. (Continue to next page)', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),SizedBox(height: defaultHeight / 30),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('2. Genre Section', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Text('This section is located at the top in home page. There is 8 genres that you can choose to explore.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide3.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('Each genre have a bunch of music list that you can choose to play.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Text('3. Recommend Section', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Text('This section is below of genre section. This section is a collection of music that recommend for you from the system.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide4.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('(Continue to next page)', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('4. Popular Section', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Text('This section is below of recommend section. This section is a collection of popular music of the app.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide5.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('Next: How to Download Music', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How to Download Music', textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: defaultHeight / 35,
                          color: Color(0xfff3f3f3),
                          fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: defaultHeight / 50),
                      Text('First, choose the music you want to download, whether it\'s from genre, recommend, or popular.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide6.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('After you choose the music, you will be direct to player page.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide7.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('(Continue to next page)', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('In this page, you can listen the music by pressing the play button and you can drag the slider to choose the timeline of music, for downloading the music, choose the download button at the bottom-right corner.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide8.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('After you press the download button, this app will ask your permission to access storage, allow it so you can download the music and save it to your storage.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide9.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('(Continue to next page)', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('After the download is finished, you can see a notification tell you that the music is completely downloaded', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide10.jpg'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('If you want to find the music that you downloaded, open your file manager, open internal storage, find the folder named \'Ctunes\' and there is your music.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide11.jpg'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('Now you can play your music with your default music app, or you can play it from this app too. (Next: How to Play Downloaded Music)', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('How to Play Downloaded Music', textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: defaultHeight / 35,
                              color: Color(0xfff3f3f3),
                              fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: defaultHeight / 50),
                      Text('If you want to play music that you have downloaded, you need to go to the download page. Download page can be open by pressing the download option on the side menu at home page.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide12.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('In Download Page, you can see all of music you have downloaded, choose one to play, and you will direct to the player page.', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                      Image(image: AssetImage('assets/guide13.png'),),
                      SizedBox(height: defaultHeight / 50),
                      Text('Next: Notes', textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                      SizedBox(height: defaultHeight / 50),
                    ],
                  ),
                ),
              ),
              Container(
                width: defaultWidth,
                padding: EdgeInsets.only(top: defaultHeight / 80),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notes', textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: defaultHeight / 35,
                              color: Color(0xfff3f3f3),
                              fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: defaultHeight / 50),
                      Text('1. Make sure you have a good internet connection, some page such as home page, genre, and player page requires an internet.\n\n'
                          '2. If you are offline, you can only access download page and about page.\n\n'
                          '3. Before you open or choose music, make sure your battery percentage is above 20% or you can\'t play a music (not for downloaded music).\n\n'
                          '4. Don\'t forget to allow storage access before downloading.\n\n'
                          '5. Make sure your storage is not less than 100MB or you can\'t download a music.\n\n'
                          '6. Downloading process cannot be paused, so think about it first.\n\n'
                          '7. Your download will fail if you lost connection in the middle of downloading process.\n\n'
                          '8. Our music is non-copyright, so feel free to use it to make content for youtube, tiktok, etc.\n\n'
                          '9. Ctune never ask for credit or anything, but don\'t claim this music as yours. Use it wisely.\n\n\n'
                          'Thanks for choosing our app\n\n'
                          'Regards,\n\n\n'
                          'Ctune',
                        textAlign: TextAlign.start, style: TextStyle(color: Color(0xfff3f3f3)),),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
