import 'package:ecommerceapp/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        elevation: 0,
        title: Text(
          'Cart Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _cartProvider.removeAllItem();
            },
            icon: Icon(CupertinoIcons.delete),
          ),
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _cartProvider.getCartItem.length,
          itemBuilder: (context, index) {
            final cartData = _cartProvider.getCartItem.values.toList()[index];
            return Card(
              child: SizedBox(
                height: 175,
                child: Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                        cartData.imageUrl[0],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartData.productName,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 3),
                          ),
                          Text(
                            '\$' + ' ' + cartData.price.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              color: Colors.yellow.shade900,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: null,
                            child: Text(
                              cartData.productSize,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  color: Colors.yellow.shade900,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    IconButton(
                                      onPressed: cartData.quantity == 1
                                          ? null
                                          : () {
                                              _cartProvider.decrement(cartData);
                                            },
                                      icon: Icon(
                                        CupertinoIcons.minus,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      cartData.quantity.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: cartData.productQuantity ==
                                              cartData.quantity
                                          ? null
                                          : () {
                                              _cartProvider.increment(cartData);
                                            },
                                      icon: Icon(
                                        CupertinoIcons.plus,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  _cartProvider.removeItem(cartData.productId);
                                },
                                icon: Icon(
                                  CupertinoIcons.cart_badge_minus,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
      //body: Center(
      //  child: Column(
      //    mainAxisAlignment: MainAxisAlignment.center,
      //    children: [
      //      Padding(
      //        padding: const EdgeInsets.only(left: 60.0),
      //        child: Text(
      //          'Your Shopping Cart is Empty',
      //          style: TextStyle(
      //            fontSize: 22,
      //            fontWeight: FontWeight.bold,
      //            letterSpacing: 2,
      //          ),
      //        ),
      //      ),
      //      SizedBox(
      //        height: 15,
      //      ),
      //      Container(
      //        height: 40,
      //        width: MediaQuery.of(context).size.width - 40,
      //        decoration: BoxDecoration(
      //          color: Colors.yellow.shade900,
      //          borderRadius: BorderRadius.circular(10),
      //        ),
      //        child: Center(
      //          child: Text(
      //            'Continue Shopping',
      //            style: TextStyle(
      //              fontWeight: FontWeight.bold,
      //              fontSize: 18,
      //              color: Colors.white,
      //            ),
      //          ),
      //        ),
      //      ),
      //    ],
      //  ),
      //),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.yellow.shade900,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              '\$' +
                  _cartProvider.totalPrice.toStringAsFixed(2) +
                  '  ' +
                  'CHECKOUT',
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 3,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
