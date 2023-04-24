import 'package:banana_challenge_app/constants.dart';
import 'package:banana_challenge_app/l10n/l10n.dart';
import 'package:banana_challenge_app/product/cubit/product_cubit.dart';
import 'package:banana_challenge_app/product/cubit/product_state.dart';
import 'package:banana_challenge_app/product/view/product_details_view.dart';
import 'package:banana_challenge_app/product/widgets/product_list_card.dart';
import 'package:banana_challenge_app/widgets/banana_search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resize/resize.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: ProductListView(),
    );
  }
}

class ProductListView extends StatelessWidget {
  ProductListView({super.key});

  final searchBarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<ProductCubit>().getHomeData();

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error'),
            ),
          );
        }
      },
      builder: (context, state) {
        final l10n = context.l10n;
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(BananaConstants.bananaMainColor),
            title: const Text('Flutter Challenge 2023'),
          ),
          body: Column(
            children: [
              BananaSearchBox(
                searchBarController: searchBarController,
              ),
              if (state.products.isEmpty)
                Column(
                  children: [
                    SizedBox(height: 80.sp),
                    Center(
                      child: Text(
                        '${l10n.productsNotFound} ${searchBarController.text}',
                      ),
                    ),
                  ],
                )
              else
                Expanded(
                  child: ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: ProductListCard(
                          product: state.products[index],
                        ),
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsPage(
                              product: state.products[index],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
