import 'package:ecommerceapp/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingScreens extends StatefulWidget {
  @override
  State<ShippingScreens> createState() => _ShippingScreensState();
}

class _ShippingScreensState extends State<ShippingScreens>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  bool? _chargeShipping = false;

  late int shippingCharge;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final ProductProvider _productProvider =
        Provider.of<ProductProvider>(context);
    return Column(
      children: [
        CheckboxListTile(
          title: Text(
            'Charge Shipping',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 4,
            ),
          ),
          value: _chargeShipping,
          onChanged: (value) {
            setState(() {
              _chargeShipping = value;
              _productProvider.getFormData(chargeShipping: _chargeShipping);
            });
          },
        ),
        if (_chargeShipping == true)
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: ((value) {
                if (value!.isEmpty) {
                  return 'Shipping Charge';
                } else {
                  return null;
                }
              }),
              onChanged: (value) {
                _productProvider.getFormData(
                    shippingCharge: int.tryParse(value));
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Shipping Charge'),
            ),
          ),
      ],
    );
  }
}
