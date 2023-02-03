import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

class CreateTweetView extends StatelessWidget {
  const CreateTweetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.close, size: 26.spMax, color: Pallete.whiteColor,),
        ),
      ),
    );
  }
}
