import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getImages() async{
      var result = await http.get('https://smartfitnessgym.herokuapp.com/api/v1/getProfileTest');
      print(result.statusCode);
      if (result.statusCode == 200){
        var jsonObj = json.decode(result.body);
        //print(result.body);
        return jsonObj['images'];
      }
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text('comparison'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black87,Colors.amberAccent])),
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0,top: 50.0,right: 50.0,bottom: 50.0),
          child: Row(
            children: [
              Column(
                children: [
                  SizedBox(
                     height: 400.0,
                     width: 300.0,
                    child: FutureBuilder(
                      future: getImages(),
                      builder: (context , snapshot){
                        if (snapshot.data != null){
                          print(snapshot.data);
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index){
                              return Card(
                                  elevation: 4,
                                  child: Image.network(
                                      snapshot.data[index],
                                    fit: BoxFit.fill,

                                  ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              );
                            },
                          );

                        }else{
                          return CircularProgressIndicator();
                        }
                      },
                    ),
                    // Carousel(
                    //   // images: [
                    //   //   NetworkImage('https://res.cloudinary.com/smartfitnessgym/image/upload/v1617671445/xswa56xcshrenci366x7.jpg'),
                    //   //   NetworkImage('https://res.cloudinary.com/smartfitnessgym/image/upload/v1617671454/gcmxglmp8n7cqukl3r3w.jpg'),
                    //   //   NetworkImage('https://res.cloudinary.com/smartfitnessgym/image/upload/v1617831388/lpaklcpp0s92lg7sdjn7.jpg'),
                    //   //   NetworkImage('https://res.cloudinary.com/smartfitnessgym/image/upload/v1617831857/rdztgttjo8bk80gmgzyb.jpg'),
                    //
                    //
                    //   ],
                    //   autoplay: false,
                    //   animationDuration: Duration(milliseconds: 1000),
                    //   dotSize: 6.0,
                    //   dotSpacing: 15.0,
                    //   dotColor: Colors.lightGreenAccent,
                    //   borderRadius: true,
                    // ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:10.0),
                    child: OutlineButton(
                      onPressed:(){},
                      textColor: Colors.black,
                      child: Text('ADD NEW PHOTO'),
                      borderSide: BorderSide(color: Colors.blue),
                      shape: new RoundedRectangleBorder(
                          borderRadius:
                          new BorderRadius.circular(30.0)
                      ),

                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}