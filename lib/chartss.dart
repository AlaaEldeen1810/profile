import 'package:flutter/material.dart';
import 'Package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final Widget child;

  HomePage({Key key, this.child}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<charts.Series<Sales, int>> _seriesLineData = <charts.Series<Sales, int>>[];
  List<Sales> linesalesdata = [];
  List<Sales> linesalesdata1 = [];
  var myData ;
  int i = 0;
  int j = 0;
  _generateData()async {
   myData = await getGraph();
   if(myData !=null) {

     myData['myPerfectPath']?.forEach((e){
       if(i==0){
         linesalesdata.add(Sales(i, e));
       }else{
         linesalesdata.add(Sales(i, e));
       }
       i = i+1;

     });

  myData['myWeights'].forEach((e){

    if(j==0){
      linesalesdata1.add(Sales(j, e));

    }else{
      linesalesdata1.add(Sales(j, e));
    }

    j = j+1;
  });

  print(linesalesdata.last.salesval);
     print(linesalesdata.last.yearval);


     _seriesLineData.add(
       charts.Series(
         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
         id: 'Air Pollution',
         data: linesalesdata,
         domainFn: (Sales sales, _) => sales.yearval,
         measureFn: (Sales sales, _) => sales.salesval,
       ),
     );
     _seriesLineData.add(
       charts.Series(
         colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff212121)),
         id: 'Air Pollution',
         data: linesalesdata1,
         domainFn: (Sales sales, _) => sales.yearval,
         measureFn: (Sales sales, _) => sales.salesval,
       ),
     );
     setState(() {

     });
   }else{
     print("El lato be ylatooo");
   }
  }

  @override
  void initState() {
    super.initState();
    _generateData();
  }
  getGraph() async{
    var result = await http.get('https://smartfitnessgym.herokuapp.com/api/v1/getGrapth');
    print(result.statusCode);
    if (result.statusCode == 200){
      var jsonObj = json.decode(result.body);
      print(result.body);
      return jsonObj;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.lime,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Charts'),
      ),
      body: myData== null ? Center(child: CircularProgressIndicator(),): (linesalesdata.isEmpty && linesalesdata1.isEmpty ) ? Center(child: Text('No Elements Here'),): Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.black87, Colors.amberAccent])),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: charts.LineChart(_seriesLineData,
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: true),
                        animate: true,
                        animationDuration: Duration(seconds: 5),
                        behaviors: [
                          new charts.ChartTitle('Days',
                              behaviorPosition: charts.BehaviorPosition.bottom,
                              titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                          new charts.ChartTitle('Weight',
                              behaviorPosition: charts.BehaviorPosition.start,
                              titleOutsideJustification:
                              charts.OutsideJustification.middleDrawArea),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
