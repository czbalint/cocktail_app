import 'package:assignment/UI/pages/details/widgets/ingredient_bottom_sheet.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class IngredientCard extends StatelessWidget {
  IngredientCard({Key? key, required this.name, required this.measure}) : super(key: key);

  final String name;
  final String measure;

  final autoSizeGroup = AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
            ),
            builder: (context) {
              return IngredientBottomSheet(ingName: name,);
            });
        },
        borderRadius: BorderRadius.circular(15),
        child: Container(
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
                        group: autoSizeGroup,
                        maxLines: 2,
                        wrapWords: false,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 25),
                        minFontSize: 15,
                        overflow: TextOverflow.ellipsis,
                       // maxFontSize: 20,
                      )
                    ),
                    AutoSizeText(
                      measure,
                      group: autoSizeGroup,
                      maxLines: 1,
                      wrapWords: false,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18),
                      minFontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
