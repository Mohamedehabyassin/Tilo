import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/provider/data_provider.dart';
import 'package:tilo/screen/details_screen.dart';

class MenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Men Section")),
        backgroundColor: Colors.indigo,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: ChangeNotifierProvider<DataProvider>(
          create: (context) => DataProvider(0, 0),
          child: Consumer<DataProvider>(
            builder: (ctx, _data, _) {
              return (_data.menData.length != 0)
                  ? ListView.builder(
                  itemCount: _data.menData.length,
                  itemBuilder: (ctx, index) {
                    return GestureDetector(
                      onTap: (){

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailsScreen(item: _data.menData[index],)),
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
                                      "${_data.menData[index].images[0].url}")),
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
                                        "${_data.menData[index].name}",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text(
                                        "${_data.menData[index].whitePrice.value} EGP",
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
