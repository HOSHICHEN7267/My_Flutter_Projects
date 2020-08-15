import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:gsheets/gsheets.dart';
import 'Uhome.dart';
import 'Thome.dart';
import 'profile.dart';

class Uschool extends StatefulWidget {

  @override
  UschoolState createState() => UschoolState();
}

class SchoolData{
  String name;
  String num;
  String area;
  String address;

  SchoolData(this.name, this.num, this.area, this.address);
}

class UschoolState extends State<Uschool>{
  int _currentIndex = 0;

  final _Pages = <Widget>[
    UniversityPage(),
    TransportationPage(),
    SplashProfilePage(),
  ];

  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);

  Future<List<SchoolData>> getSchoolData() async{
    final url = 'https://script.google.com/macros/s/AKfycbxORWnSA3tmN8Quk6FJmVPdMVVWsHRAPyWS5qFXWjWwC6GNkH4/exec';
    var datas;

    await http.get(url).then((response){
      print(response.body);
      datas = jsonDecode(response.body);
    });

    List<SchoolData> data = new List<SchoolData>();
    for(int i = 0 ; i < datas.length ; i++){
      final now = datas[i];
      data.add(SchoolData(now[0], now[1], now[2], now[3]));
    }

    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: FutureBuilder(
        future: getSchoolData(),
        builder: (context, snap){
          if(!snap.hasData){
            print('hi');
            return Container();
          }
          List<SchoolData> schoolDatas = snap.data;
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 145),
                    //height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    child: _ListView(context, schoolDatas),
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "校名查詢",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
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

  Widget _ListView(BuildContext context, List<SchoolData> schooldatas){
    return ListView.builder(
      itemCount: schooldatas.length,
      itemBuilder: (context, index){
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          width: double.infinity,
          height: 110,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: secondary),
                  image: DecorationImage(
                    image: ExactAssetImage('images/university.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      schooldatas[index].name,
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          schooldatas[index].address,
                          style: TextStyle(
                            color: primary,
                            fontSize: 13.0,
                            letterSpacing: .3,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: secondary,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          schooldatas[index].num,
                          style: TextStyle(
                            color: primary,
                            fontSize: 13,
                            letterSpacing: .3,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class WebUschool extends StatefulWidget{
  int index;
  String SchoolName;
  WebUschool({this.index, this.SchoolName});

  WebUschoolState createState() => WebUschoolState();
}

class WebUschoolState extends State<WebUschool>{
  List<String> SchoolCode = ["001", "002", "003", "004", "005", "006", "007", "008", "009", "011",
    "012", "013", "014", "015", "016", "017", "018", "019", "020", "021",
    "022", "023", "025", "026", "027", "028", "030", "031", "032", "033",
    "034", "035", "036", "038", "039", "040", "041", "042", "043", "044",
    "045", "046", "047", "050", "051", "056", "058", "059", "060",
    "063", "065", "079", "099", "100", "101", "108", "109", "110", "111",
    "112", "113", "130", "133", "134", "150", "151", "152", "153", "154"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 75, 110, 1),
        title: Text(widget.SchoolName),
      ),
      body: WebView(
        initialUrl: 'https://university-tw.ldkrsi.men/caac/${SchoolCode[widget.index]}/#gsc.tab=0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}