import 'package:ecommerce_uts/widgets/container_button_modal.dart';
import 'package:flutter/material.dart';

class ProductDetailsPopup extends StatelessWidget {

  final iStyle = TextStyle(
    color: Colors.black87,
    fontWeight: FontWeight.w600,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell (
      onTap: () {
        showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder:(context) => Container(
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
        ),
      );
      },
      child: ContainerButtonModel(
        containerWidth: MediaQuery.of(context).size.height / 1.5,
        itext: "Buy Now!",
        bgColor: Color(0xFF6C63FF),
    ),
    
    );
  }
}