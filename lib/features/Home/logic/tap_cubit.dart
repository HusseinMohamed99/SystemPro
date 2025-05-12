import 'package:flutter_bloc/flutter_bloc.dart';

class TabCubit extends Cubit<int> {
  TabCubit() : super(0);

  // تغيير التبويب
  void setTab(int index) => emit(index);
}
