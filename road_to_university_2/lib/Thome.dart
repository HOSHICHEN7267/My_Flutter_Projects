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

  List<Color> _backgroundColor;
  Color _iconColor;
  Color _textColor;
  List<Color> _actionContainerColor;
  Color _borderContainer;
  bool colorSwitched = false;
  var logoImage;
  List<IconData> _Icons = [
    Icons.directions_railway,
    Icons.train,
    /*Icons.directions_bus,
    Icons.directions_subway*/
  ];

  void changeTheme() async {
    if (colorSwitched) { // dark theme
      setState(() {
        logoImage = 'images/clock.png';
        _backgroundColor = [
          Color.fromRGBO(0, 255, 255, 1),
          Color.fromRGBO(0, 238, 238, 1),
          Color.fromRGBO(0, 205, 205, 1),
          Color.fromRGBO(0, 195, 195, 1),
        ];
        _iconColor = Colors.white;
        _textColor = Color.fromRGBO(0, 255, 255, 1);
        _borderContainer = Color.fromRGBO(34, 58, 90, 0.2);
        _actionContainerColor = [
          Color.fromRGBO(191, 62, 255, 1),
          Color.fromRGBO(181, 52, 245, 1),
          Color.fromRGBO(171, 42, 235, 1),
          Color.fromRGBO(161, 52, 225, 1),
        ];
      });
    } else { // bright theme
      setState(() {
        logoImage = 'images/clock.png';
        _borderContainer = Color.fromRGBO(252, 233, 187, 1);
        _backgroundColor = [
          Color.fromRGBO(249, 249, 249, 1),
          Color.fromRGBO(232, 232, 232, 1),
          Color.fromRGBO(216, 216, 216, 1),
          Color.fromRGBO(200, 200, 200, 1),
        ];
        _iconColor = Colors.black;
        _textColor = Colors.black;
        _actionContainerColor = [
          Color.fromRGBO(0, 255, 255, 1),
          Color.fromRGBO(0, 245, 245, 1),
          Color.fromRGBO(0, 235, 235, 1),
          Color.fromRGBO(0, 225, 225, 1),
        ];
      });
    }
  }

  @override
  void initState() {
    changeTheme();
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
        child: GestureDetector(
          onLongPress: () {
            if (colorSwitched) {
              colorSwitched = false;
            } else {
              colorSwitched = true;
            }
            changeTheme();
          },
          child: Container( //background & upper box
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [0.2, 0.3, 0.5, 0.8],
                    colors: _backgroundColor)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(
                  logoImage,
                  fit: BoxFit.contain,
                  height: 100.0,
                  width: 100.0,
                ),
                Text(
                  '大眾運輸時刻查詢',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Container( //beneath box
                  height: 300.0,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  decoration: BoxDecoration(
                      color: _borderContainer,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              stops: [0.2, 0.4, 0.6, 0.8],
                              colors: _actionContainerColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 100,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    '帥哥',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 30),
                                  ),
                                  Text(
                                    '你好',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: _iconColor, fontSize: 16),
                                  ),
                                ],
                              )
                            ),
                          ),
                          Divider(
                            height: 0.5,
                            thickness: 0.5,
                            indent: 20.0,
                            endIndent: 20.0,
                            color: Colors.grey,
                          ),
                          Container(
                            height: 180.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Table(
                                  defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                  border: TableBorder.symmetric(
                                    inside: BorderSide(
                                      color: Colors.grey,
                                      style: BorderStyle.solid,
                                      width: 0.5,
                                    ),
                                  ),
                                  children: [
                                    TableRow(children: [
                                      _actionList0(0, '高鐵'),
                                      _actionList1(1, '火車'),
                                    ]),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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

  Widget _actionList0(int num, String desc) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(_Icons[num]),
            iconSize: 45.0,
            color: _iconColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Thsr()),
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor, fontSize: 15.0),
          )
        ],
      ),
    );
  }

  Widget _actionList1(int num, String desc) {
    return Container(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(_Icons[num]),
            iconSize: 45.0,
            color: _iconColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Ttrain()),
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor, fontSize: 15.0),
          )
        ],
      ),
    );
  }

  /*Widget _actionList2(int num, String desc) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(_Icons[num]),
            iconSize: 45.0,
            color: _iconColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tbus()),
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor),
          )
        ],
      ),
    );
  }

  Widget _actionList3(int num, String desc) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(_Icons[num]),
            iconSize: 45.0,
            color: _iconColor,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Tmrt()),
              );
            },
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,
            style: TextStyle(color: _iconColor),
          )
        ],
      ),
    );
  }*/
}















































