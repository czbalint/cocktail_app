import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({Key? key, this.child, required this.title}) : super(key: key);

  final Widget? child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).primaryColor, width: 6)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(title,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              Expanded(
                child: Container(
                  height: 2,
                  margin: const EdgeInsets.only(left: 10),
                  color: Colors.black.withOpacity(.5),
                ),
              )
            ],
          ),
         child ?? Container()
        ],
      ),
    );
  }
}
