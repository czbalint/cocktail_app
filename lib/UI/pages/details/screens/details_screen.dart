import 'package:assignment/UI/bloc/navigator/navigation_cubit.dart';
import 'package:assignment/UI/pages/details/widgets/details_content.dart';
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
  late ScrollController _controller;

  bool lastStatus = true;
  bool close = false;
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

  double get getAppBarNormalHeight {
    if (_controller.hasClients) {
      return _controller.offset > appBarHeight ? double.infinity : _controller.offset / appBarHeight;
    }
    return double.infinity;
  }

  @override
  void initState() {
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
                  context.read<NavigationCubit>().pop();
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
          SliverList(delegate: SliverChildListDelegate([ //at kell szervezni sliverre az egesz oldalt
            DetailsContent(drink: widget.drink,),

          ]),)
        ],
      )
    );
  }
}


