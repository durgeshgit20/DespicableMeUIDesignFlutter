import 'package:despicable_me/models/character.dart';
import 'package:despicable_me/styles.dart';
import '../widgets/CharacterWidget.dart';
import 'package:flutter/material.dart';

class CharacterListScreen extends StatefulWidget {
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  PageController _pageController;
  int currentPage = 0;
  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 1,
      keepPage: false,
      initialPage: currentPage,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 32.0, top: 8.0),
              child: RichText( 
                text: TextSpan(children: [
                  TextSpan(text: 'Despicable Me', style: AppTheme.display1),
                  TextSpan(text: '\n'),
                  TextSpan(text: 'Characters', style: AppTheme.display2),
                ]),
              ),
            ),
            Expanded(
              child: PageView(controller: _pageController, children: <Widget>[
                for (var currPage = 0; currPage < characters.length; currPage++)
                  CharacterWidget(
                    character: characters[currPage],
                    pageController: _pageController,
                    currentPage: currPage,
                  ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
