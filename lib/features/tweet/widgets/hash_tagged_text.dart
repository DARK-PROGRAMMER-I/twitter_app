import '../../../utils/common/exports.dart';

class HashTaggedText extends StatelessWidget {
  final String text;
  const HashTaggedText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpans = [];
    List<String> splittedText = text.split(' ');
    return const Placeholder();
  }
}
