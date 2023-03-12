import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DetailsShimmer extends StatelessWidget {
  const DetailsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15)
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 15, left: 30, bottom: 35),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 15,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 15,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 15,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    height: 15,
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: 20,
              width: width * 0.75,
              margin: EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
                Column(

                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: 15,
                      width: width * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ],
                )
              ],
            ),

            Container(
              height: 20,
              width: width * 0.75,
              margin: EdgeInsets.only(bottom: 15, top: 35),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
