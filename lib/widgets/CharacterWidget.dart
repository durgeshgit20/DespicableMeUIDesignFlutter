import 'package:despicable_me/styles.dart';
import 'package:flutter/material.dart';

// import widgets
import '../models/character.dart';
import '../widgets/CharacterDetailScreen.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;

  CharacterWidget({this.character, this.pageController, this.currentPage});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 350),
              pageBuilder: (BuildContext context, Animation animation,
                  Animation secondaryAnimation) {
                return CharacterDetailScreen(
                  character: character,
                );
              }));
        },
        child: AnimatedBuilder(
          animation: pageController,
          builder: (context, child) {
            double value = 1;
            if (pageController.position.haveDimensions) {
              value = pageController.page - currentPage;
              value = (1 - (value.abs() * 0.6)).clamp(0.0, 1.0);
            }
            return characterBody(context,value);
          },

        ));
  }

  Widget characterBody(BuildContext context,double value) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: CharacterCardBackgroundClipper(),
          child: Hero(
            tag: 'background-${character.name}',
            child: Container(
              height: 0.6 * screenHeight,
              width: 0.9 * screenWidth,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: character.colors,
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
              )),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment(0, -1),
        child: Column(
          children: <Widget>[
            Hero(
              tag: 'image-${character.name}',
              child: Image.asset(
                character.imagePath,
                height: screenHeight * 0.50 * value,
              ),
            ),
            Align(
              alignment: Alignment(-0.1, 1),
              child: Container(
                height: 10,
                width: 140,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0,10.0),
                    blurRadius: 20,
                    spreadRadius: 3,
                    color: Colors.black.withOpacity(0.3),
                  ),
                ]),
              ),
            )
          ],
        ),
        widthFactor: screenWidth,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 48, bottom: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'name-${character.name}',
              child: Material(
             
                
                color: Colors.transparent,
                child: Text(
                  character.name,
                  style: AppTheme.heading,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5),
            ),
            Text(
              'Tap to Read more ..',
              style: AppTheme.subHeading,
            ),
          ],
        ),
      ),
    ]);
  }
}

class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path clippedPath = Path();
    double curveDistance = 40;
    print(size.height);

    clippedPath.moveTo(0.0, size.height * 0.4);
    clippedPath.lineTo(0, size.height - curveDistance);
    clippedPath.quadraticBezierTo(0, size.height, curveDistance, size.height);

    clippedPath.lineTo(size.width - curveDistance, size.height);
    clippedPath.quadraticBezierTo(
        size.width, size.height, size.width, size.height - curveDistance);

    clippedPath.lineTo(size.width, 0 + curveDistance);
    clippedPath.quadraticBezierTo(
        size.width - 1, 0, size.width - curveDistance - 5, curveDistance / 3);
    clippedPath.lineTo(curveDistance, size.height * 0.29);

    clippedPath.quadraticBezierTo(
        1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
