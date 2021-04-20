import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Yuri'),
              Text('Rua Flutter top')
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('Preço produtos', style: TextStyle(fontWeight: FontWeight.w500),),
            Text('Preço total')
          ],
        )
      ],
    );
  }
}
