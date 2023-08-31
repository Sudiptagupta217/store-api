import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/services/apihandler.dart';

import '../widgets/users_widget.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: FutureBuilder(
            future: APIHanlder.getAllUsers(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                Center(child: Text("An error Occurred ${snapshot.error}"));
              } else if (snapshot.data == null) {
                const Center(child: Text("No Product has been added yet"));
              }

              {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: snapshot.data![index],
                        child: UserWidget());
                  },
                );
              }
            }));
  }
}
