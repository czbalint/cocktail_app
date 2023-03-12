import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({Key? key, required this.icon, required this.color, required this.title, required this.description, required this.onTap}) : super(key: key);

  final IconData icon;
  final Color color;
  final String title;
  final String? description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(),
        color: Colors.white.withOpacity(.4)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              Positioned(
                top: -80,
                left: -100,
                child: Icon(icon,
                  size: 270,
                  color: color.withOpacity(.4),
                )
              ),

              Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      child: Text(title,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(description ?? "",
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
