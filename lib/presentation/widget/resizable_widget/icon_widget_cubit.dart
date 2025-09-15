import 'package:bloc/bloc.dart';

class IconCubit extends Cubit<bool> {
  IconCubit() : super(false);

  void press() => emit(true);
  void release() => emit(false);
}