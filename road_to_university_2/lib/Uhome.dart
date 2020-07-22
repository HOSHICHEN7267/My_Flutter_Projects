import 'package:flutter/material.dart';
import 'Uschool.dart';
import 'Umajor.dart';
import 'Uarea.dart';
import 'Ufeature.dart';
import 'Thome.dart';
import 'profile.dart';

class UniversityPage extends StatefulWidget {

  @override
  UniversityPageState createState() => UniversityPageState();
}

class UniversityPageState extends State<UniversityPage> {

  int _currentIndex = 0;

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
    Icons.school,
    Icons.library_books,
    Icons.location_on,
    Icons.assistant_photo
  ];

  void changeTheme() async {
    if (colorSwitched) {
      setState(() {
        logoImage = 'images/university.png';
        _backgroundColor = [
          Color.fromRGBO(252, 214, 0, 1),
          Color.fromRGBO(251, 207, 6, 1),
          Color.fromRGBO(250, 197, 16, 1),
          Color.fromRGBO(249, 161, 28, 1),
        ];
        _iconColor = Colors.white;
        _textColor = Color.fromRGBO(253, 211, 4, 1);
        _borderContainer = Color.fromRGBO(34, 58, 90, 0.2);
        _actionContainerColor = [
          Color.fromRGBO(47, 75, 110, 1),
          Color.fromRGBO(43, 71, 105, 1),
          Color.fromRGBO(39, 64, 97, 1),
          Color.fromRGBO(34, 58, 90, 1),
        ];
      });
    } else {
      setState(() {
        logoImage = 'images/university.png';
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
          Color.fromRGBO(255, 212, 61, 1),
          Color.fromRGBO(255, 212, 55, 1),
          Color.fromRGBO(255, 211, 48, 1),
          Color.fromRGBO(255, 211, 43, 1),
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
          child: Container(//background & upper box
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
                  '全台大學入學攻略',
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
                  child: Padding(
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
                                      _actionList0(0, '校名查詢'),
                                      _actionList2(2, '地區查詢'),
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

// botton
  Widget _actionList0(int num, String desc) {
    return Padding(
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
                MaterialPageRoute(builder: (context) => Uschool()),
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

  /*Widget _actionList1(int num, String desc) {
    return Padding(
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
                MaterialPageRoute(builder: (context) => Umajor()),
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

  Widget _actionList2(int num, String desc) {
    return Padding(
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
                MaterialPageRoute(builder: (context) => Uarea()),
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

  /*Widget _actionList3(int num, String desc) {
    return Padding(
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
                MaterialPageRoute(builder: (context) => Ufeature()),
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