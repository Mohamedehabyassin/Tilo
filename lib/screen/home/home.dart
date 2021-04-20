import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/provider/data_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Home Page"),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: CircleAvatar(
                backgroundColor: Colors.indigo[100],
                child: Text('Hello'),
              ),
              decoration: BoxDecoration(
                color: Colors.indigo,
              ),
            ),
            ListTile(
              title: Text('Cart'),
              leading: Icon(Icons.card_travel_rounded),
            ),
            ListTile(
              title: Text('Favorite'),
              leading: Icon(Icons.favorite),
            ),
            ListTile(
                title: Text('Sign out'),
                leading: Icon(Icons.exit_to_app_outlined),
                onTap: () {})
          ],
        ),
      ),
      //
      // body: ListView(
      //   children: [
      //     CarouselSlider(
      //       items: [
      //         //1st Image of Slider
      //         Container(
      //           margin: EdgeInsets.all(6.0),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8.0),
      //             image: DecorationImage(
      //               image: NetworkImage("https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //
      //         //2nd Image of Slider
      //         Container(
      //           margin: EdgeInsets.all(6.0),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8.0),
      //             image: DecorationImage(
      //               image: NetworkImage("https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //
      //         //3rd Image of Slider
      //         Container(
      //           margin: EdgeInsets.all(6.0),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8.0),
      //             image: DecorationImage(
      //               image: NetworkImage("https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //
      //         //4th Image of Slider
      //         Container(
      //           margin: EdgeInsets.all(6.0),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8.0),
      //             image: DecorationImage(
      //               image: NetworkImage("https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //
      //         //5th Image of Slider
      //         Container(
      //           margin: EdgeInsets.all(6.0),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(8.0),
      //             image: DecorationImage(
      //               image: NetworkImage("https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //
      //       ],
      //
      //       //Slider Container properties
      //       options: CarouselOptions(
      //         height: 180.0,
      //         enlargeCenterPage: true,
      //         autoPlay: true,
      //         aspectRatio: 16 / 9,
      //         autoPlayCurve: Curves.fastOutSlowIn,
      //         enableInfiniteScroll: true,
      //         autoPlayAnimationDuration: Duration(milliseconds: 800),
      //         viewportFraction: 0.8,
      //       ),
      //     ),
      //   ],
      // ),
      body: ChangeNotifierProvider<DataProvider>(
          create: (context) => DataProvider(1, 0),
          child: Consumer<DataProvider>(
            builder: (ctx, _data, _) {
              return (_data.data != null)
                  ? ListView.builder(
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    return Container(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.all(8),
                        color: Colors.indigo,
                        child: Image.network(
                            "${_data.data[index].images[0].url}"));
                  })
                  : CircularProgressIndicator();
            },
          )),
    );
  }
}
