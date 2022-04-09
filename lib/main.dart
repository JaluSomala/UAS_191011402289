import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './widgets/product_view_scr.dart';
import './widgets/product_detail_scr.dart';
import './models/products_provider.dart';
import 'models/cart_provider.dart';
import './widgets/cart_scr.dart';
import './widgets/usr_products_scr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        )
      ],
      child: MaterialApp(
        title: 'UAS Mobile Programing',
        theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.red[300],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        home: ProductViewScr(),
        routes: {
          ProductDetailScr.routeNm: (ctx) => ProductDetailScr(),
          CartSccr.routeNm: (ctx) => CartSccr(),
          UsrProductsScr.routeNm: (ctx) => UsrProductsScr(),
        },
      ),
    );
  }
}
