import 'package:assignment/UI/pages/details/widgets/details_shimmer.dart';
import 'package:assignment/database/services/http_service.dart';
import 'package:assignment/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientBottomSheet extends StatefulWidget {
  const IngredientBottomSheet({Key? key, required this.ingName}) : super(key: key);

  final String ingName;

  @override
  State<IngredientBottomSheet> createState() => _IngredientBottomSheetState();
}

class _IngredientBottomSheetState extends State<IngredientBottomSheet> {
  final HttpService httpService = HttpService();

  Ingredient? ingredient;

  @override
  void initState() {
    _loadIng();
    super.initState();
  }

  _loadIng() async {
    var response = await httpService.getIngredientDetails(widget.ingName);
    setState(() {
      ingredient = response?.ingredient;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Builder(
        builder: (context) {
          if (ingredient == null) {
            return const DetailsShimmer();
          } else {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 30, top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Text(ingredient!.name,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50, bottom: 20),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(ingredient?.type ?? "Not given",
                                      style: const TextStyle(
                                        fontSize: 25
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("Type"),
                                    ),
                                    Text(ingredient?.alcoholic == true ? "Yes" : "No",
                                      style: const TextStyle(
                                          fontSize: 25
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 15),
                                      child: Text("Contain alcohol"),
                                    ),
                                    Text(ingredient?.ABV != null ? "${ingredient?.ABV} %" : "Not given",
                                      style: const TextStyle(
                                          fontSize: 25
                                      ),
                                    ),
                                    const Text("Alcohol volume")
                                  ],
                                ),
                                Flexible(child: Image.network('https://www.thecocktaildb.com/images/ingredients/${ingredient!.name}-Medium.png')),
                              ],
                            ),
                          ),

                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Text("Description",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),

                          Text(ingredient?.description ?? "No description",
                            style: const TextStyle(
                              fontSize: 18
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        }
      ),
    );
  }
}
