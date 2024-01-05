import 'package:flutter/foundation.dart';

enum Flavor {
  PROD,
  STAGING,
  QA,
  DEV,
}


class AppFlavor {
  static Flavor appFlavor = Flavor.QA;

  static String get flavorName => appFlavor.name;

  static bool get isProd => appFlavor == Flavor.PROD;

  static String get appName {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Cleeksy';
      case Flavor.STAGING:
        return 'Cleeksy Staging';
      case Flavor.QA:
        return 'Cleeksy QA';
      case Flavor.DEV:
        return 'Cleeksy Dev';
      default:
        return '';
    }
  }

  static String get iOSVersion {
    switch (appFlavor) {
      case Flavor.PROD:
        return '1.1.13';
      case Flavor.STAGING:
        return '1.1.13';
      case Flavor.QA:
        return 'qa.1.2.12';
      case Flavor.DEV:
        return 'dev.1.2.12';
      default:
        return '';
    }
  }

  static String get androidVersion {
    switch (appFlavor) {
      case Flavor.PROD:
        return '1.1.13';
      case Flavor.STAGING:
        return '1.1.13';
      case Flavor.QA:
        return 'qa.1.2.12';
      case Flavor.DEV:
        return 'dev.1.2.12';
      default:
        return '';
    }
  }

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'https://api.cleeksy.com/';
      case Flavor.STAGING:
        return 'https://api.staging.cleeksy.app/';
      case Flavor.QA:
        return 'https://qa.cleeksy.app/api/';
      case Flavor.DEV:
        return 'https://dev.cleeksy.app/api/';
      default:
        return '';
    }
  }

  static String get host {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'app.cleeksy.com';
      case Flavor.STAGING:
        return 'staging.cleeksy.app';
      case Flavor.QA:
        return 'qa.cleeksy.app';
      case Flavor.DEV:
        return 'dev.cleeksy.app';
      default:
        return '';
    }
  }

  static String get botApiUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'https://bot.cleeksy.com';
      case Flavor.STAGING:
        return '${AppFlavor.apiUrl}/bot';
      case Flavor.QA:
        return '${AppFlavor.apiUrl}/bot';
      case Flavor.DEV:
        return '${AppFlavor.apiUrl}/bot';
      default:
        return '';
    }
  }

  static String get webSocketUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'wss://ws.cleeksy.com';
      case Flavor.STAGING:
        return 'wss://ws.staging.cleeksy.app';
      case Flavor.QA:
        return 'wss://ws.qa.cleeksy.app';
      case Flavor.DEV:
        return 'wss://ws.dev.cleeksy.app';
      default:
        return '';
    }
  }

  static String get webUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'https://app.cleeksy.com';
      case Flavor.STAGING:
        return 'https://staging.cleeksy.app';
      case Flavor.QA:
        return 'https://qa.cleeksy.app';
      case Flavor.DEV:
        return 'https://dev.cleeksy.app';
      default:
        return '';
    }
  }

  static bool get enableSentry {
    switch (appFlavor) {
      case Flavor.PROD:
        return kReleaseMode;
      case Flavor.STAGING:
        return false;
      case Flavor.QA:
        return false;
      case Flavor.DEV:
        return false;
      default:
        return false;
    }
  }

  static bool get enableOfflineMode {
    switch (appFlavor) {
      case Flavor.PROD:
        return false;
      case Flavor.STAGING:
        return false;
      //TODO: Disable for issue check connection after lock device
      case Flavor.QA:
        return false;
      case Flavor.DEV:
        return false;
      default:
        return false;
    }
  }

  static String get sentryEnv {
    switch (appFlavor) {
      case Flavor.PROD:
        return "production";
      case Flavor.STAGING:
        return "debug";
      case Flavor.QA:
        return "";
      case Flavor.DEV:
        return "";
      default:
        return "";
    }
  }

  static String get sentryDSN {
    return 'https://9d7aef418cf142e588a59ce4c524e8fe@o1113945.ingest.sentry.io/6145185';
  }

  static int get matomoSiteId {
    return 1;
  }

  static String get matomoUrl {
    switch (appFlavor) {
      case Flavor.PROD:
        return "https://userdata.cleeksy.com/matomo.php";
      case Flavor.DEV:
        return "http://14.241.123.2:1002/matomo.php";
      case Flavor.QA:
        return "http://14.241.123.2:1001/matomo.php";
      case Flavor.STAGING:
        return "http://14.241.123.2:1001/matomo.php";
      default:
        return "";
    }
  }
}
