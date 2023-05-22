import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UnPublishedTab extends StatelessWidget {
  const UnPublishedTab({super.key});

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _vendorProductStream = FirebaseFirestore
        .instance
        .collection('products')
        .where('vendorId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where('approved', isEqualTo: false)
        .snapshots();

    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _vendorProductStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          return Container(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              itemBuilder: ((context, index) {
                final vendorProductData = snapshot.data!.docs[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        child: Image.network(vendorProductData['imageUrl'][0]),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            vendorProductData['productName'],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\৳' +
                                ' ' +
                                vendorProductData['productPrice']
                                    .toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow.shade900,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
