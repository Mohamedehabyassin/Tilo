import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key('id'),
            direction: DismissDirection.endToStart,
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Icon(
                    Icons.delete,
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
            child: CartItemCard(),
          ),
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  CartItemCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset('assets/login.jpg'),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'some product name',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontSize: 18,
                color: Colors.grey[600],
              ),
              maxLines: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text.rich(
              TextSpan(
                  text: "\$16.00",
                  style: TextStyle(
                      color: Colors.purple, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: '    x5',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
          ],
        ),
      ],
    );
  }
}
