import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key, required this.mtListCarousel});

  final List<dynamic> mtListCarousel;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 200.0, autoPlay: true),
      items: mtListCarousel.map((i) {
        print("i => ${i}");
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(i),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
