import 'package:flutter_bloc/flutter_bloc.dart';

import '../service/logger.dart';

class BlocDelegate extends BlocObserver {
  final _log = getLogger(prefix: 'BlocDelegate');

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    _log.v('[BLOC_EVENT : $bloc] $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    _log.v('[BLOC_ERROR : $bloc] $error');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    _log.v('[BLOC_CHANGE : $bloc] $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    _log.v('[BLOC_CREATED : $bloc]');
  }
}
