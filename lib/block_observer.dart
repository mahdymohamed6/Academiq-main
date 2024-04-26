import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase cubit, Change change) {
    print(change.toString());
    super.onChange(cubit, change);
  }
}
