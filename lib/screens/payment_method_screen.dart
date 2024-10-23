import 'package:ecommerce_uts/screens/order_confirmation_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_uts/screens/home_screen.dart';
import 'package:ecommerce_uts/screens/cart_screen.dart';
import 'package:intl/intl.dart';

class PaymentMethodScreen extends StatefulWidget {
  final List<Item> cartItems; // Menampung item yang di-checkout
  final double totalPrice; // Menampung total harga

  PaymentMethodScreen({required this.cartItems, required this.totalPrice});

  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  double totalPrice = 0.0;

  // Fungsi untuk memformat angka menjadi format Rupiah
  String formatCurrency(double amount) {
    final format = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return format.format(amount);
  }

  String? selectedPaymentMethod; // Menyimpan metode pembayaran yang dipilih
  String? selectedAddress; // Menyimpan alamat pengiriman yang dipilih

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method',style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF6C63FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Pilihan metode pembayaran
            ListTile(
              title: Text('CASH'),
              leading: Radio<String>(
                value: 'Cash',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('CREDIT CARD'),
              leading: Radio<String>(
                value: 'Credit Card',
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            // Pilihan alamat pengiriman
            Text(
              'Select Delivery Address',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('UBM SERPONG'),
              leading: Radio<String>(
                value: 'UBM SERPONG',
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text('UBM ANCOL'),
              leading: Radio<String>(
                value: 'UBM ANCOL',
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value;
                  });
                },
              ),
            ),
            SizedBox(height: 20),

            // Daftar barang yang di-checkout
            Text(
              'Items:',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(widget.cartItems[index].name,style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    subtitle: Text('Quantity: ${widget.cartItems[index].quantity}',style: TextStyle(fontSize: 16,)),
                    trailing: Text(
                      formatCurrency(widget.cartItems[index].price * widget.cartItems[index].quantity),
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),

            // Total harga dari kuantitas barang
            Text(
              'Total: ${formatCurrency(widget.totalPrice)}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // Tombol untuk konfirmasi pembayaran
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke layar konfirmasi order
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderConfirmationScreen(
                        paymentMethod: selectedPaymentMethod ?? 'Not Selected',
                        cartItems: widget.cartItems,
                        totalPrice: widget.totalPrice,
                        deliveryAddress: selectedAddress ?? 'Not Selected',
                      ),
                    ),
                  );
                },
                child: Text("Proceed to Pay",
                style: TextStyle(color: Colors.white),),
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
