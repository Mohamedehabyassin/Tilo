import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/provider/wishlist_provider.dart';

class WishlistScreen extends StatefulWidget {
  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    final itemWishListProvider = Provider.of<WishlistProvider>(context);
    return Scaffold(
      body: (itemWishListProvider.items.length != 0)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: itemWishListProvider.items.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(30)),
                    child: Dismissible(
                      key: Key('${itemWishListProvider.items[index].code}'),
                      direction: DismissDirection.endToStart,

                      onDismissed: (direction) => {
                      setState(() {
                      itemWishListProvider.removeItem(itemWishListProvider.items[index]);
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${itemWishListProvider.items[index].mainCategory.name}',
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
                                      text:
                                          "\$ ${itemWishListProvider.items[index].whitePrice.price}",
                                      style: TextStyle(
                                          color: Colors.purple,
                                          fontWeight: FontWeight.bold),
                                      children: []),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                GestureDetector(
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.purple,
                                    size: 30,
                                  ),
                                  onTap: () {
                                    Navigator.of(context).pushNamed('/CartScreen');
                                  },
                                ),
                              ],
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
            ),
    );
  }
}
