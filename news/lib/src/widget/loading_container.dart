import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  Widget build(context) {
    return Column(
      children: [
        ListTile(
          title: buildContainer(),
          subtitle: buildContainer(),
        ),
        Divider(height: 8.0),
      ],
    );
  }

  Widget buildContainer() {
    return Container(
      width: 150.0,
      height: 24.0,
      color: Colors.grey[300],
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
    );
  }
}
