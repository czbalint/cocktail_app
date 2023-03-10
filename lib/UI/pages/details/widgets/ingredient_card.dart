import 'package:assignment/models/drink.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  const IngredientCard({Key? key, required this.name, required this.measure}) : super(key: key);

  final String name;
  final String measure;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).primaryColor, width: 6)
      ),
      child: Row(
        children: [
          Image.network('https://www.thecocktaildb.com/images/ingredients/$name-Small.png'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: AutoSizeText(
                    name,
                    maxLines: 2,
                    wrapWords: false,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                    minFontSize: 15,
                    overflow: TextOverflow.ellipsis,
                   // maxFontSize: 20,
                  )
                ),
                Text(measure),
              ],
            ),
          ),

        ],
      ),
    );
  }
}