
// lib/presentation/screens/home/home_page.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/product.dart';
import '../../../data/models/shape_list.dart';
import '../../../state/controller.dart';
import '../../../state/app_state.dart';
import '../category/category_item.dart';
import '../navigation/curved_nav.dart';
import '../product/product_item.dart';


class HomeScreennn extends ConsumerWidget {
  const HomeScreennn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);
    final productsAsync = ref.watch(productsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    final navItems = [
      CurvedNavigationBarItem(icon: Icons.home, label: ''),
      CurvedNavigationBarItem(icon: Icons.search, label: ''),
      CurvedNavigationBarItem(icon: Icons.shopping_bag, label: ''),
      CurvedNavigationBarItem(icon: Icons.person, label: ''),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eyewear Store',style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown[800],
        elevation: 0,actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.notifications),),
      ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25))),
      ),
      body: _getBody(currentIndex, productsAsync, categoriesAsync, ref),
      bottomNavigationBar: CurvedNavigationBar(items: navItems),
    );
  }

  Widget _getBody(int currentIndex, AsyncValue<List<Productt>> productsAsync,
      AsyncValue<List<ShapeList>> categoriesAsync, WidgetRef ref) {
    switch (currentIndex) {
      case 0: // Home
        return _buildHomeContent(productsAsync, categoriesAsync, ref);

      case 1: // Search
        return const Center(child: Text('Search Screen'));

      case 2: // Cart
        return const Center(child: Text('Cart Screen'));

      case 3: // Profile
        return const Center(child: Text('Profile Screen'));

      default:
        return const Center(child: Text('Home Screen'));
    }
  }

  Widget _buildHomeContent(AsyncValue<List<Productt>> productsAsync,
      AsyncValue<List<ShapeList>> categoriesAsync, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.refresh(productsProvider.future),
      child: CustomScrollView(
        slivers: [
          // Categories Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: SizedBox(
                height: 150,
                child: categoriesAsync.when(
                  data: (categories) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final categoryy = categories[index];
                      return CategoryItem(category: categoryy);
                    },
                  ),
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (error, stack) => Center(child: Text('Error: $error')),
                ),
              ),
            ),
          ),


          // Static Tabs Section
          SliverToBoxAdapter(
            child: _buildTabBar(),
          ),


          // Products Section
          productsAsync.when(
            data: (products) => SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1,
              ),
              delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                    ProductItem(product: products[index]),
                childCount: products.length,
              ),
            ),
            loading: () => const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => SliverFillRemaining(
              child: Center(child: Text('Error: $error')),
            ),
          ),
        ],
      ),
    );
  }



  Widget _buildTabBar() {
    final tabs = ['All', 'Trending', 'Recommended', 'Best Seller'];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabs.map((tab) {
          final isSelected = tab == 'All';
          if (isSelected) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                tab,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            // Unselected tabs
            return Text(
              tab,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            );
          }
        }).toList(),
      ),
    );
  }
}
