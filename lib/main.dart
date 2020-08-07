import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {

  AnimationController animationController;
  Animation carouselAnimation;

  @override
  void initState(){
    super.initState();

    animationController=AnimationController(duration: Duration(seconds: 15),vsync: this);
    carouselAnimation=IntTween(begin: 0,end: photos.length-1).animate(animationController);
    carouselAnimation.addListener((){
      setState(() {
        imageIndex=carouselAnimation.value;
      });
    });
    animationController.repeat();
  }

  @override
  void dispose(){
    super.dispose();
    animationController.dispose();
  }



  List<String> photos = [
    'assets/images/bourger1.jpg',
    'assets/images/bourger2.jpg',
    'assets/images/bourger3.jpg',
    'assets/images/bourger4.jpg'
  ];

  int imageIndex = 0;

  void backIM() {
    setState(() {
      imageIndex = imageIndex > 0 ? imageIndex - 1 : 0;
    });
  }

  void forwardIM() {
    setState(() {
      imageIndex = imageIndex < photos.length - 1 ? imageIndex + 1 : imageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Material(
            child: Stack(
              children: <Widget>[
                ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.width / 2.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(photos[imageIndex]),
                              fit: BoxFit.cover)),
                    ),
                  ],
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    actions: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 10, top: 10),
                        child: IconButton(
                            icon: Icon(Icons.favorite,
                                color: Colors.redAccent, size: 35),
                            onPressed: () {}),
                      ),
                    ],
                    leading: IconButton(
                        icon: Icon(Icons.arrow_back_ios, size: 35),
                        onPressed: () {}),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                  ),
                  onTap: forwardIM,
                ),
                GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width / 2,
                    color: Colors.transparent,
                  ),
                  onTap: backIM,
                ),
                Positioned(
                  top: 190,
                  left: 30,
                  bottom: 0,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                      Icon(
                        Icons.star,
                        size: 20,
                        color: Colors.deepOrange,
                      ),
                      Icon(
                        Icons.star_border,
                        size: 20,
                        color: Colors.grey,
                      ),
                      Text('  4.7',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: 25,
                      ),
                      SelectedPhto(
                        numberOfDots: photos.length,
                        photoIndex: imageIndex,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Material(
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 0, left: 20, right: 20, top: 15),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'OPEN NOW UNTIL 7 AM',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'The Cinnamon Snail',
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '17th st & Union Sq East',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          '400ft Away',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.rss_feed,
                          size: 20,
                          color: Colors.green.shade700,
                        ),
                        Text(
                          ' Location conformed by 3 users today',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.green.shade700,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'FEATURED ITEMS',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        child: ListView(
                          children: <Widget>[
                            Card(
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                  'assets/images/bourger4.jpg',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                    'assets/images/bourger1.jpg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                    'assets/images/bourger3.jpg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                    'assets/images/bourger2.jpg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                  'assets/images/bourger4.jpg',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                    'assets/images/bourger1.jpg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                    'assets/images/bourger3.jpg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 2,
                              child: ListTile(
                                title: Text(
                                  'Maple Mastard Tempeh',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Colors.black),
                                ),
                                subtitle: Text(
                                  'Maple Mastard Tempeh Maple Mastard Tempeh',
                                  style: TextStyle(fontSize: 10),
                                ),
                                leading: Image.asset(
                                    'assets/images/bourger2.jpg',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover),
                                trailing: Text(
                                  ' 8IQ',
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// SelectPhoto

class SelectedPhto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  SelectedPhto({this.numberOfDots, this.photoIndex});

  Widget _inActivePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Container(
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              color: Colors.deepOrange[300],
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 0, blurRadius: 2)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];

    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == photoIndex ? _activePhoto() : _inActivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}
