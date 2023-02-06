import 'package:carousel_slider/carousel_slider.dart';

import '../../../utils/common/exports.dart';

class CarusalSliderWidget extends StatelessWidget {
  final List<String> images;
  const CarusalSliderWidget({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: options,
    );
  }
}
