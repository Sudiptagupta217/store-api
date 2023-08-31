import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/models/UsersModel.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final UsersModel usersModelProvider = Provider.of<UsersModel>(context);

    Size size = MediaQuery.of(context).size;

    return ListTile(
      leading:  FancyShimmerImage(
        height: size.height * 0.15,
        width: size.width*0.15,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
          size: 28,
        ),
        imageUrl: usersModelProvider.avatar!,
        boxFit: BoxFit.fill,
      ),
      title: Text(usersModelProvider.name!),
      subtitle: Text(usersModelProvider.email!),

      trailing: Text(usersModelProvider.role!,
      style: TextStyle(
        color: lightIconsColor,
        fontWeight: FontWeight.bold
      ),
      ),

    );

  }
}
