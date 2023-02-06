import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

class HashTaggedText extends StatelessWidget {
  final String text;
  const HashTaggedText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = [];
    List<String> splittedText = text.split(' ');
    splittedText.forEach((element) {
      if(element.startsWith('#')){
        textSpans.add(
        TextSpan(
          text: '$element  ',
          style: TextStyle(
            color: Pallete.blueColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.spMax
          )
        ));
      }
      else if(element.startsWith('http://') || element.startsWith('www.')){
        textSpans.add(
            TextSpan(
                text: '$element  ',
                style: TextStyle(
                    color: Pallete.blueColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.spMax
                )
            ));
      }
    else{
        textSpans.add(
            TextSpan(
                text: '$element  ',
                style: TextStyle(
                    color: Pallete.whiteColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 18.spMax
                )
            ));
      }
    });
    return RichText(
      text: TextSpan(
        children: textSpans
      ),
    );
  }
}
