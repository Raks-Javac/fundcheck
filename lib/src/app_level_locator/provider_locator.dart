//this file would container all providers that are of app level

import 'package:fundcheck/src/features/authentication/login/provider/login_provider.dart';
import 'package:fundcheck/src/features/authentication/register/provider/fade_provider.dart';
import 'package:fundcheck/src/features/authentication/register/provider/password_provider.dart';
import 'package:fundcheck/src/features/dashboard/bottom_nav/provider/nav_provider.dart';
import 'package:fundcheck/src/features/dashboard/home/provider/home_provider.dart';
import 'package:fundcheck/src/shared/res/theme/provider/theme/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appProvider() => [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => PasswordProvider()),
      ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ChangeNotifierProvider(create: (context) => HomeProvider()),
      ChangeNotifierProvider(create: (context) => NavProvider()),
      ChangeNotifierProvider(create: (context) => LoginProvider()),
    ];
