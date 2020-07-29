import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Uhome.dart';
import 'profile.dart';
import 'Thsr.dart';
import 'Ttrain.dart';
import 'Tbus.dart';
import 'Tmrt.dart';


class TransportationPage extends StatefulWidget{

  @override
  _TransportationPageState createState() => _TransportationPageState();
}

class _TransportationPageState extends State<TransportationPage>{
  int _currentIndex = 1;

  final _Pages = <Widget>[
    UniversityPage(),
    TransportationPage(),
    SplashProfilePage(),
  ];

  Color _iconColor;
  bool colorSwitched = false;
  var logoImage = 'images/Train.jpg';
  List<IconData> _Icons = [
    Icons.directions_railway,
    Icons.train,
    /*Icons.directions_bus,
    Icons.directions_subway*/
  ];

  List<Color> selectionButtonsColor = [Colors.redAccent, Colors.blueAccent, Colors.indigo, Colors.greenAccent];
  List<String> selectionLabelText = ['高鐵', '火車'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.school),
            title: new Text('大學'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.directions_subway),
            title: new Text('交通'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text('個人'),
          )
        ],
      ),
      body: SafeArea(
        child: Container( //background & upper box
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  logoImage,
                  fit: BoxFit.contain,
                  height: 260.0,
                  width: MediaQuery.of(context).size.width,
                ),
                Text(
                  '大眾運輸時刻查詢',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container( //beneath box
                  height: 100.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      selectionButtons(0),
                      selectionButtons(1),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),
              ],
            ),
          ),
      ),
    );
  }
  FlatButton selectionButtons(int num){
    return FlatButton(
        onPressed: (){
          if(num == 0){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Thsr()),
            );
          }else if(num == 1){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Ttrain()),
            );
          }
        },
        child: Stack(
          children: <Widget>[
            Container(
              width: 155.0,
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.centerRight,
              child: Opacity(
                  opacity: 0.3,
                  child: Icon(
                    _Icons[num],
                    size: 60,
                    color: Colors.white,
                  )),
              decoration: BoxDecoration(
                color: selectionButtonsColor[num],
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    _Icons[num],
                    color: Colors.white,
                    size: 35.0,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    selectionLabelText[num],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0
                    ),
                  )
                ],
              ),
            )
          ],
        ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => _Pages[index],
          transitionDuration: Duration(seconds: 0),
        ),
      );
    });
  }
}















































