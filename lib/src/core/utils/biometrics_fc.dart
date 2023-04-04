//We use multiple packages to access the native services like Camera, Photo Gallery, Location, etc for that we need to write code in a separate file which we can be used from multiple places throughout the application

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FBiometrics {
  static final LocalAuthentication auth = LocalAuthentication();
  static bool _canCheckBiometrics = false, mounted = false;
  static List<BiometricType> _availableBiometrics = [];
  static String authorized = 'Not Authorized';
  static bool _isAuthenticating = false;

  static Future<bool> doBiometrics() async {
    await checkBiometrics();
    await getAvailableBiometrics();

    return _isAuthenticating
        ? FBiometrics.cancelAuthentication()
        : FBiometrics.authenticate();
  }

  static Future<bool> checkBiometrics() async {
    bool canCheckBiometrics = false;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
     // debugPrint(e.message);
    }
    if (!mounted) return false;

    _canCheckBiometrics = canCheckBiometrics;
    return _canCheckBiometrics;
  }

  static Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics = [];
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return availableBiometrics;

    _availableBiometrics = availableBiometrics;
    return _availableBiometrics;
  }

  static Future<bool> authenticate() async {
    bool authenticated = false;
    try {
      _isAuthenticating = true;
      authorized = 'Authenticating';

      // ignore: deprecated_member_use
      authenticated = await auth.authenticate(
        localizedReason: 'Scan to authenticate',
      );

      _isAuthenticating = false;
      authorized = 'Authenticating';

      return authenticated;
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) return false;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';

    authorized = message;
    return false;
  }

  static Future<bool> cancelAuthentication() {
    return auth.stopAuthentication();
  }
}
