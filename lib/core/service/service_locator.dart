import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get_it/get_it.dart';

import 'analytics_service.dart';

///Service Locator
GetIt sl = GetIt.instance;

void setUpDependencies() {
  //
  //
  ///_____Firebase Singeltons_____
  sl.registerSingleton(FirebaseCrashlytics.instance);
  sl.registerSingleton(FirebaseAnalytics.instance);
  sl.registerSingleton(FirebaseAnalyticsObserver(
    analytics: sl<FirebaseAnalytics>(),
  ));
  sl.registerSingleton(
    () => AnalyticsService(
        analytics: sl<FirebaseAnalytics>(),
        firebaseAnalyticsObserver: sl<FirebaseAnalyticsObserver>(),
        crashlytics: sl<FirebaseCrashlytics>()),
  );
  //
  //
  ///_____Data Linking____
  sl.registerSingleton(Dio());
  //
  //
}
