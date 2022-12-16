import 'dart:io';

import 'package:demo1/src/app.dart';
import 'package:demo1/src/constants/network_api.dart';
import 'package:demo1/src/models/product.dart';
import 'package:demo1/src/widgets/image_not_found.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    required this.product,
    required this.onTap,
    this.isGrid,
    Key? key,
  }) : super(key: key);

  final Product product;
  final VoidCallback? onTap;
  final bool? isGrid;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(0),
      ),
      onPressed: onTap,
      child: LayoutBuilder(
        builder: (context, constraint) => Container(
          child: Card(
            color: Colors.white,
            child: Column(
              children: [
                _buildImage(constraint.maxHeight),
                _buildInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Stack _buildImage(double maxHeight) {
    // caes of listview
    var height = maxHeight * 0.7;

    // case of grid
    if (isGrid != null && isGrid == true) {
      height = maxHeight * 0.6;
    }

    final image = product.image;
    final stock = product.stock;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: height,
          child: image != null && image.isNotEmpty
              ? _image(image)
              : ImageNotFound(),
        ),
        if (stock <= 0) _buildOutOfStock(),
      ],
    );
  }

  Expanded _buildInfo() => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: (isGrid ?? false)
                    ? TextStyle(fontSize: 14, fontWeight: FontWeight.normal)
                    : TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '฿${formatCurrency.format(product.price)}',
                    style: TextStyle(
                      fontSize: isGrid ?? false ? 15 : 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${formatNumber.format(product.stock)} pcs.',
                    style: TextStyle(
                      fontSize: isGrid ?? false ? 15 : 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Image _image(String image) {
    String imageUrl;
    if (image.contains("://")) {
      imageUrl = image;
    } else {
      imageUrl = '${NetworkAPI.imageURL}/$image';
    }

    return Image.network(
      imageUrl,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Positioned _buildOutOfStock() => const Positioned(
        top: 2,
        right: 2,
        child: Card(
          color: Colors.amber,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              'out of stock',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
}
