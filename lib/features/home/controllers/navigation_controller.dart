import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationController extends StateNotifier<int>{
  NavigationController() : super(0);

  updateState(int value) => state = value;

}