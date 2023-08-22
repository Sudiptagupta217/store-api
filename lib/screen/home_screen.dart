import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/global_colors.dart';
import '../widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _searchController ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: Text("Home"),
        leading: AppBarIcons(
          function: (){},
          icon: IconlyBold.category,),
        actions: [
          AppBarIcons(function: (){}, icon: IconlyBold.user3)
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 15,),
            TextFormField(controller:_searchController ,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: Icon(IconlyLight.search,color: lightIconsColor,),
                filled: true,
                fillColor: Theme.of(context).cardColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Theme.of(context).cardColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 1,
                    color: lightIconsColor
                  )
                ),
              ),

            ),
            SaleWidget(),
          ],
        ),
      ),
    );
  }
}
