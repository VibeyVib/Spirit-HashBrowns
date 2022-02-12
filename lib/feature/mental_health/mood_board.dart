import 'package:flutter/material.dart';
import 'package:spirit/feature/mental_health/custom_tab.dart';
import 'package:spirit/feature/mental_health/exercise.dart';
import 'package:spirit/feature/mental_health/good_news.dart';
import 'package:url_launcher/url_launcher.dart';

class MoodBoard extends StatefulWidget {
  const MoodBoard({Key? key, required this.mood}) : super(key: key);
  final String mood;

  @override
  _MoodBoardState createState() => _MoodBoardState();
}

class _MoodBoardState extends State<MoodBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffaefeff),
      resizeToAvoidBottomInset: false,
      body: _buildContent(),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.all(35.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //height: 200.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Today is better than yesterday but not as good as tomorrow will be",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
            ),
            CustomTab(
                title: 'Music',
                icon: 'assets/images/music.svg',
                description:
                    'Music can relax the mind, energize the body, and even help people better manage pain',
                child: () {
                  _launchURLBrowser(widget.mood);
                }),
            CustomTab(
                title: 'Good News',
                icon: 'assets/images/goodnews.svg',
                description:
                'In the times of rising number of cases with news filled with despair, it is important to also know the good in the world.',
                child: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GoodNews(mood: widget.mood)),
                  );
                }),
            CustomTab(
                title: 'Exercise',
                icon: 'assets/images/exercise.svg',
                description:
                'Exercise can give an enormous sense of well-being, positivity and energy.',
                child: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercise(mood: widget.mood)),
                  );
                }),
          ],
        ),
      ),
    );
  }

  _launchURLBrowser(String mood) async {
    String url = mood=='Sad' ?
        'https://open.spotify.com/playlist/4qD5Qb6JvDLfQKZmHRz4MP?si=w_TpJxmISnODvAJiuN3WEw&utm_source=whatsapp&dl_branch=1'
    : mood=='Angry' ?  'https://open.spotify.com/playlist/7LI3zw8HLkjKo5YpvA26KG?si=146114753da74e44'
        : mood=='Fear' ? 'https://open.spotify.com/playlist/1r4hnyOWexSvylLokn2hUa?si=74a736022c764a72'
        : mood=='Joy' ? 'https://open.spotify.com/playlist/37i9dQZF1DX3rxVfibe1L0?si=571c2d594fed40a1'
        : 'https://open.spotify.com/playlist/37i9dQZF1DX7rOY2tZUw1k?si=65e07a54a3bf496b';
    ;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
