import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

class CarusalSliderWidget extends StatefulWidget {
  final List<dynamic> images;
  const CarusalSliderWidget({Key? key, required this.images}) : super(key: key);

  @override
  State<CarusalSliderWidget> createState() => _CarusalSliderWidgetState();
}

class _CarusalSliderWidgetState extends State<CarusalSliderWidget> {
  int index = 0;

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
              items: widget.images.map((image) {
                return Image.network(image);
              }).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                  height: 220.h,
                  reverse: false,
                  autoPlay: false,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                onPageChanged: (int value,CarouselPageChangedReason reason ){
                    setState(() {
                      index = value;
                    });
                }
              ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.images.length,
                (currentIndex) => Padding(
                  padding: EdgeInsets.all(10.spMax),
                  child: Container(
                    width: 12.w,
                    height: 12.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == index?  Pallete.whiteColor : Pallete.greyColor
                    ),
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}
