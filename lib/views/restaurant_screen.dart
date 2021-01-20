import 'package:coronacontacts/models/restaurant_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:coronacontacts/views/widgets/percentage_indicator.dart';
import 'package:coronacontacts/services/api_manager.dart';


class RestaurantScreen extends StatefulWidget {
  @override
  _RestaurantScreenState createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0; //first restaurant is zero

  Future<List<RestaurantData>> _restaurantData;

  @override
  void initState() {
    super.initState();
    _restaurantData = ApiManager().fetchRestaurantData();
  }

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

  Widget _buildLoadingSpinner() {
    return CircularProgressIndicator(
      value: null,
      backgroundColor: Colors.grey,
    );
  }

  Widget _buildRestaurantCards(){
    return FutureBuilder<List<RestaurantData>>(
      future: _restaurantData, 
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return ListView.builder(
            primary: false,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              var restaurant = snapshot.data[index];
              return Container(
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
                          "assets/images/davino.png", //Restaurant photo
                          height: 125,
                          width: 125,
                          fit: BoxFit.fill,
                        )
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Text(
                            restaurant.name, //Restaurant name
                            style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              RatingBar.builder(
                                initialRating: restaurant.rating, //rating from data bank
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
                              SizedBox(width: 5),
                              Text(
                                '(321)',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                )
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            restaurant.type, //Restaurant type
                            style: const TextStyle(fontSize: 15, color: Colors.grey),
                          ),
                          SizedBox(height: 15),
                          PercentageIndicator(percentage: restaurant.percentage,),  // percentage
                          SizedBox(height: 10),
                        ],
                      ),
                    ],
                  ),
                )
              );
            }
          );
        } else {
          return _buildLoadingSpinner();
        }
      }
    );
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
                child: _buildRestaurantCards()
              ),
            ],
          ),
        ),
      ),
    );
  }
}
