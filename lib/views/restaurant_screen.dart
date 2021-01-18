import 'package:flutter/material.dart';
import 'package:coronacontacts/restaurantsDataTest.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0; //first restaurant is zero

  List<Widget> itemsData = [];

  Widget _buildHeadingText(text, size) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text, 
        style: TextStyle(
          fontSize: size, 
          color: Color(0xFF0213B5), 
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  void getPostsData() {
    List<dynamic> responseList = RESTAURANT_DATA; //database
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(30), blurRadius: 6.0),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.asset(
                    "assets/images/${post["image"]}", //Restaurant photo
                    height: 125,
                    width: 125,
                    fit: BoxFit.fill,
                  )
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"], //Restaurant name
                      style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3, //rating from data bank
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          itemSize: 16,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: 5,),
                        Text(
                          '(321)',
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          )
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Text(
                      post["brand"], //Restaurant type
                      style: const TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(height: 10,),
                    //LinearProgressIndicator(
                    //value: 30,
                    //backgroundColor: Colors.amber,
                    //valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    //minHeight: 10,
                    //),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          )));
    });
    setState(() {
      itemsData = listItems;
    });
  }

  @override
  void initState() {
    super.initState();
    getPostsData();
    controller.addListener(() {
      double value = controller.offset / 119; //top item if scroll

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.all(20.0),
          height: size.height,
          child: Column(
            children: <Widget>[
              SizedBox(height: 2),
              _buildHeadingText('Restaurant List', 30.0),
              SizedBox(height: 25),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Container(
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: itemsData[index],
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
