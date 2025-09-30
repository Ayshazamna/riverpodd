// lib/presentation/screens/navigation/curved_nav.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../state/app_state.dart';

class CurvedNavigationBar extends ConsumerWidget {
  final List<CurvedNavigationBarItem> items;

  const CurvedNavigationBar({super.key, required this.items});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Curve
          CustomPaint(
            size: Size(MediaQuery.of(context).size.width, 80),
            painter: _CurvedNavigationPainter(),
          ),

          // Navigation Items
          Row(
            children: items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              final isSelected = index == currentIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    ref.read(navigationIndexProvider.notifier).state = index;
                  },
                  child: Container(
                    height: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Animated Icon Container
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isSelected ? 50 : 40,
                          width: isSelected ? 50 : 40,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.brown[400] : Colors.transparent,
                            shape: BoxShape.circle,
                            boxShadow: isSelected ? [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              )
                            ] : [],
                          ),
                          child: Icon(
                            item.icon,
                            color: isSelected ? Colors.white : Colors.grey,
                            size: isSelected ? 24 : 20,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Label
                        Text(
                          item.label,
                          style: TextStyle(
                            color: isSelected ? Colors.blue : Colors.grey,
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class CurvedNavigationBarItem {
  final IconData icon;
  final String label;

  CurvedNavigationBarItem({required this.icon, required this.label});
}

// Custom painter for the curved background
class _CurvedNavigationPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 20) // Start from left with curve
      ..quadraticBezierTo(size.width * 0.2, 0, size.width * 0.35, 0)
      ..lineTo(size.width * 0.65, 0)
      ..quadraticBezierTo(size.width * 0.8, 0, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
