import 'package:bloc/bloc.dart';
import 'package:system_pro/core/enum/enum.dart';
import 'package:system_pro/core/helpers/functions/app_logs.dart';

/// Custom BlocObserver to track and log Bloc lifecycle events.
/// Logs will only show in debug mode using AppLogs.
class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    AppLogs.log('onCreate -- ${bloc.runtimeType}', type: LogType.success);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    AppLogs.log('onChange -- ${bloc.runtimeType}, $change', type: LogType.info);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    AppLogs.log('onError -- ${bloc.runtimeType}, $error', type: LogType.error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    AppLogs.log('onClose -- ${bloc.runtimeType}', type: LogType.close);
  }
}
