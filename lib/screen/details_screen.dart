import 'dart:ui';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tilo/model/data_model.dart';

import 'package:flutter/material.dart';
import 'package:tilo/provider/cart_provider.dart';
import 'package:tilo/provider/details_data_provider.dart';
import 'package:tilo/screen/cart/cart_screen.dart';

class DetailsScreen extends StatefulWidget {
  final Result item;

  DetailsScreen({this.item});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text("${widget.item.name}")),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartScreen()),
                );
              },
              child: Icon(Icons.card_travel))
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Colors.cyan[200]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network("${widget.item.images[0].url}"),
            ChangeNotifierProvider<DetailsDataProvider>(
                create: (_) =>
                    DetailsDataProvider(widget.item.defaultArticle.code),
                child: Consumer<DetailsDataProvider>(
                  builder: (ctx, _data, _) {
                    return (_data.dataItem != null)
                        ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${_data.dataItem.description}"),
                          Text("${_data.dataItem.color.text}"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.card_travel,
                                    color: Colors.indigo[900],
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    print("Item Added to Cart");
                                    itemProvider.addItem(_data.dataItem);

                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.indigo[900],
                                    size: 30,
                                  ),
                                  onPressed: () {}),
                              IconButton(
                                  icon: Icon(
                                    EvaIcons.gift,
                                    color: Colors.indigo[900],
                                    size: 30,
                                  ),
                                  onPressed: () {})

                            ],
                          )
                        ])
                        : Center(child: CircularProgressIndicator());
                  },
                )),
          ],
        ),
      ),
    );
  }
}
