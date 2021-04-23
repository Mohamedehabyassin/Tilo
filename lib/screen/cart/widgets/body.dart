import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/provider/cart_provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<CartProvider>(context);

    return (itemProvider.items.length != 0)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: itemProvider.items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(30)),
                  child: Dismissible(
                    key: Key('${itemProvider.items[index].code}'),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) => {
                      setState(() {
                        itemProvider.removeItem(itemProvider.items[index]);
                      })
                    },
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
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${itemProvider.items[index].mainCategory.name}',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                          ),
                          Text.rich(
                            TextSpan(
                                text:
                                    "\$ ${itemProvider.items[index].whitePrice.price}",
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.bold),
                                children: []),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Center(
            child: Text("No Items Added"),
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
