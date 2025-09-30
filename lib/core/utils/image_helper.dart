// // import 'package:flutter/foundation.dart';
// //
// // class ImageHelper {
// //   static String getImageUrl(String imagePath) {
// //     // For web only - use CORS proxy
// //     if (kIsWeb) {
// //       return 'https://corsproxy.io/?${Uri.encodeFull('https://api.hanzprellet.com/storage/$imagePath')}';
// //     }
// //     // For mobile - direct URL
// //     return 'https://api.hanzprellet.com/storage/$imagePath';
// //   }
// // }
//


// import 'package:flutter/foundation.dart';
//
// class ImageHelper {
//   static String getImageUrl(String imagePath) {
//     // Add null/empty check
//     if (imagePath.isEmpty) return '';
//
//     // For web only - use CORS proxy
//     if (kIsWeb) {
//       return 'https://corsproxy.io/?${Uri.encodeFull('https://api.hanzprellet.com/storage/$imagePath')}';
//     }
//     // For mobile - direct URL
//     return 'https://api.hanzprellet.com/storage/$imagePath';
//   }
// }