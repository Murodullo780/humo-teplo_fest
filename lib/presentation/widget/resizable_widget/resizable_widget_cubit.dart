import 'package:bloc/bloc.dart';

class ResizableWidgetBloc extends Cubit<bool> {
  ResizableWidgetBloc() : super(false);

  void press() => emit(true);
  void release() => emit(false);
}