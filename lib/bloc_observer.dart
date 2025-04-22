import 'package:bloc/bloc.dart';

import 'core/helpers/functions/app_logs.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);

    AppLogs.successLog('onCreate -- ${bloc.runtimeType}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    AppLogs.infoLog('onChange -- ${bloc.runtimeType}, $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogs.errorLog('onError -- ${bloc.runtimeType}, $error');

    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);

    AppLogs.closeLog('onClose -- ${bloc.runtimeType}');
  }
}
