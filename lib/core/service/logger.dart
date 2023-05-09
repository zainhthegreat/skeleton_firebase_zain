// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';
import 'package:skeleton_firebase_zain/core/service/service_locator.dart';


class _CustomFilter extends LogFilter {
  FirebaseCrashlytics? _crashlytics;

  _CustomFilter();

  @override
  bool shouldLog(LogEvent event) {
    try {
      _crashlytics = sl<FirebaseCrashlytics>();
    } catch (err) {/* ignore */}

    _crashlytics?.log('[${event.level}] - ${event.message}');

    return event.level.index >= (level?.index ?? Level.verbose.index);
  }
}

//Custom printer
class _CustomPrinter extends PrettyPrinter {
  FirebaseCrashlytics? _crashlytics;
  final String prefix;

  _CustomPrinter(this.prefix)
      : super(
          errorMethodCount: 10,
          methodCount: 0,
        );

  @override
  String stringifyMessage(dynamic message) {
    return '[$prefix] - ${super.stringifyMessage(message)}';
  }

  @override
  List<String> log(LogEvent event) {
    try {
      try {
        _crashlytics = sl<FirebaseCrashlytics>();
      } catch (err) {/* ignore */}

      if (_crashlytics?.isCrashlyticsCollectionEnabled ?? false) {
        Level crashLevel = Level.wtf;

        try {
        } catch (err) {/* ignore */}

        if (event.level.index >= crashLevel.index) {
          _crashlytics?.recordError(
            event.error,
            event.stackTrace,
            printDetails: true,
            reason: event.message,
          );
          // if (FlavorConfig.isPROD()) {
          _crashlytics?.recordFlutterError(
            FlutterErrorDetails(
                exception: event.error ?? event.stackTrace ?? event.message),
          );
        }
      }
    } catch (e) {/* ignore */}
    return super.log(event);
  }
}

//Use this class for logging across the app
Logger getLogger({
  String prefix = 'PrefixNotSet',
}) {
  Level? logLevel = Level.verbose;
  try {
  } catch (err) {/* ignore */}
  return Logger(
    filter: _CustomFilter(),
    printer: _CustomPrinter(prefix),
    level: logLevel,
  );
}
