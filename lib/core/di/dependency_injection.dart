import 'package:get_it/get_it.dart';
import 'package:system_pro/core/logic/localization/localization_cubit.dart';
import 'package:system_pro/core/logic/theming/change_theming_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<ChangeThemingCubit>(ChangeThemingCubit.new);
  getIt.registerLazySingleton<ChangeLocalizationCubit>(
    ChangeLocalizationCubit.new,
  );
}
