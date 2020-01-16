import 'package:flutter/material.dart';

class Character {
  final String name;
  final String imagePath;
  final String description;
  final List<Color> colors;

  Character({this.name, this.imagePath, this.description, this.colors});
}

final List characters =  [
  Character(
      name: 'Kevin',
      imagePath: 'assets/images/kevin.png',
      description:
          'In the new Minions movie, we will get to see Kevin the Minion take on a leading role. While Minion Kevin was a household name in both Despicable Me movies, the two depictions are actually quite different. The Kevin in the original Despicable Me film was much shorter and only had one eye, nearly identical to Stuart. It is unclear if the directors gave Kevin a redesign before Despicable 2 or if these are different Minion characters altogether.',
      colors: [Colors.orange.shade200, Colors.deepOrange.shade400]),


 Character(
      name: 'Agnes',
      imagePath: 'assets/images/Agnes.png',
      description:'Agnes Gru it is one of Gru and Lucy\'s three adopted daughters, alongside her sisters Margo and Edith. She is the youngest child of the three sisters. She greatly adores unicorns, as shown on various occasions. She appears in Despicable Me, Despicable Me 2 and Despicable Me 3.Agnes is a little girl with dark brown eyes. For pajamas, Agnes wears a long blue nightshirt covered with teddy bears and polar bear slippers; her hair stays the same. On her birthday, Agnes is wearing a dress that resembles a princess riding a unicorn. The colors are similar to her regular outfit. She also wears a blue princess hat on her head.',
      colors: [Colors.pink.shade200, Colors.redAccent.shade400]),

];

