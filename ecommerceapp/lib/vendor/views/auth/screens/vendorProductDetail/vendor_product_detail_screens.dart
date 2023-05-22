import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VendorProductDetailScreen extends StatefulWidget {
  final dynamic productData;

  const VendorProductDetailScreen({super.key, required this.productData});

  @override
  State<VendorProductDetailScreen> createState() =>
      _VendorProductDetailScreenState();
}

class _VendorProductDetailScreenState extends State<VendorProductDetailScreen> {
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _brandNameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  @override
  void initState() {
    setState(() {
      _productNameController.text = widget.productData['productName'];
      _brandNameController.text = widget.productData['brandName'];
      _quantityController.text = widget.productData['quantity'].toString();
      _productPriceController.text =
          widget.productData['productPrice'].toString();
      _productDescriptionController.text = widget.productData['description'];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade900,
        elevation: 0,
        title: Text(widget.productData['productName']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _brandNameController,
              decoration: InputDecoration(
                labelText: 'Brand Name',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _productPriceController,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              maxLength: 500,
              maxLines: 3,
              controller: _productDescriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
