import 'package:flutter/material.dart';
import 'package:latihan_database_fake_api_2/models/product_model.dart';
import 'package:latihan_database_fake_api_2/response/product_response.dart';
import 'package:latihan_database_fake_api_2/service/api_service.dart';

class ProductHomePage extends StatelessWidget {
  ProductHomePage({super.key});
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Product'),
      ),
      body: FutureBuilder(
        future: apiService.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            ProductResponse productResponse = snapshot.data;
            List<ProductModel> listProduct = productResponse.listProduct;
            return ListView.separated(
                itemBuilder: (context, index){
                  ProductModel productModel = listProduct[index];
                  return ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage(productModel.thumbnail.toString())),
                    title: Text(productModel.title.toString()),
                    subtitle: Text(productModel.description.toString()),
                  );
                },
                separatorBuilder: (context, index){
                  return Divider(thickness: 1.0,);
                },
                itemCount: listProduct.length);
          }
          return Container();
        },
      ),
    );
  }
}
