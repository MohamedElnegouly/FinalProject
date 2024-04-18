import 'package:flutter/material.dart';
import 'package:graduationproject/models/custom_workspace.dart';
import 'package:graduationproject/models/workspace_model.dart';
import 'package:graduationproject/services/get_all_workspaces.dart';

import 'custom.dart';
import 'getproduct.dart';
import 'model.dart';

class HomePagee extends StatelessWidget {
  const HomePagee({Key? key}) : super(key: key);
  //static String id = 'HomePAge';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.co2,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Rahma',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child:
        FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('faield');
            return Center(
              child: CircularProgressIndicator(),
            );
            } else {
            List<ProductModel> products = snapshot.data!;
            return
              ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CustomCard(product: products[index]);
                  });
            }
    },
    ),
    ),


    );
  }
}