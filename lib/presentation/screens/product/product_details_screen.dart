// // product_details_screen.dart
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
//
// import '../model/product.dart';
//
// class ProductDetailsScreen extends StatelessWidget {
//   final Productt product;
//
//   const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name ?? 'Product')),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Main image
//             Card(
//               color: Colors.white,
//               child: Column(
//                 children: [
//                   CachedNetworkImage(
//                     imageUrl: 'https://api.hanzprellet.com/storage/${product.image}',
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.contain,
//                     placeholder: (context, url) => CircularProgressIndicator(),
//                     errorWidget: (context, url, error) => Icon(Icons.image_not_supported),
//                   ),
//                   if (product.colorOptions != null && product.colorOptions!.isNotEmpty)
//                     Column(
//                       //crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         const SizedBox(height: 8),
//                         SizedBox(
//                           height: 80, // Fixed height for horizontal scroll
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             itemCount: product.colorOptions!.length,
//                             itemBuilder: (context, index) {
//                               final color = product.colorOptions![index];
//                               return Container(
//                                 margin: const EdgeInsets.only(right: 16),
//                                 width: 60, // Fixed width per item
//                                 child: Column(
//                                   children: [
//                                     // Color image
//                                     ClipOval(
//                                       child: color.optionImage != null
//                                           ? CachedNetworkImage(
//                                         imageUrl: 'https://api.hanzprellet.com/storage/${color.optionImage}',
//                                         width: 50,
//                                         height: 50,
//                                         fit: BoxFit.cover,
//                                         placeholder: (context, url) => const CircularProgressIndicator(),
//                                         errorWidget: (context, url, error) => const Icon(Icons.color_lens, size: 30),
//                                       )
//                                           : const Icon(Icons.color_lens, size: 30),
//                                     ),
//                                     const SizedBox(height: 4),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                         ),
//                         Text(
//                           product.name ?? '',
//                           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//
//             ),
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     product.name ?? '',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8),
//                   Text('Price: \$${product.price ?? 0}'),
//                   SizedBox(height: 8),
//                   Text(product.description ?? ''),
//
//                   // Show color options if any
//                   if (product.colorOptions != null && product.colorOptions!.isNotEmpty)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Colors:', style: TextStyle(fontWeight: FontWeight.bold)),
//                         ...product.colorOptions!.map((color) {
//                           return ListTile(
//                             title: Text(color.optionValue ?? 'Color'),
//                             leading: color.optionImage != null
//                                 ? CachedNetworkImage(
//                               imageUrl: 'https://api.hanzprellet.com/storage/${color.optionImage}',
//                               width: 40,
//                               height: 40,
//                               fit: BoxFit.cover,
//                             )
//                                 : null,
//                           );
//                         }).toList(),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// // product_details_screen.dart
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/product.dart';
//
// final selectedColorProvider = StateProvider<ColorOption?>((ref) => null);
//
// class ProductDetailsScreen extends ConsumerWidget {
//   final Productt product;
//
//   const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedColor = ref.watch(selectedColorProvider);
//
//     // Initialize selection if needed
//     if (selectedColor == null && product.colorOptions?.isNotEmpty == true) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ref.read(selectedColorProvider.notifier).state = product.colorOptions!.first;
//       });
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name ?? 'Product')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Main Image
//             SizedBox(
//               height: 300,
//               width: double.infinity,
//               child: Card(
//                 child: CachedNetworkImage(
//                   imageUrl: selectedColor?.optionImage != null
//                       ? 'https://api.hanzprellet.com/storage/${selectedColor!.optionImage}'
//                       : 'https://api.hanzprellet.com/storage/${product.image}',
//                   fit: BoxFit.contain,
//                   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                   errorWidget: (context, url, error) => const Center(child: Icon(Icons.image_not_supported)),
//                 ),
//               ),
//             ),
//
//
//
//             const SizedBox(height: 16),
//             Text(product.name ?? '', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text('Price: \$${selectedColor?.price ?? product.price ?? 0}'),
//             const SizedBox(height: 8),
//             if (product.description != null) Text(product.description!),
//             const SizedBox(height: 16),
//
//             // Color Options
//             if (product.colorOptions != null && product.colorOptions!.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     height: 80,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: product.colorOptions!.length,
//                       itemBuilder: (context, index) {
//                         final color = product.colorOptions![index];
//                         final isSelected = selectedColor == color;
//                         return GestureDetector(
//                           onTap: () => ref.read(selectedColorProvider.notifier).state = color,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 16),
//                             width: 60,
//                             child: Column(
//                               children: [
//                                 ClipOval(
//                                   child: Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: isSelected ? Colors.blue : Colors.grey.shade300,
//                                         width: 2,
//                                       ),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: color.optionImage != null
//                                         ? CachedNetworkImage(
//                                       imageUrl: 'https://api.hanzprellet.com/storage/${color.optionImage}',
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => const CircularProgressIndicator(),
//                                       errorWidget: (context, url, error) => const Icon(Icons.color_lens, size: 30),
//                                     )
//                                         : const Icon(Icons.color_lens, size: 30),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Expanded(
//                                   child: Text(
//                                     color.optionValue ?? 'Color',
//                                     textAlign: TextAlign.center,
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: isSelected ? Colors.blue : null,
//                                       fontWeight: isSelected ? FontWeight.bold : null,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/product.dart';
//
// final selectedColorProvider = StateProvider<ColorOption?>((ref) => null);
//
// class ProductDetailsScreen extends ConsumerWidget {
//   final Productt product;
//
//   const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedColor = ref.watch(selectedColorProvider);
//     final quantityProvider = StateProvider<int>((ref) => 1);
//
//     // Initialize selection if needed
//     if (selectedColor == null && product.colorOptions?.isNotEmpty == true) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ref.read(selectedColorProvider.notifier).state = product.colorOptions!.first;
//       });
//     }
//
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name ?? 'Product')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Image
//                   SizedBox(
//                     height: 200,
//                     width: double.infinity,
//                     child: CachedNetworkImage(
//                       imageUrl: selectedColor?.optionImage != null
//                           ? 'https://api.hanzprellet.com/storage/${selectedColor!.optionImage}'
//                           : 'https://api.hanzprellet.com/storage/${product.image}',
//                       fit: BoxFit.contain,
//                       placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                       errorWidget: (context, url, error) => const Center(child: Icon(Icons.image_not_supported)),
//                     ),
//                   ),
//
//
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             product.name ?? 'No Name',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         // Price (right)
//                         Text(
//                           '\$${selectedColor?.price ?? product.price ?? 0}',
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.green,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 16),
//
//             // Description
//             if (product.description != null)
//               Text(product.description!),
//
//             const SizedBox(height: 16),
//
//             // Color Options
//             if (product.colorOptions != null && product.colorOptions!.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Colors:',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                   ),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     height: 80,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: product.colorOptions!.length,
//                       itemBuilder: (context, index) {
//                         final color = product.colorOptions![index];
//                         final isSelected = selectedColor == color;
//                         return GestureDetector(
//                           onTap: () => ref.read(selectedColorProvider.notifier).state = color,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 16),
//                             width: 60,
//                             child: Column(
//                               children: [
//                                 ClipOval(
//                                   child: Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: isSelected ? Colors.blue : Colors.grey.shade300,
//                                         width: 2,
//                                       ),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: color.optionImage != null
//                                     // 🔥 FIXED: Removed extra spaces in URLs
//                                         ? CachedNetworkImage(
//                                       imageUrl: 'https://api.hanzprellet.com/storage/${color.optionImage}',
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => const CircularProgressIndicator(),
//                                       errorWidget: (context, url, error) => const Icon(Icons.color_lens, size: 30),
//                                     )
//                                         : const Icon(Icons.color_lens, size: 30),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Expanded(
//                                   child: Text(
//                                     color.optionValue ?? 'Color',
//                                     textAlign: TextAlign.center,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: isSelected ? Colors.blue : null,
//                                       fontWeight: isSelected ? FontWeight.bold : null,
//                                     ),
//                                   ),
//
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }







// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/product.dart';
//
//
// final quantityProvider = StateProvider<int>((ref) => 0);
// final selectedColorProvider = StateProvider<ColorOption?>((ref) => null);
// final selectedSizeProvider = StateProvider<String?>((ref) => null);
// final galleryPageProvider = StateProvider<int>((ref) => 0);
//
// class ProductDetailsScreen extends ConsumerWidget {
//   final Productt product;
//
//   const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedColor = ref.watch(selectedColorProvider);
//     final quantity = ref.watch(quantityProvider);
//     final unitPrice = selectedColor?.price ?? product.price ?? 0;
//     final selectedSize = ref.watch(selectedSizeProvider);
//     final galleryPage = ref.watch(galleryPageProvider);
//
//     // Initialize color selection
//     if (selectedColor == null && product.colorOptions?.isNotEmpty == true) {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         ref.read(selectedColorProvider.notifier).state = product.colorOptions!.first;
//       });
//     }
// //adding
//     List<String> imageUrls = [];
//     if (product.image != null) {
//       imageUrls.add('https://api.hanzprellet.com/storage/${product.image}');
//     }
//     if (product.images != null) {
//       imageUrls.addAll(
//         product.images!.map((img) => 'https://api.hanzprellet.com/storage/${img.image}').toList(),
//       );
//     }
//
//     if (imageUrls.isEmpty) {
//       imageUrls.add('https://via.placeholder.com/300?text=No+Image');
//     }
//
//     final sizes = ['S', 'M', 'L', 'XL'];
//
//     return Scaffold(
//       appBar: AppBar(title: Text(product.name ?? 'Product')),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             Card(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 200,
//                     width: double.infinity,
//                     // child: CachedNetworkImage(
//                     //   imageUrl: selectedColor?.optionImage != null
//                     //       ? 'https://api.hanzprellet.com/storage/${selectedColor!.optionImage}'
//                     //       : 'https://api.hanzprellet.com/storage/${product.image}',
//                     //   fit: BoxFit.contain,
//                     //   placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                     //   errorWidget: (context, url, error) => const Center(child: Icon(Icons.image_not_supported)),
//                     // ),
//                     child: // In the main CachedNetworkImage (top card)
//                     CachedNetworkImage(
//                       imageUrl: product.image != null
//                           ? 'https://api.hanzprellet.com/storage/${product.image!.trim()}'
//                           : 'https://via.placeholder.com/300?text=No+Image',
//                       fit: BoxFit.contain,
//                       placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                       errorWidget: (context, url, error) => const Center(child: Icon(Icons.image_not_supported)),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             product.name ?? 'No Name',
//                             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Text(
//                           '\$${unitPrice}',
//                           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             const SizedBox(height: 12),
//             SizedBox(
//               height: 80,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: imageUrls.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       ref.read(galleryPageProvider.notifier).state = index;
//                     },
//                     child: Container(
//                       margin: const EdgeInsets.only(right: 12),
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: galleryPage == index ? Colors.blue : Colors.grey.shade300,
//                           width: 2,
//                         ),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(6),
//                         child: CachedNetworkImage(
//                           imageUrl: imageUrls[index],
//                           fit: BoxFit.cover,
//                           placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
//                           errorWidget: (context, url, error) => const Icon(Icons.image_not_supported, size: 20),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//
// SizedBox(height: 8,),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text('Size:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
//                 const SizedBox(height: 8),
//                 Wrap(
//                   spacing: 12,
//                   runSpacing: 8,
//                   children: sizes.map((size) {
//                     final isSelected = selectedSize == size;
//                     return GestureDetector(
//                       onTap: () {
//                         ref.read(selectedSizeProvider.notifier).state = size;
//                       },
//                       child: Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: isSelected ? Colors.blue : Colors.grey.shade400,
//                           ),
//                           borderRadius: BorderRadius.circular(6),
//                           color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
//                         ),
//                         child: Text(
//                           size,
//                           style: TextStyle(
//                             fontWeight: isSelected ? FontWeight.bold : null,
//                             color: isSelected ? Colors.blue : null,
//                           ),
//                         ),
//                       ),
//                     );
//                   }).toList(),
//                 ),
//               ],
//             ),
//
//
//             const SizedBox(height: 20),
//             Text('Description:', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
//             const SizedBox(height: 6),
//             if (product.description != null) Text(product.description!),
//             const SizedBox(height: 16),
//
//             // Color Options
//             if (product.colorOptions != null && product.colorOptions!.isNotEmpty)
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text('Colors:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//                   const SizedBox(height: 8),
//                   SizedBox(
//                     height: 80,
//                     child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: product.colorOptions!.length,
//                       itemBuilder: (context, index) {
//                         final color = product.colorOptions![index];
//                         final isSelected = selectedColor == color;
//                         return GestureDetector(
//                           onTap: () => ref.read(selectedColorProvider.notifier).state = color,
//                           child: Container(
//                             margin: const EdgeInsets.only(right: 16),
//                             width: 60,
//                             child: Column(
//                               children: [
//                                 ClipOval(
//                                   child: Container(
//                                     width: 50,
//                                     height: 50,
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: isSelected ? Colors.blue : Colors.grey.shade300,
//                                         width: 2,
//                                       ),
//                                       shape: BoxShape.circle,
//                                     ),
//                                     child: color.optionImage != null
//                                         ? CachedNetworkImage(
//                                       imageUrl: 'https://api.hanzprellet.com/storage/${color.optionImage}',
//                                       fit: BoxFit.cover,
//                                       placeholder: (context, url) => const CircularProgressIndicator(),
//                                       errorWidget: (context, url, error) => const Icon(Icons.color_lens, size: 30),
//                                     )
//                                         : const Icon(Icons.color_lens, size: 30),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Expanded(
//                                   child: Text(
//                                     color.optionValue ?? 'Color',
//                                     textAlign: TextAlign.center,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(
//                                       fontSize: 12,
//                                       color: isSelected ? Colors.blue : null,
//                                       fontWeight: isSelected ? FontWeight.bold : null,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//
//             const SizedBox(height: 24),
//
//
//             Row(
//               children: [
//
//                 Expanded(
//                   child: Card(
//                     shape: RoundedRectangleBorder(
//                       side: BorderSide(color: Colors.grey.shade400),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text('Qty:', style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(width: 12),
//
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             constraints: const BoxConstraints(),
//                             onPressed: () {
//                               if (quantity > 0) {
//                                 ref.read(quantityProvider.notifier).state = quantity - 1;
//                               }
//                             },
//                             icon: const Icon(Icons.remove, size: 18),
//                           ),
//                           //
//                           // Quantity Display
//                           SizedBox(width: 8,),
//                           Text(
//                             '$quantity',
//                             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                           ),
//                           // Plus Button
//                           SizedBox(width: 8,),
//                           IconButton(
//                             padding: EdgeInsets.zero,
//                             constraints: const BoxConstraints(),
//                             onPressed: () {
//                               ref.read(quantityProvider.notifier).state = quantity + 1;
//                             },
//                             icon: const Icon(Icons.add, size: 18),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 // BUY NOW Button (disabled when quantity=0)
//                 Expanded(
//                   flex: 2,
//                   child: ElevatedButton(
//                     onPressed: quantity > 0 ? () {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Added $quantity ${product.name ?? 'item'} to cart!'),
//                           backgroundColor: Colors.green,
//                         ),
//                       );
//                     } : null, // Disabled when quantity=0
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: quantity > 0 ? Colors.green : Colors.grey,
//                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                     ),
//                     child: const Text(
//                       'BUY NOW',
//                       style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }          change back if other one is wrong

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/product.dart';

final quantityProvider = StateProvider<int>((ref) => 0);
final selectedColorProvider = StateProvider<ColorOption?>((ref) => null);
final selectedSizeProvider = StateProvider<String?>((ref) => null);
final galleryPageProvider = StateProvider<int>((ref) => 0);

class ProductDetailsScreen extends ConsumerWidget {
  final Productt product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  // Helper to get best available image URL for a single image
  String _getBestImageUrl(Productt product) {
    const baseUrl = 'https://api.hanzprellet.com/storage/';

    if (product.image != null && product.image!.isNotEmpty) {
      return '$baseUrl${product.image!.trim()}';
    }
    if (product.images != null && product.images!.isNotEmpty) {
      final firstImg = product.images!.first.image;
      if (firstImg != null && firstImg.isNotEmpty) {
        return '$baseUrl${firstImg.trim()}';
      }
    }
    if (product.colorOptions != null && product.colorOptions!.isNotEmpty) {
      final firstColorImg = product.colorOptions!.first.optionImage;
      if (firstColorImg != null && firstColorImg.isNotEmpty) {
        return '$baseUrl${firstColorImg.trim()}';
      }
    }
    return 'https://via.placeholder.com/300?text=No+Image';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedColor = ref.watch(selectedColorProvider);
    final quantity = ref.watch(quantityProvider);
    final unitPrice = selectedColor?.price ?? product.price ?? 0;
    final selectedSize = ref.watch(selectedSizeProvider);
    final galleryPage = ref.watch(galleryPageProvider);

    // Initialize color selection
    if (selectedColor == null && product.colorOptions?.isNotEmpty == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(selectedColorProvider.notifier).state = product.colorOptions!.first;
      });
    }

    // Build gallery image URLs — clean and safe
    const baseUrl = 'https://api.hanzprellet.com/storage/';
    List<String> imageUrls = [];

    // Add main image
    if (product.image != null && product.image!.isNotEmpty) {
      imageUrls.add('$baseUrl${product.image!.trim()}');
    }

    // Add additional images
    if (product.images != null) {
      imageUrls.addAll(
        product.images!
            .map((img) => img.image)
            .where((img) => img != null && img.isNotEmpty)
            .map((img) => '$baseUrl${img!.trim()}')
            .toList(),
      );
    }

    // Optional: Add color option images to gallery? (Uncomment if needed)
    // if (product.colorOptions != null) {
    //   imageUrls.addAll(
    //     product.colorOptions!
    //         .map((color) => color.optionImage)
    //         .whereType<String>()
    //         .where((img) => img.isNotEmpty)
    //         .map((img) => '$baseUrl${img.trim()}')
    //         .toList(),
    //   );
    // }

    // Fallback
    if (imageUrls.isEmpty) {
      imageUrls.add('https://via.placeholder.com/300?text=No+Image');
    }

    final sizes = ['S', 'M', 'L', 'XL'];

    // 🔍 Optional: Debug logs
    // print('🖼️ Product: ${product.name}');
    // print('📸 Gallery URLs: $imageUrls');
    // print('监听页面: $galleryPage');

    return Scaffold(
      appBar: AppBar(title: Text(product.name ?? 'Product')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ MAIN IMAGE: driven by galleryPage
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: imageUrls[galleryPage],
                      fit: BoxFit.contain,
                      placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.image_not_supported)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            product.name ?? 'No Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '\$${unitPrice}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ GALLERY THUMBNAILS
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      ref.read(galleryPageProvider.notifier).state = index;
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 12),
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: galleryPage == index
                              ? Colors.blue
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: CachedNetworkImage(
                          imageUrl: imageUrls[index],
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                          const Icon(Icons.image_not_supported, size: 20),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            // Size Selector
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Size:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 12,
                  runSpacing: 8,
                  children: sizes.map((size) {
                    final isSelected = selectedSize == size;
                    return GestureDetector(
                      onTap: () {
                        ref.read(selectedSizeProvider.notifier).state = size;
                      },
                      child: Container(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: isSelected
                                ? Colors.blue
                                : Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(6),
                          color: isSelected
                              ? Colors.blue.withOpacity(0.1)
                              : Colors.transparent,
                        ),
                        child: Text(
                          size,
                          style: TextStyle(
                            fontWeight: isSelected ? FontWeight.bold : null,
                            color: isSelected ? Colors.blue : null,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 6),
            if (product.description != null) Text(product.description!),
            const SizedBox(height: 16),

            // Color Options
            if (product.colorOptions != null && product.colorOptions!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Colors:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: product.colorOptions!.length,
                      itemBuilder: (context, index) {
                        final color = product.colorOptions![index];
                        final isSelected = selectedColor == color;
                        return GestureDetector(
                          onTap: () => ref.read(selectedColorProvider.notifier).state = color,
                          child: Container(
                            margin: const EdgeInsets.only(right: 16),
                            width: 60,
                            child: Column(
                              children: [
                                ClipOval(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.blue
                                            : Colors.grey.shade300,
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: color.optionImage != null
                                        ? CachedNetworkImage(
                                      imageUrl:
                                      'https://api.hanzprellet.com/storage/${color.optionImage!.trim()}',
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                      const Icon(Icons.color_lens, size: 30),
                                    )
                                        : const Icon(Icons.color_lens, size: 30),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Expanded(
                                  child: Text(
                                    color.optionValue ?? 'Color',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: isSelected ? Colors.blue : null,
                                      fontWeight: isSelected ? FontWeight.bold : null,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

            const SizedBox(height: 24),

            // Quantity & Buy Button
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Qty:', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 12),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              if (quantity > 0) {
                                ref.read(quantityProvider.notifier).state = quantity - 1;
                              }
                            },
                            icon: const Icon(Icons.remove, size: 18),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '$quantity',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              ref.read(quantityProvider.notifier).state = quantity + 1;
                            },
                            icon: const Icon(Icons.add, size: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: quantity > 0
                        ? () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Added $quantity ${product.name ?? 'item'} to cart!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: quantity > 0 ? Colors.green : Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'BUY NOW',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
