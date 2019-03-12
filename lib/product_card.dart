import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String amount;

  const ProductCard(this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Center(
                  child: Text("R\$ " + amount,
                      style: TextStyle(
                        fontSize: 32,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
