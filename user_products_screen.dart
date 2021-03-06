import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/user_product_item.dart';
class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user_products';
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditProductScreen.routeName);
          }, icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: EdgeInsets.all(4.0),
        child: ListView.builder(
          itemCount: productsData.items.length,
          itemBuilder: (_,i)=> Column(
              children: [ UserProductItem(
                  productsData.items[i].id,
                  productsData.items[i].title,
                  productsData.items[i].imageUrl),

              ])
        ),
      ),
    );
  }
}
