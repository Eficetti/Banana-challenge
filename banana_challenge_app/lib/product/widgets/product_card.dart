import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: 200.sp,
                width: 300.sp,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: product.images?.length ?? 0,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(product.images![index]),
                    );
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40.sp,
          ),
          Text(product.description ?? '-'),
          SizedBox(
            height: 100.sp,
          ),
          Text(
            'USD ${product.price}',
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
