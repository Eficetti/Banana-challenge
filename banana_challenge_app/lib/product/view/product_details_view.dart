import 'package:banana_challenge_app/constants.dart';
import 'package:banana_challenge_app/l10n/l10n.dart';
import 'package:banana_challenge_app/product/cubit/product_cubit.dart';
import 'package:banana_challenge_app/product/cubit/product_state.dart';
import 'package:banana_challenge_app/product/widgets/product_card.dart';
import 'package:banana_challenge_app/widgets/banana_button.dart';
import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductCubit(),
      child: ProductDetailsView(product: product),
    );
  }
}

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    context.read<ProductCubit>().getHomeData();
    final l10n = context.l10n;

    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state.status.isAttempting) {
          const CircularProgressIndicator();
        }

        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error'),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(BananaConstants.bananaMainColor),
            title: Text(product.title ?? '-'),
          ),
          body: Column(
            children: [
              ProductCard(
                product: product,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: BananaButton(
                    onPressed: () {},
                    text: l10n.addToShoppingCart,
                    width: 330,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
