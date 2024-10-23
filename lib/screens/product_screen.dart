import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  final Item selectedItem;
  final VoidCallback onAddToCart;

  ProductScreen({required this.selectedItem, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedItem.name),
        backgroundColor: Color(0xFF6C63FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  selectedItem.imagePath,
                  fit: BoxFit.cover,
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              selectedItem.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '\$${selectedItem.price}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6C63FF),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Deskripsi produk akan ditampilkan di sini.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  onAddToCart(); // Tambahkan produk ke keranjang
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('${selectedItem.name} added to cart!'),
                  ));
                  Navigator.pop(context); // Kembali ke HomeScreen
                },
                icon: Icon(Icons.add_shopping_cart),
                label: Text("Add to Cart"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C63FF),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
