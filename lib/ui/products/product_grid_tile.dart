import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'products_detail_screen.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile(
    this.product, {
    super.key,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: buidGridFooterBar(context),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget buidGridFooterBar(BuildContext context) {
    return GridTileBar(
      backgroundColor: Colors.black87,
      leading: ValueListenableBuilder<bool>(
        valueListenable: product.isFavoriteListenable,
        builder: (ctx, isFavorite, child) {
          return IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              product.isFavorite = !isFavorite;
            },
          );
        },
      ),
      title: Text(
        product.title,
        textAlign: TextAlign.center,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.shopping_cart),
        onPressed: () {
          print('Add item to cart');
        },
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
