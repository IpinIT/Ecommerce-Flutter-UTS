import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:ecommerce_uts/screens/payment_method_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CartScreen extends StatefulWidget {
  final List<Item> cartItems;

  CartScreen({required this.cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalPrice = 0.0;
  // Fungsi untuk menghitung total harga berdasarkan kuantitas item
  double getTotalPrice() {
    return widget.cartItems
        .fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  }

  // Fungsi untuk menambah kuantitas item
  void increaseQuantity(int index) {
    setState(() {
      widget.cartItems[index].quantity++;
    });
  }

  // Fungsi untuk mengurangi kuantitas item
  void decreaseQuantity(int index) {
    setState(() {
      if (widget.cartItems[index].quantity > 1) {
        widget.cartItems[index].quantity--;
      } else {
        // Jika quantity 1 dan dikurangi, item dihapus dari keranjang
        widget.cartItems.removeAt(index);
      }
    });
  }

  String formatCurrency(double amount) {
    final format =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.white),
        ),
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
              child: widget.cartItems.isNotEmpty
                  ? ListView.builder(
                      itemCount: widget.cartItems.length,
                      itemBuilder: (context, index) {
                        final item = widget.cartItems[index];
                        return ListTile(
                          leading: Image.asset(item.imagePath,
                              width: 50, height: 50),
                          title: Text(
                            item.name,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                formatCurrency(item.price),
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  // Tombol -
                                  IconButton(
                                    icon: Icon(Icons.remove),
                                    onPressed: () => decreaseQuantity(index),
                                  ),
                                  Text('${item.quantity}', style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),),
                                  // Tombol +
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () => increaseQuantity(index),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: Text(
                            formatCurrency(item.price *
                                item.quantity), // Format harga total per item
                            style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'Your cart is empty!',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),

            // Total harga dan tombol checkout
            if (widget.cartItems.isNotEmpty) ...[
              SizedBox(height: 20),
              Text(
                "Total: ${formatCurrency(getTotalPrice())}", // Format total harga
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman PaymentScreen, kirim cartItems dan totalPrice
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodScreen(
                          cartItems: widget.cartItems,
                          totalPrice: getTotalPrice(),
                        ),
                      ),
                    );
                  },
                  child: Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6C63FF),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ],
        ),
      ),
    );
  }
}
