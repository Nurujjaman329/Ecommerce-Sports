import 'package:ecommerceapp/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider _cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.yellow.shade900,
        title: Text(
          'CheckOut',
          style: TextStyle(
            fontSize: 18,
            letterSpacing: 5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _cartProvider.getCartItem.length,
          itemBuilder: (context, index) {
            final cartData = _cartProvider.getCartItem.values.toList()[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(13.0),
        child: InkWell(
          onTap: () {
            // Place order, it work of future
            print('Place Order');
          },
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.yellow.shade900,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child: Text(
                'PLACE ORDER',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
