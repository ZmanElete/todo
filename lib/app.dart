import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home.dart';
import 'theme/theme.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Elios',
      theme: AppTheme.theme,
      // home: HomePage(),
      initialRoute: 'start',
      onGenerateRoute: (RouteSettings routeSettings) {
        Map<String, dynamic> args = routeSettings.arguments;
        switch (routeSettings.name) {
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
