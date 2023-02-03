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
        actions: [
          RoundedSmallButton(
              title: 'Tweet',
              onTap: (){},
            backColor: Pallete.blueColor,
            fontColor: Pallete.whiteColor,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: const [

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
