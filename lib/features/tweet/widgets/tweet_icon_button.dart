import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/common/exports.dart';

class TweetIconButton extends StatelessWidget {
  final String pathName;
  final String text;
  final VoidCallback onTap;
  const TweetIconButton({Key? key, required this.pathName, required this.text, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.spMax),
      child: SvgPicture.asset(pathName),
    );
  }
}
