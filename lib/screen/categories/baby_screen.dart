import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/provider/data_provider.dart';
import 'package:tilo/screen/details_screen.dart';

class BabyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.indigo,
        title: Center(child: Text("Babies Section")),
      ),
      body: ChangeNotifierProvider<DataProvider>(
          create: (context) => DataProvider(2, 0),
          child: Consumer<DataProvider>(
            builder: (ctx, _data, _) {
              return (_data.babyData.length != 0)
                  ? ListView.builder(
                      itemCount: _data.babyData.length,
                      itemBuilder: (ctx, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailsScreen(item: _data.babyData[index],)),
                            );
                          },
                          child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[200],
                              ),
                              margin: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 2,
                                      child: Image.network(
                                          "${_data.babyData[index].images[0].url}")),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${_data.babyData[index].name}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Text(
                                            "${_data.babyData[index].whitePrice.value} EGP",
                                            style: TextStyle(
                                                color: Colors.red, fontSize: 17),
                                          ),
                                          SizedBox(
                                            height: 40,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.favorite_border)
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              )),
                        );
                      })
                  : Center(child: CircularProgressIndicator());
            },
          )),
    );
  }
}
