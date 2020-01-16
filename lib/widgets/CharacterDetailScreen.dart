import 'package:despicable_me/models/character.dart';
import 'package:despicable_me/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:after_layout/after_layout.dart';

class CharacterDetailScreen extends StatefulWidget {
  final Character character;

  final double expandedBottomSheetPosition = 0;
  final double _collapsedBottomSheetPosition = -250;
  final double _completeCollapsedBottomSheetPosition = -330;

  CharacterDetailScreen({this.character});
  @override
  _CharacterDetailScreenState createState() => _CharacterDetailScreenState();
}

class _CharacterDetailScreenState extends State<CharacterDetailScreen>
    with AfterLayoutMixin<CharacterDetailScreen> {
  double _bottomSheetPosition = -330;
  bool _isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Hero(
            tag: 'background-${widget.character.name}',
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: widget.character.colors,
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  iconSize: 32,
                  color: Colors.white.withOpacity(0.8),
                  onPressed: () {
                 
                    setState(() {
                    _isCollapsed?_bottomSheetPosition=widget._completeCollapsedBottomSheetPosition:null;
                    });
                    Navigator.of(context).pop();
                  },
                ),
                Align(
                  alignment: Alignment(0.5, 0),
                  child: Hero(
                    tag: 'image-${widget.character.name}',
                    child: Image.asset(
                      widget.character.imagePath,
                      height: screenHeight * 0.45,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment(0.4, 0),
                  child: Container(
                    height: 10,
                    width: 140,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 3,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Hero(
                    tag: 'name-${widget.character.name}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        widget.character.name,
                        style: AppTheme.heading,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 85),
                  child: Text(
                    widget.character.description,
                    style: AppTheme.subHeading.copyWith(
                        color: Colors.white, letterSpacing: 1, fontSize: 20),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
          bottomSheetBar(context),
        ],
      ),
    );
  }

  Widget bottomSheetBar(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      right: 0,
      left: 0,
      bottom: _bottomSheetPosition,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InkWell(
              onTap: _onTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                height: 80,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Clips',
                  style: AppTheme.subHeading.copyWith(color: Colors.black),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: _clipsWidget(),
            )
          ],
        ),
      ),
    );
  }

  void _onTap() {
    setState(() {
      _bottomSheetPosition = _isCollapsed
          ? widget.expandedBottomSheetPosition
          : widget._collapsedBottomSheetPosition;

      _isCollapsed = !_isCollapsed;
    });
  }

  Widget _clipsWidget() {
    return Container(
      height: 250,
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              roundedContainer(Colors.redAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.greenAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.orangeAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.purpleAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.blueAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.amberAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.redAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.greenAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.orangeAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.purpleAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              roundedContainer(Colors.blueAccent),
              SizedBox(
                height: 20,
              ),
              roundedContainer(Colors.amberAccent),
            ],
          ),
        ],
      ),
    );
  }

  Widget roundedContainer(Color color) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _isCollapsed = true;
        _bottomSheetPosition = widget._collapsedBottomSheetPosition;
      });
    });
  }
}
