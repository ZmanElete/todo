import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widgets/app_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppPage(
      poppable: false,
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 50),
        child: Column(
          children: <Widget>[
            Text(
              "Todo App",
              style: TextStyle(fontSize: 70, fontFamily: "comic sans"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
            ),
            _buildButton(context, "Organize"),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            _buildButton(context, "Work"),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(context, title) {
    return SizedBox(
      width: 200,
      child: CupertinoButton(
        color: AppTheme.logoBlue,
        child: Text(title),
        onPressed: () {
          Navigator.pushNamed(context, title.toLowerCase());
        },
      ),
    );
  }
}
