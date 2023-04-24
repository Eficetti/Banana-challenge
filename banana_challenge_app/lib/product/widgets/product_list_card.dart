import 'package:banana_challenge_app/constants.dart';
import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:flutter/material.dart';
import 'package:resize/resize.dart';

class ProductListCard extends StatelessWidget {
  const ProductListCard({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(
          left: 10.sp,
          right: 10.sp,
          top: 10.sp,
        ),
        height: 155.sp,
        width: 200.sp,
        child: Card(
          child: Container(
            padding: EdgeInsets.only(
              left: 10.sp,
              right: 10.sp,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 229.sp,
                      child: Text(
                        product.title ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      'USD ${product.price ?? '-'}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  product.brand ?? '',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(BananaConstants.bananaGrey),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                Text(
                  product.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 19.sp,
                ),
                Text(
                  'Stock: ${product.stock ?? 0}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
