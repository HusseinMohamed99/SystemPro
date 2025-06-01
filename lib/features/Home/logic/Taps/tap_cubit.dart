import 'package:flutter_bloc/flutter_bloc.dart';

/// [TabCubit] هو المسؤول عن إدارة التبويبات داخل التطبيق.
/// الحالة الحالية عبارة عن [int] تمثل رقم التبويب الحالي.
class TabCubit extends Cubit<int> {
  /// يبدأ التبويب الافتراضي عند [0]
  TabCubit() : super(0);

  /// تغيير التبويب الحالي.
  /// لن يتم إعادة الإرسال إذا كانت القيمة الجديدة مساوية للحالية.
  void setTab(int index) {
    if (index != state) emit(index);
  }
}
