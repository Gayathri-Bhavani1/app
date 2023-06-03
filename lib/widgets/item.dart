import 'package:app/constants/colors.dart';
import 'package:app/constants/fonts.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.productData}) : super(key: key);

  final Map<String, dynamic> productData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            productData["image"] ?? '',
            fit: BoxFit.fill,
            height: 100,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productData['title'] ?? "",
                    style: FontStyles().h3(fontWeight: FontWeight.bold),overflow: TextOverflow.fade,maxLines: 3,),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text("Price:",
                        style: FontStyles().h3(fontWeight: FontWeight.bold)),
                    Text(productData['price'].toString())
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      'Rating',
                      style: FontStyles().h3(fontWeight: FontWeight.bold),
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    const SizedBox(width: 4),
                    Text(productData['rating']['rate'].toString(),
                        style: FontStyles().h3()),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Quantity',
                      style: FontStyles().h3(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 30,),
                    Container(
                      height: 15,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: green.withOpacity(.5),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          productData['rating']['count'].toString(),
                          style: FontStyles().p(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
