import 'package:flutter/material.dart';
import 'package:najali_chaimae_s_application1/presentation/login_screen/login_screen.dart';

class AppRoutes {
  static const String loginScreen = '/login_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes =>
      {loginScreen: LoginScreen.builder, initialRoute: LoginScreen.builder};
}
