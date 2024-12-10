import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 150.0,
              height: 90.0,
              fit: BoxFit.contain,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications, color: Colors.grey),
                  onPressed: () {

                  },
                ),
                const SizedBox(width: 10),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your profile image asset
                  radius: 18,
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.lightBlueAccent.withOpacity(0.2),
                contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Button Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HoverButton(label: "New"),
                HoverButton(label: "Top Sell"),
                HoverButton(label: "Offer"),
                HoverButton(label: "Popular"),
              ],
            ),
          ),

          // Product Grid Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two items per row
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ProductCard(
                    imageUrl: 'assets/images/background.jpg',
                    title: 'Product ${index + 1}',
                    price: 100 + (index * 10),
                  );
                },
              ),
            ),
          ),

          BottomNavigationBar(
            items: [
              _buildNavBarItem(Icons.home, "Home"),
              _buildNavBarItem(Icons.message, "Message"),
              _buildNavBarItem(Icons.shopping_cart, "Cart"),
              _buildNavBarItem(Icons.track_changes, "Track"),
              _buildNavBarItem(Icons.person, "Profile"),
            ],
            selectedItemColor: const Color.fromRGBO(17, 45, 78, 1),
            unselectedItemColor: Colors.grey,
          ),
        ],
      ),
    );
  }


  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}


class HoverButton extends StatefulWidget {
  final String label;
  const HoverButton({Key? key, required this.label}) : super(key: key);

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: _isHovered ? const Color.fromRGBO(17, 45, 78, 1) : Colors.white,
            border: Border.all(color: Colors.grey, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _isHovered ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}


class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final int price;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          // Product Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '\৳$price',
              style: const TextStyle(color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
