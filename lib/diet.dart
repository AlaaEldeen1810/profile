import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getDataDiet() async{
      var result = await http.get('https://smartfitnessgym.herokuapp.com/api/v1/getDiet');
      print(result.statusCode);
      if (result.statusCode == 200){
        var jsonObj = json.decode(result.body);
        print(result.body);
        return jsonObj['system'];
      }
    }
    return Scaffold(
      appBar: new AppBar(
        title: Text('Diet Plan'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black87, Colors.amberAccent])),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: getDataDiet(),
                builder: (context , snapshot){
                  if (snapshot.data != null){
                    // print(snapshot.data['weights']);
                    return Table(
                      border: TableBorder.all(color: Colors.yellow),
                      children: [
                        TableRow(children: [
                          Container(
                            height: 30.0,
                            width: 30.0,
                            color: Colors.black,
                          ),
                          Container(
                            height: 30.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                                  '8 AM',
                                  style: TextStyle(
                                      color: Colors.yellow, fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: 30.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                                  '11 AM',
                                  style: TextStyle(
                                      color: Colors.yellow, fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: 30.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                                  '3 PM',
                                  style: TextStyle(
                                      color: Colors.yellow, fontWeight: FontWeight.bold,fontSize: 12.0),
                                )),
                          ),
                          Container(
                            height: 30.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                                  '5 PM',
                                  style: TextStyle(
                                      color: Colors.yellow, fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: 30.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(
                                child: Text(
                                  '7 PM',
                                  style: TextStyle(
                                      color: Colors.yellow, fontWeight: FontWeight.bold),
                                )),
                          ),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(child: Text('saturday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                          ),
                          Container(
                            height: 100.0,
                            width: 100.0,
                            child: Center(child: Text(snapshot.data[0],style: TextStyle(fontWeight: FontWeight.bold),)),
                          ),
                          Container(height: 100.0,width:100.0,child: Center(child: Text(snapshot.data[1],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 100.0,width:100.0,child: Center(child: Text(snapshot.data[2],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 100.0,width:100.0,child: Center(child: Text(snapshot.data[3],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),)),),
                          Container(height: 100.0,width:100.0,
                            child: Center(child: Text(snapshot.data[4],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(child: Text('sunday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                          ),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[5],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[6],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[7],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[8],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[9],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(child: Text('Monday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                          ),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[10],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[11],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[12],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[13],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[14],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(child: Text('Tuesday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                          ),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[15],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[16],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[17],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[18],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[19],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(child: Text('Wednesday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                          ),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[20],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[21],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[22],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[23],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[24],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),
                        TableRow(children: [
                          Center(
                            child: Container(
                              height: 100.0,
                              width: 100.0,
                              color: Colors.black,
                              child: Center(child: Text('Thursday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                            ),
                          ),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[25],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[26],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[27],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[28],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,child: Center(child: Text(snapshot.data[29],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),
                        TableRow(children: [
                          Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.black,
                            child: Center(child: Text('Friday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
                          ),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[30],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[31],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[32],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[33],style: TextStyle(fontWeight: FontWeight.bold),)),),
                          Container(height: 50.0,width: 100.0,child: Center(child: Text(snapshot.data[34],style: TextStyle(fontWeight: FontWeight.bold),)),),
                        ]),

                      ],
                    );

                  }else{
                    return CircularProgressIndicator();
                  }
                },
              ),
              // child: Table(
              //   border: TableBorder.all(color: Colors.yellow),
              //   children: [
              //     TableRow(children: [
              //       Container(
              //         height: 30.0,
              //         width: 30.0,
              //         color: Colors.black,
              //       ),
              //       Container(
              //         height: 30.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(
              //             child: Text(
              //               '8 AM',
              //               style: TextStyle(
              //                   color: Colors.yellow, fontWeight: FontWeight.bold),
              //             )),
              //       ),
              //       Container(
              //         height: 30.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(
              //             child: Text(
              //               '11 AM',
              //               style: TextStyle(
              //                   color: Colors.yellow, fontWeight: FontWeight.bold),
              //             )),
              //       ),
              //       Container(
              //         height: 30.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(
              //             child: Text(
              //               '3 PM',
              //               style: TextStyle(
              //                   color: Colors.yellow, fontWeight: FontWeight.bold,fontSize: 12.0),
              //             )),
              //       ),
              //       Container(
              //         height: 30.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(
              //             child: Text(
              //               '5 PM',
              //               style: TextStyle(
              //                   color: Colors.yellow, fontWeight: FontWeight.bold),
              //             )),
              //       ),
              //       Container(
              //         height: 30.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(
              //             child: Text(
              //               '7 PM',
              //               style: TextStyle(
              //                   color: Colors.yellow, fontWeight: FontWeight.bold),
              //             )),
              //       ),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(child: Text('saturday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //       ),
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         child: Center(child: Text('honey',style: TextStyle(fontWeight: FontWeight.bold),)),
              //       ),
              //       Container(height: 100.0,width:100.0,child: Center(child: Text('cheese',style: TextStyle(fontWeight: FontWeight.bold),)),),
              //       Container(height: 100.0,width:100.0,child: Center(child: Text('nuts',style: TextStyle(fontWeight: FontWeight.bold),)),),
              //       Container(height: 100.0,width:100.0,child: Center(child: Text('chicken',style: TextStyle(fontWeight: FontWeight.bold),)),),
              //       Container(height: 100.0,width:100.0,
              //         child: Center(child: Text('fasting',style: TextStyle(fontWeight: FontWeight.bold),)),),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(child: Text('sunday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //       ),
              //       Container(height: 50.0,),
              //       Container(height: 50.0),
              //       Container(height: 50.0),
              //       Container(height: 50.0,),
              //       Container(height: 50.0,),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(child: Text('Monday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //       ),
              //       Container(height: 50.0),
              //       Container(height: 50.0),
              //       Container(height: 50.0),
              //       Container(height: 50.0,),
              //       Container(height: 50.0,),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(child: Text('Tuesday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //       ),
              //       Container(height: 50.0),
              //       Container(height: 50.0),
              //       Container(height: 50.0,),
              //       Container(height: 50.0),
              //       Container(height: 50.0,),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(child: Text('Wednesday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //       ),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //     ]),
              //     TableRow(children: [
              //       Center(
              //         child: Container(
              //           height: 100.0,
              //           width: 100.0,
              //           color: Colors.black,
              //           child: Center(child: Text('Thursday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //         ),
              //       ),
              //       Container(height: 50.0,),
              //       Container(height: 50.0,),
              //       Container(height: 50.0,),
              //       Container(height: 50.0,),
              //       Container(height: 50.0,),
              //     ]),
              //     TableRow(children: [
              //       Container(
              //         height: 100.0,
              //         width: 100.0,
              //         color: Colors.black,
              //         child: Center(child: Text('Friday', style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.bold,fontSize: 12.0),)),
              //       ),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //       Container(height: 50.0,width: 100.0,),
              //     ]),
              //
              //   ],
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
