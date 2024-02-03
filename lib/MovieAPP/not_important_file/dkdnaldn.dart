import 'package:flutter/material.dart';

class nnnn extends StatelessWidget {
  const nnnn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        elevation: 0, // Shadow
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(50),
          ),
          /////
        ),
      ),
    );
  }
}
