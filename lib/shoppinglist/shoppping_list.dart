import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Product {
  const Product({required this.name});

  final String name;
}

typedef OnCartChangedCallBack = Function(Product product, bool incart);

class ShoppingItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
      ),
      body: const ShoppingListItem(
        product: [
          Product(name: "Chips"),
          Product(name: "Mango"),
          Product(name: "banana"),
          Product(name: "Potato"),
          Product(name: "Tomato"),
          Product(name: "Chillis"),
          Product(name: "LOL")
        ],
      ),
    );
  }
}

class ShoppingListItem extends StatefulWidget {

  const ShoppingListItem({
    required this.product,
    super.key
  });

  final List<Product> product;

  @override
  State<StatefulWidget> createState() => _ShoppingListItemState();

}

class _ShoppingListItemState extends State<ShoppingListItem> {
  final _shoppingCart = <Product>{};

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      if (!inCart) {
        _shoppingCart.add(product);
      } else {
        _shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 10),
      children: widget.product.map((product) {
        return ShoppingMenu(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChangedCallBack: _handleCartChanged
        );
      }
      ).toList()
    );
  }

}

class ShoppingMenu extends StatelessWidget {

  const ShoppingMenu({
    required this.product,
    required this.inCart,
    required this.onCartChangedCallBack
  });

  final Product product;
  final bool inCart;
  final OnCartChangedCallBack onCartChangedCallBack;

  Color _getColor(BuildContext context) {
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getStyle() {
    if(!inCart) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChangedCallBack(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(
        product.name,
        style: _getStyle(),
      ),
    );
  }

}
