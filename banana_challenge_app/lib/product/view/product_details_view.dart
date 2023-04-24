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

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  void initState() {
    super.initState();
    // context.read<ProductCubit>().getProductById(widget.product.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocListener<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(BananaConstants.bananaMainColor),
          title: Text(widget.product.title ?? '-'),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state.status.isAttempting) {
              const CircularProgressIndicator();
            }

            return Column(
              children: [
                ProductCard(
                  product: widget.product,
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
            );
          },
        ),
      ),
    );
  }
}
