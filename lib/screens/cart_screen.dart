import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Item> cartItems;

  CartScreen({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0.0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Color(0xFF6C63FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your Cart",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Daftar item di keranjang
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(cartItems[index].imagePath, width: 50, height: 50),
                    title: Text(cartItems[index].name),
                    subtitle: Text('\$${cartItems[index].price}'),
                  );
                },
              ),
            ),

            // Total harga dan tombol checkout
            SizedBox(height: 20),
            Text(
              "Total: \$${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic untuk melakukan checkout
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Checkout successful!'),
                  ));
                },
                child: Text("Checkout"),
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
