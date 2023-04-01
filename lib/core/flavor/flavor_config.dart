
import '../constants/enums.dart';

class FlavorConfig {
  static FlavorConfig? _instance;

  final Flavor flavor;
  final Map<String, dynamic> flavorConfigValues;

  factory FlavorConfig(
      {required Flavor flavor,
        required Map<String, dynamic> flavorConfigValues}) {
    return _instance ??= FlavorConfig._internal(
      flavor,
      flavorConfigValues,
    );
  }

  FlavorConfig._internal(this.flavor, this.flavorConfigValues);

  static FlavorConfig? get instance {
    return _instance;
  }

  static bool isCI() => _instance?.flavor == Flavor.ci;
  static bool isPROD() => _instance?.flavor == Flavor.prd;
  static bool isSTG() => _instance?.flavor == Flavor.stg;
  static bool isUAT() => _instance?.flavor == Flavor.uat;
}
