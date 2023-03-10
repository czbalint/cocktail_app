import 'package:assignment/UI/pages/details/widgets/details_card.dart';
import 'package:assignment/UI/pages/details/widgets/details_shimmer.dart';
import 'package:assignment/database/services/http_service.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({Key? key, required this.drink}) : super(key: key);

  final Drink drink;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailsCard(
          title: "How to made",
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              drink.detail?.instruction ?? "NoN",
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
        DetailsCard(
          title: "Glass",
          child: Row(
            children: [
              Image(
                image: AssetImage('assets/glasses/${drink.detail?.glass.toLowerCase().replaceAll(" ", "%20") ?? 'vote'}.png'),
                width: 150,
              ),
              Text(drink.detail?.glass ?? "NoN",
                  style: const TextStyle(fontSize: 20)),
            ],
          ),
        )
      ],
    );
  }
}
