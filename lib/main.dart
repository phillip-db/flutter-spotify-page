import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(MyApp());

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorited = false;
  String tooltipText = 'Favorite Playlist';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: (_isFavorited
          ? Icon(Icons.favorite, color: Colors.green[500])
          : Icon(Icons.favorite_border, color: Colors.white)),
      tooltip: tooltipText,
      onPressed: _toggleFavorite,
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        tooltipText = 'Favorite Playlist';
      } else {
        _isFavorited = true;
        tooltipText = 'Unfavorite Playlist';
      }
    });
  }
}

class DownloadButton extends StatefulWidget {
  @override
  _DownloadButtonState createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _downloadToggle = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
        value: _downloadToggle,
        onChanged: (value) {
          setState(() {
            _downloadToggle = value;
          });
        });
  }
}

class MyApp extends StatelessWidget {
  final playlistName = 'PogTunes';
  final subButtonColor = Colors.green[500];
  final playlistCreator = 'Phillip Burleigh';
  final playlistYear = '2020';

  @override
  Widget build(BuildContext context) {
    return _buildApp(context);
  }

  FlatButton _songEntry(String songName, String artistName) {
    return FlatButton(
      padding: EdgeInsets.symmetric(horizontal: 0),
      onPressed: () {},
      child: Container(
        height: 70,
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      songName,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      artistName,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert),
                onPressed: () {},
                tooltip: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialApp _buildApp(context) {
    return MaterialApp(
      title: 'Spotify',
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          headline1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Text(playlistName),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                tooltip: 'Go Back',
                onPressed: () {}),
            actions: <Widget>[
              FavoriteButton(),
              IconButton(
                icon: Icon(Icons.more_vert),
                color: Colors.white,
                tooltip: 'Menu',
                onPressed: () {},
              )
            ]),
        body: ListView(
          children: [
            Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [Colors.black, Colors.yellow[400]],
                          stops: [0.1, 1.0],
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 100),
                            child: Image.asset(
                              'assets/CS196_Logo.png',
                              width: 150,
                            ),
                          ),
                          Text(
                            playlistName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Playlist by ' +
                                playlistCreator +
                                ' • ' +
                                playlistYear,
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 20),
                          ButtonTheme(
                              minWidth: 225.0,
                              child: FlatButton(
                                padding: EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: subButtonColor)),
                                onPressed: () {},
                                color: subButtonColor,
                                textColor: Colors.white,
                                child: Text("shuffle play".toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 14, letterSpacing: 2)),
                              )),
                          SizedBox(height: 4),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 12.0, right: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Download',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 15,
                                  ),
                                ),
                                DownloadButton(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          _songEntry('The Nights', 'Avicii'),
                          _songEntry('SOS (feat. Aloe Blacc)', 'Avicii'),
                          _songEntry(
                              'Mr. Blue Sky', 'Electric Light Orchestra'),
                          _songEntry(
                              'Dancing in My Head (Eric Turner vs. Avicii) [Tom Hangs Remix]',
                              'Eric Turner & Avicii'),
                          _songEntry('Sombody That I Used to Know', 'Gotye'),
                          _songEntry('Warriors', 'Imagine Dragons'),
                          _songEntry('I Want You Back', 'Jackson 5'),
                          _songEntry('Separate Ways (Worlds Apart)', 'Journey'),
                          _songEntry('Carry On Wayward Son', 'Kansas'),
                          _songEntry('Born to Die', 'Lana Del Rey'),
                          _songEntry('RISE (feat. The World Alive)',
                              'League of Legends, The Glitch Mob & Mako'),
                          _songEntry('Take Over', 'League of Legends'),
                          _songEntry('Memories', 'Maroon 5'),
                          _songEntry('Stolen Dance', 'Milky Chance'),
                          _songEntry('Sunflower', 'Post Malone & Swae Lee'),
                          _songEntry('Don\'t Stop Me Now', 'Queen'),
                          _songEntry('Light of the Seven', 'Ramin Djawadi'),
                          _songEntry(
                              'I Feel Human (feat. BullySongs', 'Vicetone'),
                          _songEntry('Blinding Lights', 'The Weeknd'),
                          _songEntry('Ignite', 'Zedd'),
                          _songEntry('Midsummer Madness',
                              '88 Rising, Joji, Rich Brian & AUGUST 08'),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 23,
          backgroundColor: Colors.grey[900],
          unselectedItemColor: Colors.grey[600],
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text('Your Library'),
            ),
          ],
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
