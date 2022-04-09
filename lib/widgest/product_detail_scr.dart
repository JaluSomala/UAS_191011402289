import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/products_provider.dart';

class ProductDetailScr extends StatelessWidget {
  static const routeNm = '/prod-det';
  @override
  Widget build(BuildContext context) {
    final String pid = ModalRoute.of(context).settings.arguments as String;
    final loadedProd =
        Provider.of<ProductsProvider>(context, listen: false).findById(pid);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProd.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadedProd.imgURL,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),
            Text('\$${loadedProd.price}'),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              child: Text(
                loadedProd.desc,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
