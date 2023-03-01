import 'package:assignment/UI/pages/details/widgets/details_shimmer.dart';
import 'package:assignment/database/services/http_service.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';

class DetailsContent extends StatefulWidget {
  const DetailsContent({Key? key, required this.drink}) : super(key: key);

  final Drink drink;

  @override
  State<DetailsContent> createState() => _DetailsContentState();
}

class _DetailsContentState extends State<DetailsContent> {
  final HttpService service = HttpService();

  late Drink? drink;

  @override
  void initState() {
    _loadDetails();
    super.initState();
  }

  _loadDetails() async {
    var response = await service.getDetailsByDrink(widget.drink);
    drink = response?.drink;
  }

  @override
  Widget build(BuildContext context) {
    return DetailsShimmer();
  }
}
