import 'package:flutter/material.dart';
import 'package:profile_project/diet.dart';
import 'package:profile_project/people.dart';
import 'package:profile_project/slider.dart';
import 'chartss.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home>{
  @override
  Widget build(BuildContext context) {
    getWeight() async{
      var result = await http.get('https://smartfitnessgym.herokuapp.com/api/v1/getProfileTest');
      print(result.statusCode);
      if (result.statusCode == 200){
        var jsonObj = json.decode(result.body);
        //print(result.body);
        return jsonObj['weight'];
      }
    }
    getData() async{
      var result = await http.get('https://smartfitnessgym.herokuapp.com/api/v1/getProfileTest');
     print(result.statusCode);
      if (result.statusCode == 200){
        var jsonObj = json.decode(result.body);
       //print(result.body);
        return jsonObj['profile'];
      }
    }
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
              icon: Icon(
                Icons.messenger,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.black87,Colors.amberAccent])),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Center(
                  child: Column(
                    children: [
                      FutureBuilder(
                        future: getData(),
                        builder: (context , snapshot){
                          if (snapshot.data != null){
                            print(snapshot.data);
                            return CircleAvatar(
                              radius: 50.0,
                              //backgroundColor: Colors.red,
                              backgroundImage: NetworkImage(snapshot.data['photo']),
                            );

                          }else{
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                      //Divider(height: 25.0, color: Colors.black),
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        // child: Text(
                        //   'Lorem ipsum',
                        //   style: TextStyle(
                        //     fontSize: 20.0,
                        //     fontWeight: FontWeight.bold,
                        //     color: Colors.white,
                        //   ),
                        // ),
                        child:FutureBuilder(
                          future: getData(),
                          builder: (context , snapshot){
                            if (snapshot.data != null){
                             // print(snapshot.data['weights']);
                              return Center(
                                child: Text(
                                    snapshot.data['username'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              );

                            }else{
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                      // Text(
                      //   'Weight : 65 kg \n \t \t \t \t \t \t\t 160 kg',
                      //   style: TextStyle(
                      //     fontSize: 20.0,
                      //     color: Colors.white,
                      //   ),
                      // ),
                      FutureBuilder(
                        future: getWeight(),
                        builder: (context , snapshot){
                          if (snapshot.data != null){
                            print(snapshot.data);
                            return Text(
                                'weight : ' + snapshot.data['weight'].toString(),
                              style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            );

                          }else{
                            return CircularProgressIndicator();
                          }
                        },
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: OutlineButton(
                              textColor: Colors.black,
                              // foreground
                              onPressed: () {},
                              child: Text('Update'),
                              borderSide: BorderSide(color: Colors.black),
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0)))),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: FlatButton(
                        padding:EdgeInsets.only(top: 0.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CarouselPage()));
                        },
                        child: Image.asset('assets/comparison.png',
                          height: 70.0,),
                        // Row(
                        //   children: <Widget>[
                        //    Icon(Icons.directions_walk_sharp),
                        //    Text(
                        //         "\t A comparison\n indicating yor changes every month")
                        //   ],
                        // )
                      ),
                    )],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 98.0),
                      child: FlatButton(
                          padding:EdgeInsets.only(top: 0.0),
                          onPressed: () {
                            //NumericComboLinePointChart
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => HomePage()));

                          },
                          child: Image.asset('assets/charts.png',
                            height: 70.0,
                          )
                        // Row(
                        //   children: <Widget>[
                        //     Text(" A chart shows your weight"),
                        //     Icon(Icons.insert_chart_outlined_rounded),
                        //   ],
                        // ),
                        // color: Colors.brown,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(children: [
                    Column(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Diet()));
                          },
                          child: Image.asset('assets/diet.png',
                            height: 70.0,),
                          padding: EdgeInsets.all(0.0),
                          // child: Row(
                          //   children: <Widget>[
                          //     Icon(Icons.fastfood),
                          //     Text("\t DIET PLAN \t \t \t \t \t ")
                          //   ],
                          // )),
                        )],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 42.0),
                            child: FlatButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => People()));
                              },
                              child: Image.asset('assets/people.png',
                                height: 70.0,),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                ),
              ]),
              /* Row(
                      children: [*/
            ),
          )
        // ],
      ),
    );

  }
}
