//
// import 'package:flutter/material.dart';
// import '../model/shapelist.dart';
//
// class CategoryItem extends StatelessWidget {
//   final ShapeList category;
//
//   const CategoryItem({super.key, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 80,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//       child: Column(
//         children: [
//           // Category Image
//           CircleAvatar(
//             radius: 40,
//             backgroundColor: Colors.grey[200],
//             backgroundImage: category.fullImageUrl.isNotEmpty
//                 ? NetworkImage(category.fullImageUrl)
//                 : null,
//             child: category.fullImageUrl.isEmpty
//                 ? const Icon(Icons.category, color: Colors.grey)
//                 : null,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             category.name!,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w500,
//             ),
//             maxLines: 2,
//             overflow: TextOverflow.ellipsis,
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../data/models/shape_list.dart';

class CategoryItem extends StatelessWidget {
  final ShapeList category;

  const CategoryItem({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          ClipOval(
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey[200],
              child: category.fullImageUrl.isNotEmpty
                  ? CachedNetworkImage(
                imageUrl: category.fullImageUrl,
                fit: BoxFit.contain,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.category, color: Colors.grey),
              )
                  : const Icon(Icons.category, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name!,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
