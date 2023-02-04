import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';

import '../../../utils/common/exports.dart';

class CarousalImages extends StatelessWidget {
  final List<File>? images;
  const CarousalImages({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
      child: CarouselSlider(
          items: images!.map((file) {
            return Image.file(file);
          }).toList(),
          options: CarouselOptions(
            height: 300.h,
            reverse: false,
            autoPlay: false,
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: false
          )),
    );
  }
}
