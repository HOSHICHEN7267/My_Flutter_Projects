import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:dio/dio.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 145),
                //height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: _ListView(context),
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
                        onPressed: () {},
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
              Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 110.0,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Text(
                          '請點擊想查詢的學校',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
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

  Widget _ListView(BuildContext context){
    final _Universities = ["國立臺灣大學", "國立臺灣師範大學", "國立中興大學", "國立成功大學", "東吳大學",
      "國立政治大學", "高雄醫學大學", "中原大學", "東海大學", "國立清華大學",
      "中國醫藥大學", "國立交通大學", "淡江大學", "逢甲大學", "國立中央大學",
      "中國文化大學", "靜宜大學", "大同大學", "輔仁大學", "國立臺灣海洋大學",
      "國立高雄師範大學", "國立彰化師範大學", "國立陽明大學", "中山醫學大學", "國立中山大學",
      "國立臺北藝術大學", "長庚大學", "國立臺中教育大學", "國立臺北教育大學", "國立臺南大學",
      "國立東華大學", "臺北市立大學", "國立屏東大學", "國立臺東大學", "國立體育大學",
      "元智大學", "國立中正大學", "大葉大學", "中華大學", "華梵大學",
      "義守大學", "銘傳大學", "世新大學", "實踐大學", "長榮大學",
      "國立臺灣藝術大學", "國立暨南國際大學", "南華大學", "國立臺灣體育運動大學",
      "國立臺南藝術大學", "玄奘大學", "真理大學", "國立臺北大學", "國立嘉義大學",
      "國立高雄大學", "慈濟大學", "臺北醫學大學", "開南大學", "台灣首府大學",
      "康寧大學", "中信金融管理學院", "佛光大學", "明道大學", "亞洲大學",
      "國立宜蘭大學", "國立聯合大學", "馬偕醫學院", "國立金門大學", "臺北基督學院"];

    final List<String> SchoolCode = ["001", "002", "003", "004", "005", "006", "007", "008", "009", "011",
      "012", "013", "014", "015", "016", "017", "018", "019", "020", "021",
      "022", "023", "025", "026", "027", "028", "030", "031", "032", "033",
      "034", "035", "036", "038", "039", "040", "041", "042", "043", "044",
      "045", "046", "047", "050", "051", "056", "058", "059", "060",
      "063", "065", "079", "099", "100", "101", "108", "109", "110", "111",
      "112", "113", "130", "133", "134", "150", "151", "152", "153", "154"];

    return ListView.builder(
      itemCount: _Universities.length,
      itemBuilder: (context, index){
        return FlatButton(
          onPressed: (){
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => WebUschool(index: index, SchoolName: _Universities[index],),
                transitionDuration: Duration(seconds: 0),
              ),
            );
          },
          child: Container(
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
                        _Universities[index],
                        style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            color: secondary,
                            size: 30,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            SchoolCode[index],
                            style: TextStyle(
                              color: primary,
                              fontSize: 20,
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





























