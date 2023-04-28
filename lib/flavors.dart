enum Flavor {
  dev,
  prod,
}

class FlavorConfig {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Delivery Food Dev';
      case Flavor.prod:
        return 'Delivery Food';
      default:
        return 'title';
    }
  }
}
