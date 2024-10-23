import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductScreen extends StatelessWidget {
  final Item selectedItem;
  final VoidCallback onAddToCart;

  // Inisialisasi formatter untuk format rupiah
  final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp', decimalDigits: 0);

  ProductScreen({required this.selectedItem, required this.onAddToCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            selectedItem.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
        ),
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
              currencyFormatter.format(selectedItem.price), // Menggunakan selectedItem.price
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            // Menampilkan rating bintang
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < selectedItem.rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                );
              }),
            ),
            SizedBox(height: 20),
            Text(
              "Fitur Unggulan: \nMudah Dicuci: Bahan katun yang mudah dirawat. \n\nTahan Lama: Kualitas bahan yang tidak mudah pudar, meskipun sering dicuci. \n\nFleksibel: Cocok untuk berbagai acara. \n\nCara Perawatan: Cuci dengan air dingin, jangan gunakan pemutih.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                icon: Icon(Icons.add_shopping_cart, color: Colors.white),
                label: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C63FF),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
