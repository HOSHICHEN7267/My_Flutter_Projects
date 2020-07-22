import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Uhome.dart';
import 'Thome.dart';
import 'profile.dart';

class Uschool extends StatefulWidget {

  @override
  UschoolState createState() => UschoolState();
}

class UschoolState extends State<Uschool>{
  int _currentIndex = 0;

  final _Pages = <Widget>[
    UniversityPage(),
    TransportationPage(),
    SplashProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 75, 110, 1),
        title: Text('校名查詢'),
      ),
      body: _ListView(context),
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
    final _Universities = ["(001)國立臺灣大學", "(002)國立臺灣師範大學", "(003)國立中興大學", "(004)國立成功大學", "(005)東吳大學",
      "(006)國立政治大學", "(007)高雄醫學大學", "(008)中原大學", "(009)東海大學", "(011)國立清華大學",
      "(012)中國醫藥大學", "(013)國立交通大學", "(014)淡江大學", "(015)逢甲大學", "(016)國立中央大學",
      "(017)中國文化大學", "(018)靜宜大學", "(019)大同大學", "(020)輔仁大學", "(021)國立臺灣海洋大學",
      "(022)國立高雄師範大學", "(023)國立彰化師範大學", "(025)國立陽明大學", "(026)中山醫學大學", "(027)國立中山大學",
      "(028)國立臺北藝術大學", "(030)長庚大學", "(031)國立臺中教育大學", "(032)國立臺北教育大學", "(033)國立臺南大學",
      "(034)國立東華大學", "(035)臺北市立大學", "(036)國立屏東大學", "(038)國立臺東大學", "(039)國立體育大學",
      "(040)元智大學", "(041)國立中正大學", "(042)大葉大學", "(043)中華大學", "(044)華梵大學",
      "(045)義守大學", "(046)銘傳大學", "(047)世新大學", "(050)實踐大學", "(051)長榮大學",
      "(056)國立臺灣藝術大學", "(058)國立暨南國際大學", "(059)南華大學", "(060)國立臺灣體育運動大學",
      "(063)國立臺南藝術大學", "(065)玄奘大學", "(079)真理大學", "(099)國立臺北大學", "(100)國立嘉義大學",
      "(101)國立高雄大學", "(108)慈濟大學", "(109)臺北醫學大學", "(110)開南大學", "(111)台灣首府大學",
      "(112)康寧大學", "(113)中信金融管理學院", "(130)佛光大學", "(133)明道大學", "(134)亞洲大學",
      "(150)國立宜蘭大學", "(151)國立聯合大學", "(152)馬偕醫學院", "(153)國立金門大學", "(154)臺北基督學院"];

    return ListView.builder(
      itemCount: _Universities.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            title: Text(_Universities[index]),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => WebUschool(index: index, SchoolName: _Universities[index],),
                  transitionDuration: Duration(seconds: 0),
                ),
              );
            },
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





























