import 'dart:ui';

import 'package:assignment/UI/bloc/navigator/navigation_bloc.dart';
import 'package:assignment/UI/bloc/navigator/navigation_event.dart';
import 'package:assignment/UI/pages/menu/widgets/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigator = context.read<NavigationBloc>();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage("assets/cocktail.png"),
                    fit: BoxFit.cover
                  ),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              )
            ),
            
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 50),
                    child: Text("Some drink?",
                      style: TextStyle(
                        fontSize: 45
                      ),
                    ),
                  ),

                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          icon: Icons.star,
                          color: Colors.yellow,
                          title: 'Favourites',
                          description: 'Search in favourites drinks',
                          onTap: () {
                            navigator.add(AddPageEvent(destination: "/favourite"));

                          },
                        ),
                        MenuItem(
                          icon: Icons.search,
                          color: Colors.blue,
                          title: 'Search',
                          description: 'Search drinks in database',
                          onTap: () {
                            navigator.add(AddPageEvent(destination: "/search"));
                          },
                        ),
                        MenuItem(
                          icon: Icons.shopping_cart,
                          color: Colors.green,
                          title: 'Storage',
                          description: 'Shopping cart\nOwn ingredients',
                          onTap: () {},
                        )
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
