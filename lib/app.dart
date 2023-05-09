import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc/bloc_delegate.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _initalized = false;
  @override
  void initState() {
    super.initState();
    initializeAsync();
  }

  Future<void> _setupCommonDependecies() async {
    await Firebase.initializeApp();
    Bloc.observer = BlocDelegate();
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    await FirebaseCrashlytics.instance.app
        .setAutomaticDataCollectionEnabled(true);
    await FirebaseCrashlytics.instance.sendUnsentReports();
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  }

  Future<void> initializeAsync() async {
    await _setupCommonDependecies();
    setState(() {
      _initalized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_initalized != true) {
      return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Skeleton'),
          ),
        ),
      );
    }

    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
