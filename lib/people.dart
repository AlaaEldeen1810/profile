import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class People extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getDataT() async{
      var result = await http.get('https://smartfitnessgym.herokuapp.com/api/v1/getTrainers');
      print(result.statusCode);
      if (result.statusCode == 200){
        var jsonObj = json.decode(result.body);
        print(result.body);
        return jsonObj;
      }
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text('People'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black87,Colors.amberAccent])),
        child: Center(
          child:  FutureBuilder(
            future: getDataT(),
            builder: (context , snapshot){
              if (snapshot.data != null){
                print(snapshot.data);
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){
                    return Card(
                        elevation: 6,
                        child: SizedBox(
                          width: 100,
                          height: 90,
                          child: ListTile(
                            tileColor: Colors.black,
                            leading: CircleAvatar(
                              radius: 30.0,
                              backgroundImage: NetworkImage(snapshot.data[index]['photo']),
                            ),
                            title: Text(snapshot.data[index]['username'],
                            style: TextStyle(
                                color: Colors.white,
                            ),),
                            subtitle: Text(snapshot.data[index]['role'],style: TextStyle(
                              color: Colors.white,
                            ),),
                          ),
                          ),
                        );
                  },
                );

              }else{
                return CircularProgressIndicator();
              }
            },
          ),

        ),
      ),
    );
  }
}

