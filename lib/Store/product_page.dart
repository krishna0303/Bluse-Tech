import 'package:bluse/Widgets/customAppBar.dart';
import 'package:bluse/Widgets/myDrawer.dart';
import 'package:bluse/Models/item.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bluse/Store/storehome.dart';

class ProductPage extends StatefulWidget {
  final ItemModel itemModel;
  ProductPage({this.itemModel});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantityOfItems = 1;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //     Stack(
                  //       children: [
                  //     CarouselSlider(
                  //       items: [
                  //         //1st Image of Slider
                  //         Container(
                  //           margin: EdgeInsets.all(6.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             image: DecorationImage(
                  //               image: NetworkImage(widget.itemModel.thumbnailUrl),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),

                  //         //2nd Image of Slider
                  //         Container(
                  //           margin: EdgeInsets.all(6.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             image: DecorationImage(
                  //               image: NetworkImage(widget.itemModel.thumbnailUrl),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),

                  //         //3rd Image of Slider
                  //         Container(
                  //           margin: EdgeInsets.all(6.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             image: DecorationImage(
                  //               image: NetworkImage(widget.itemModel.thumbnailUrl),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),

                  //         //4th Image of Slider
                  //         Container(
                  //           margin: EdgeInsets.all(6.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             image: DecorationImage(
                  //               image: NetworkImage(widget.itemModel.thumbnailUrl),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),

                  //         //5th Image of Slider
                  //         Container(
                  //           margin: EdgeInsets.all(6.0),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(8.0),
                  //             image: DecorationImage(
                  //               image: NetworkImage(widget.itemModel.thumbnailUrl),
                  //               fit: BoxFit.cover,
                  //             ),
                  //           ),
                  //         ),
                  //       ],

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
                  //       ]
                  // ),
                  CarouselSlider(
                    items: [
                      Stack(
                        children: [
                          Center(
                            child: Image.network(widget.itemModel.thumbnailUrl),
                          ),
                          Container(
                            color: Colors.grey[300],
                            child: SizedBox(
                              height: 1.0,
                              width: double.infinity,
                            ),
                          ),
                        ],
                      ),
                    ],
                    options: CarouselOptions(
                      height: 300.0,
                      enlargeCenterPage: true,
                      autoPlay: false,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      viewportFraction: 0.8,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.itemModel.title,
                            style: boldTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            widget.itemModel.longDescription,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "₹" + widget.itemModel.price.toString(),
                            style: boldTextStyle,
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: InkWell(
                        onTap: () => checkItemInCart(
                            widget.itemModel.shortInfo, context),
                        child: Container(
                          decoration: new BoxDecoration(
                            gradient: new LinearGradient(
                              colors: [Colors.black, Colors.black],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 0.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width - 40.0,
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Add to Cart for Sew",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
const largeTextStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 20);
