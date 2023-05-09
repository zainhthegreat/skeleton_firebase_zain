import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setUpDependencies() {
  //Firebase
  sl.registerSingleton(FirebaseCrashlytics.instance);
  sl.registerSingleton(FirebaseAnalytics.instance);
  sl.registerSingleton(FirebaseAnalyticsObserver(
    analytics: sl<FirebaseAnalytics>(),
  ));
  

}
