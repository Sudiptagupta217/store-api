import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/screen/caregory_screen.dart';
import 'package:store_api_flutter_course/screen/feeds_screen.dart';
import 'package:store_api_flutter_course/screen/user_screen.dart';
import 'package:store_api_flutter_course/widgets/appbar_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../consts/global_colors.dart';
import '../widgets/feeds_widget.dart';
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
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
     // backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text("Home"),
        leading: AppBarIcons(
          function: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const CategoryScreen()),);
          },
          icon: IconlyBold.category,),
        actions: [
          AppBarIcons(function: (){
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const UserScreen()));
          }, icon: IconlyBold.user3)
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


            SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height*0.25,
                      child: Swiper(
                        itemCount:3,
                        itemBuilder: (context, index) {
                          return const SaleWidget();
                        },
                        pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                                color: Colors.white,activeColor: Colors.red)),
                        //control: SwiperControl(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Latest Products",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                          const Spacer(),
                          AppBarIcons(
                              function: () {
                                Navigator.push(context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FeedsScreen())
                                );
                              },
                              icon: IconlyBold.arrowRight2),
                        ],
                      ),
                    ),
                    GridView.builder(
                      itemCount: 3,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0.0,
                          mainAxisSpacing: 0.0,
                          childAspectRatio: 0.6
                      ),
                      itemBuilder: (context, index) {
                        return FeedWidget();
                      },)
                  ],
                ),
              ),
            )





          ],
        ),
      ),
    );
  }
}
