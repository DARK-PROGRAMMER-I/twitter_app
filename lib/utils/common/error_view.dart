import 'exports.dart';

class ErrorrWidget extends StatelessWidget {
  final String message;
  const ErrorrWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  final String message;
  const ErrorScreen({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorrWidget(message: message,),
    );
  }
}

