import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PhotoNetwork extends StatelessWidget {
  const PhotoNetwork({Key? key, required this.photo, required this.scale}) : super(key: key);

  final String photo;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: getImage(2)
            ),
          );
        });
      },
      child: getImage(scale)
    );
  }



  Image getImage(double scale) {
    return Image.network(photo,
      scale: scale,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }

        return SpinKitPouringHourGlass(color: Theme.of(context).primaryColor);
      },
    );
  }
}