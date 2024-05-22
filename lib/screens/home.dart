import 'dart:convert';

import 'package:carts_api/models/cart_data_model.dart';
import 'package:carts_api/models/mcarts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  Future<NewCartModel?> _buildCartsData() async {
    NewCartModel? mCarts;
    String cartUrl = 'https://dummyjson.com/carts';

    var response = await http.get(Uri.parse(cartUrl));

    if (response.statusCode == 200) {
      var mData = response.body;

      var rowData = jsonDecode(mData);
      print(rowData);

      mCarts = NewCartModel.fromJson(rowData);
    }
    return mCarts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carts Data')),
      body: FutureBuilder(
          future: _buildCartsData(),
          builder: (_, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              print('Completed -------- : ${snap.connectionState}');
              return const Center(child: CircularProgressIndicator());
            } else if (snap.hasError) {
              print('Completed : ${snap.hasError}');

              return Center(child: Text('Error: ${snap.hasError}'));
            } else if (snap.hasData) {
              print('Completed : ${snap.hasData}');

              return snap.data != null
                  ? snap.data!.carts!.isNotEmpty
                      ? ListView.builder(
                          itemCount: snap.data!.carts!.length,
                          itemBuilder: (context, index) {
                            var eachCarts = snap.data!.carts![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4),
                              child: Card(
                                elevation: 5,
                                child: ListTile(
                                  onTap: () {},
                                  leading: Text('${eachCarts.id}'),
                                  title: Text('${eachCarts.userId}'),
                                  subtitle: Text('${eachCarts.total}'),
                                  trailing: Text('${eachCarts.totalProducts}'),
                                ),
                              ),
                            );
                          })
                      : const Center(child: Text('No carts found!!'))
                  : const Center(child: CircularProgressIndicator());
            }
            return Container();
          }),
    );
  }
}
