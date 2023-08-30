import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/services/apihandler.dart';
import 'package:store_api_flutter_course/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
      ),
      body: FutureBuilder(
        future: APIHanlder.getAllCategory(),
        builder: (context, snapshot) {
          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator());
          }
          else if(snapshot.hasError){
            Center(child: Text("An error Occurred ${snapshot.error}"));
          }
          else if(snapshot.data == null){
            const Center(child: Text("No Product has been added yet"));
          }
          {
           return GridView.builder(
              itemCount: snapshot.data!.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 1.2
              ),
              itemBuilder: (context, index) {
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                    child: CategoryWidget());
              },);
        }
        },

      ),
    );
  }
}
