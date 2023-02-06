import 'package:carousel_slider/carousel_slider.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

class CarusalSliderWidget extends StatelessWidget {
  final List<dynamic> images;
  const CarusalSliderWidget({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: Pallete.greyColor,
          width: 0.5.w
        ),
        borderRadius: BorderRadius.circular(30.r)
      ),
      child: Column(
        children: [
          CarouselSlider(
              items: images.map((image) {
                return Image.network(image);
              }).toList(),
              options: CarouselOptions(
                  height: 220.h,
                  reverse: false,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false
              )),

        ],
      ),
    );
  }
}
