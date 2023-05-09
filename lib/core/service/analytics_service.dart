// Package imports:
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics;
  // ignore: unused_field
  final FirebaseAnalyticsObserver _firebaseAnalyticsObserver;
  final FirebaseCrashlytics _crashlytics;

  AnalyticsService({
    required FirebaseAnalytics analytics,
    required FirebaseAnalyticsObserver firebaseAnalyticsObserver,
    required FirebaseCrashlytics crashlytics,
  })  : _analytics = analytics,
        _crashlytics = crashlytics,
        _firebaseAnalyticsObserver = firebaseAnalyticsObserver;

  Future<void> setUserDetails({
    required String userId,
  }) async {
    await _analytics.setUserId(id: userId);
    await _crashlytics.setUserIdentifier(userId);
  }

  Future<void> setUserProperty({
    required String name,
    required String value,
  }) async {
    await _analytics.setUserProperty(name: name, value: value);
  }

  Future<void> logCustomEvent({
    required String eventName,
    Map<String, Object?>? parameters,
  }) async {
    await _analytics.logEvent(name: eventName, parameters: parameters);
  }

  Future<void> logLogin({
    required String method,
    required String status,
  }) async {
    await _analytics.logEvent(
      name: 'login',
      parameters: {
        'method': method,
        'status': status,
      },
    );
  }

  Future<void> logScreenView({required String screenName}) async {
    await _analytics.setCurrentScreen(screenName: screenName);
  }

  Future<void> logSearch({
    required String searchCategory,
    required String searchTerm,
  }) async {
    await _analytics.logSearch(
      origin: searchCategory,
      searchTerm: searchTerm,
    );
  }

  Future<void> logViewItemList({
    required String itemListId,
    required String itemListName,
    List<AnalyticsEventItem>? items,
  }) async {
    await _analytics.logViewItemList(
      itemListId: itemListId,
      itemListName: itemListName,
      items: items,
    );
  }

  Future<void> logSelectContent({
    required String contentType,
    required String itemId,
  }) async {
    await _analytics.logSelectContent(
      contentType: contentType,
      itemId: itemId,
    );
  }

  Future<void> logSignUp({required String signUpMethod, bool? success}) async {
    await _analytics.logEvent(
      name: 'sign_up',
      parameters: {'method': signUpMethod, 'status': success},
    );
  }

  Future<void> logAddPaymentInfo({
    String? coupon,
    String? currency,
    String? paymentType,
    double? value,
  }) async {
    await _analytics.logAddPaymentInfo(
      coupon: coupon,
      currency: currency,
      paymentType: paymentType,
      value: value,
    );
  }

  Future<void> logAddShippingInfo({
    String? coupon,
    String? currency,
    double? value,
    String? shippingTier,
  }) async {
    await _analytics.logAddShippingInfo(
      coupon: coupon,
      currency: currency,
      value: value,
      shippingTier: shippingTier,
    );
  }

  Future<void> logAddToCart({
    List<AnalyticsEventItem>? items,
    double? value,
    String? currency,
  }) async {
    await _analytics.logAddToCart(
      items: items,
      value: value,
      currency: currency,
    );
  }

  Future<void> logAddToWishlist({
    List<AnalyticsEventItem>? items,
    double? value,
    String? currency,
  }) async {
    await _analytics.logAddToWishlist(
      value: value,
      currency: currency,
      items: items,
    );
  }

  Future<void> logBeginCheckout({
    double? value,
    String? currency,
    List<AnalyticsEventItem>? items,
  }) async {
    await _analytics.logBeginCheckout(
      value: value,
      currency: currency,
      items: items,
    );
  }

  Future<void> logPurchase({
    String? currency,
    String? coupon,
    double? value,
    List<AnalyticsEventItem>? items,
    double? tax,
    double? shipping,
    String? transactionId,
    String? affiliation,
  }) async {
    await _analytics.logPurchase(
      currency: currency,
      coupon: coupon,
      value: value,
      items: items,
      tax: tax,
      shipping: shipping,
      transactionId: transactionId,
      affiliation: affiliation,
    );
  }

  Future<void> logRemoveFromCart({
    String? currency,
    double? value,
    List<AnalyticsEventItem>? items,
  }) async {
    await _analytics.logRemoveFromCart(
      currency: currency,
      value: value,
      items: items,
    );
  }
}
