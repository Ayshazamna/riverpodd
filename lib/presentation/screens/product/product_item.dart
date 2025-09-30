
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/product.dart';
import 'product_details_screen.dart';

class ProductItem extends StatelessWidget {
  final Productt product;

  const ProductItem({super.key, required this.product});

  // Get the first available image
  String get fullImageUrl {
    const baseUrl = 'https://api.hanzprellet.com/storage/';

    // Try to get image from the main image field
    if (product.image != null && product.image!.isNotEmpty) {
      return '$baseUrl${product.image}';
    }

    // Try to get from images array (first image)
    if (product.images != null && product.images!.isNotEmpty) {
      final firstImage = product.images!.first.image;
      if (firstImage != null && firstImage.isNotEmpty) {
        return '$baseUrl$firstImage';
      }
    }

    // Try to get from colorOptions (first option's image)
    if (product.colorOptions != null && product.colorOptions!.isNotEmpty) {
      final firstColorImage = product.colorOptions!.first.optionImage;
      if (firstColorImage != null && firstColorImage.isNotEmpty) {
        return '$baseUrl$firstColorImage';
      }
    }

    // Return empty string if no image found 
    return '';
  }

  @override
  Widget build(BuildContext context) {
    print(' Product: ${product.name}');
    print(' Main image: ${product.image}');
    print(' Images array length: ${product.images?.length ?? 0}');
    print(' Color options length: ${product.colorOptions?.length ?? 0}');
    print(' Full URL: $fullImageUrl');

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: SizedBox(
                width: double.infinity,
                child: fullImageUrl.isEmpty
                    ? Container(
                  color: Colors.grey[200],
                  child: const Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : CachedNetworkImage(
                  imageUrl: fullImageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.grey[200],
                    child: const Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    print(' Image load error for ${product.name}: $error');
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    product.name ?? 'No Name',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '\$${product.price ?? 0}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),

                      // Color dots
                      if (product.colorOptions != null &&
                          product.colorOptions!.isNotEmpty)
                        Row(
                          children: List.generate(
                            product.colorOptions!.length > 3
                                ? 3
                                : product.colorOptions!.length,
                                (index) => Container(
                              margin: const EdgeInsets.only(left: 4),
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                            
                                color: Colors.primaries[
                                index % Colors.primaries.length
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
