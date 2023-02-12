import 'package:assignment/UI/pages/home/widgets/photo_network.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.drink}) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Stack(
        children:  [
          Align(
            alignment: Alignment.topCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft: Radius.circular(15)),
              child: PhotoNetwork(
                photo: drink.imageUrl,
                scale: 1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
