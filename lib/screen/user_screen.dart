import 'package:flutter/material.dart';

import '../widgets/users_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return UserWidget();
          },
          itemCount: 4,
        ));
  }
}
