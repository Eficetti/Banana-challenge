import 'package:banana_challenge_app/constants.dart';
import 'package:banana_challenge_app/l10n/l10n.dart';
import 'package:banana_challenge_app/product/cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resize/resize.dart';

// ignore: must_be_immutable
class BananaSearchBox extends StatelessWidget {
  BananaSearchBox({
    super.key,
    required this.searchBarController,
  });

  TextEditingController searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      width: 330.sp,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: searchBarController,
        onChanged: (value) => context
            .read<ProductCubit>()
            .getProductsBySearch(searchBarController.text),
        decoration: InputDecoration(
          filled: true,
          border: InputBorder.none,
          suffixIcon: const Icon(Icons.search),
          hintText: l10n.searchProduct,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(BananaConstants.bananaGrey),
            ),
          ),
        ),
      ),
    );
  }
}
