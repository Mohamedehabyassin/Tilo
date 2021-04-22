import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tilo/model/data_model.dart';

import 'package:flutter/material.dart';
import 'package:tilo/provider/details_data_provider.dart';

class DetailsScreen extends StatefulWidget {
  final Result item;

  DetailsScreen({this.item});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text("${widget.item.name}")),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.cyan[200]
        ),
        child: Column(
          children: [
            Image.network("${widget.item.images[0].url}"),
            ChangeNotifierProvider<DetailsDataProvider>(
                create: (context) =>
                    DetailsDataProvider(widget.item.defaultArticle.code),
                child: Consumer<DetailsDataProvider>(
                  builder: (ctx, _data, _) {
                    return (_data.dataItem != null)
                        ? Column(children: [
                            Text("${_data.dataItem.description}"),
                            Text("${_data.dataItem.color.text}")


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
