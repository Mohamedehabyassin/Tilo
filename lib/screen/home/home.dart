import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tilo/provider/data_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Cart',
      style: optionStyle,
    ),
    // Text(
    //   'Index 2: Wish List',
    //   style: optionStyle,
    // ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        title: Text("Home Page"),
        elevation: 0,
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: CircleAvatar(
      //           backgroundColor: Colors.indigo[100],
      //           child: Text('Hello'),
      //         ),
      //         decoration: BoxDecoration(
      //           color: Colors.indigo,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text('Cart'),
      //         leading: Icon(Icons.card_travel_rounded),
      //       ),
      //       ListTile(
      //         title: Text('Favorite'),
      //         leading: Icon(Icons.favorite),
      //       ),
      //       ListTile(
      //           title: Text('Sign out'),
      //           leading: Icon(Icons.exit_to_app_outlined),
      //           onTap: () {})
      //     ],
      //   ),
      // ),
      // body:         child: _widgetOptions.elementAt(_selectedIndex),

      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
            //Slider Container properties
            options: CarouselOptions(
              height: 220.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/menScreen');
            },
            child: Text(
              "Men Section",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Image.network(
                    "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]",
                    fit: BoxFit.cover,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Image.network(
                    "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]",
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/womenScreen');

            },
            child: Text(
              "Women Section",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Image.network(
                    "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]",
                    fit: BoxFit.cover,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Image.network(
                    "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]",
                    fit: BoxFit.cover,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('/babyScreen');

            },
            child: Text(
              "Babies Section",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Image.network(
                    "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]",
                    fit: BoxFit.cover,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width / 3,
                  margin: EdgeInsets.all(8),
                  height: 100,
                  child: Image.network(
                    "https://lp2.hm.com/hmgoepprod?set=source[/d5/3a/d53a3934a195e725b82969c4f12e987ac513a663.jpg],origin[dam],category[],type[DESCRIPTIVESTILLLIFE],res[m],hmver[2]&call=url[file:/product/style]",
                    fit: BoxFit.cover,
                  )),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Cart',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.favorite),
          //   label: 'Wish List',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        onTap: _onItemTapped,
      ),
    );
  }
}
