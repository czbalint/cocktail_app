import 'package:assignment/UI/bloc/navigator/navigation_bloc.dart';
import 'package:assignment/UI/bloc/navigator/navigation_event.dart';
import 'package:assignment/UI/pages/details/widgets/details_content.dart';
import 'package:assignment/UI/pages/details/widgets/details_shimmer.dart';
import 'package:assignment/UI/pages/details/widgets/ingredient_card.dart';
import 'package:assignment/database/services/http_service.dart';
import 'package:assignment/models/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.drink}) : super(key: key);

  final Drink drink;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final HttpService service = HttpService();

  late ScrollController _controller;
  bool lastStatus = true;
  bool close = false;
  Drink? drink;
  late final appBarHeight = MediaQuery.of(context).size.height * 0.4;

  _scrollListener() {
    if (getAppBarNormalHeight > 0.80) {
      if (close != true) {
        setState(() {
          close = true;
        });
      }
    } else {
      if (close != false) {
        setState(() {
          close = false;
        });
      }
    }
  }

  _loadDetails() async {
    var response = await service.getDetailsByDrink(widget.drink);
    setState(() {
      drink = response?.drink;
    });
  }

  double get getAppBarNormalHeight {
    if (_controller.hasClients) {
      return _controller.offset > appBarHeight ? double.infinity : _controller.offset / appBarHeight;
    }
    return double.infinity;
  }

  @override
  void initState() {
    _loadDetails();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            leading: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                onPressed: () {
                  context.read<NavigationBloc>().add(PopPageEvent());
                },
                icon: const Icon(Icons.arrow_back)
              ),
            ),
            //backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                padding: close ? EdgeInsets.zero : const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(.6),
                  borderRadius: BorderRadius.circular(15),
                  border: close ? null : Border.all()
                ),
                child: Text(widget.drink.name,
                  style: const TextStyle(
                    //color: isShrink ? Colors.black : Colors.white
                  ),
                ),
              ),
              background: Image.network(widget.drink.imageUrl,
                scale: 1,
                fit: BoxFit.fitWidth,
              ),
            ),
            pinned: true,
            expandedHeight: appBarHeight,
          ),
          SliverToBoxAdapter(
            child: drink == null ? const DetailsShimmer() : DetailsContent(drink: drink!),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 2
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                  return drink != null ? IngredientCard(
                    name: drink!.detail?.ingredients[index] ?? "NoN",
                    measure: drink!.detail!.measure.length <= index ? "-" : drink!.detail?.measure[index] ?? "NoN",
                  ) : Container();
                },
                childCount: drink?.detail?.ingredients.length
              )
            ),
          )
        ],
      )
    );
  }
}


