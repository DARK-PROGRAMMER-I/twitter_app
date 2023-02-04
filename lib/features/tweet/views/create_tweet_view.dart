import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/features/auth/controllers/auth_controller.dart';
import 'package:twitter_clone/utils/common/loading_indicator.dart';
import 'package:twitter_clone/utils/theme/pallete.dart';

import '../../../utils/common/exports.dart';

class CreateTweetView extends ConsumerStatefulWidget {
  const CreateTweetView({Key? key}) : super(key: key);

  @override
  ConsumerState<CreateTweetView> createState() => _CreateTweetViewState();
}

class _CreateTweetViewState extends ConsumerState<CreateTweetView> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDetailsProvider).value;
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
      body: currentUser== null ? const LoadingWidget()
      :SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(currentUser.profilePic),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
