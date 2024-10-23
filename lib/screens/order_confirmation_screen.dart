import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:ecommerce_uts/screens/order_success_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import untuk memformat Rupiah

class OrderConfirmationScreen extends StatelessWidget {
  final String paymentMethod; // Metode pembayaran
  final List<Item> cartItems; // Daftar item
  final double totalPrice; // Total harga
  final String deliveryAddress; // Alamat pengiriman

  OrderConfirmationScreen({
    required this.paymentMethod,
    required this.cartItems,
    required this.totalPrice,
    required this.deliveryAddress,
  });

  // Fungsi untuk memformat angka menjadi format Rupiah
  String formatCurrency(double amount) {
    final format =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Order Confirmation', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFF6C63FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Method',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.payment, color: Color(0xFF6C63FF),),
                Text(
                  ' $paymentMethod',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Delivery Address',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.local_shipping, color: Color(0xFF6C63FF),),
                Text(
                  ' $deliveryAddress',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Daftar item
            Text(
              'Items:',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item.name,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700)),
                    subtitle: Text('Quantity: ${item.quantity}',style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500)),
                    trailing: Text(
                      formatCurrency(item.price *
                          item.quantity), // Format harga total per item
                      style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),

            // Total harga dari kuantitas barang
            Text(
              'Total: ${formatCurrency(totalPrice)}', // Format total harga
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Tombol untuk membuat pesanan
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderSuccessScreen(),
                    ),
                  );
                },
                child: Text(
                  "Create Order",
                  style: TextStyle(color: Colors.white),
                ),
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
