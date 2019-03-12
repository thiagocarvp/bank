import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String amount;

  const ProductCard(this.title, this.amount);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Flex(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    direction: Axis.vertical,
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 48,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            amount,
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black12,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
