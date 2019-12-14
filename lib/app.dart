import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/add.dart';
import 'pages/home.dart';
import 'pages/organize.dart';
import 'pages/work.dart';
import 'theme/theme.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Todo',
      theme: AppTheme.theme,
      // home: HomePage(),
      initialRoute: 'start',
      onGenerateRoute: (RouteSettings routeSettings) {
        Map<String, dynamic> args = routeSettings.arguments;
        switch (routeSettings.name) {
          case 'organize':
            return MaterialPageRoute(
              builder: (context) => OrganizationPage(),
            );
            break;
          case 'work':
            return MaterialPageRoute(
              builder: (context) => WorkPage(),
            );
            break;
          case 'add':
            return MaterialPageRoute(
              builder: (context) => AddPage(),
            );
            break;
          case 'home':
          default:
            return MaterialPageRoute(
              builder: (context) => HomePage(),
            );
        }
      },
    );
  }
}
