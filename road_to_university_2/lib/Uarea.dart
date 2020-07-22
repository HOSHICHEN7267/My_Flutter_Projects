import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Uhome.dart';
import 'Thome.dart';
import 'profile.dart';

class Uarea extends StatefulWidget {

  @override
  UareaState createState() => UareaState();
}

class UareaState extends State<Uarea>{
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
        title: Text('地區查詢'),
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
    final _Areas = ['基隆市', '台北市', '新北市', '桃園市', '新竹市', '苗栗縣', '台中市', '彰化縣市',
      '南投縣', '嘉義縣市', '台南市', '高雄市', '屏東市', '宜蘭縣市', '花蓮縣市', '台東市', '金門縣'];

    return ListView.builder(
      itemCount: _Areas.length,
      itemBuilder: (context, index){
        return Card(
          child: ListTile(
            title: Text(_Areas[index]),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => SUarea(index: index, AreaName: _Areas[index],),
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

//SUarea----------------------------------------------------------------------------------------------------------------------------------------------------------------

class SUarea extends StatefulWidget{
  int index;
  String AreaName;
  SUarea({this.index, this.AreaName});

  SUareaState createState() => SUareaState();
}

class SUareaState extends State<SUarea>{
  int _currentIndex = 0;

  final _Pages = <Widget>[
    UniversityPage(),
    TransportationPage(),
    SplashProfilePage(),
  ];

  final AreaSchool = {
    '基隆市':['(021)國立臺灣海洋大學'],
    '台北市':['(001)國立臺灣大學', '(002)國立臺灣師範大學', '(005)東吳大學', '(006)國立政治大學', '(013)國立交通大學臺北校區',
              '(014)淡江大學臺北校區', '(017)中國文化大學', '(019)大同大學', '(025)國立陽明大學', '(028)國立臺北藝術大學',
              '(032)國立臺北教育大學', '(035)臺北市立大學', '(046)銘傳大學', '(047)世新大學', '(050)實踐大學',
              '(099)國立臺北大學臺北校區', '(109)臺北醫學大學', '(112)康寧大學'],
    '新北市':['(002)國立臺灣師範大學林口校區', '(014)淡江大學', '(020)輔仁大學', '(044)華梵大學', '(056)國立臺灣藝術大學',
              '(079)真理大學', '(099)國立臺北大學', '(152)馬偕醫學院'],
    '桃園市':['(008)中原大學', '(016)國立中央大學', '(030)長庚大學', '(039)國立體育大學', '(046)銘傳大學桃園校區', '(040)元智大學', '(110)開南大學'],
    '新竹市':['(011)國立清華大學', '(013)國立交通大學', '(043)中華大學', '(065)玄奘大學'],
    '苗栗縣':['(151)國立聯合大學'],
    '台中市':['(003)國立中興大學', '(009)東海大學', '(012)中國醫藥大學', '(015)逢甲大學', '(018)靜宜大學',
              '(026)中山醫學大學', '(031)國立臺中教育大學', '(060)國立臺灣體育運動大學', '(134)亞洲大學'],
    '彰化縣市':['(023)國立彰化師範大學', '(042)大葉大學', '(133)明道大學'],
    '南投縣':['(058)國立暨南國際大學'],
    '嘉義縣市':['(041)國立中正大學', '(059)南華大學', '(100)國立嘉義大學'],
    '台南市':['(004)國立成功大學', '(033)國立臺南大學', '(051)長榮大學', '(063)國立臺南藝術大學', '(079)真理大學臺南校區',
              '(111)台灣首府大學', '(112)康寧大學臺南校區', '(113)中信金融管理學院'],
    '高雄市':['(007)高雄醫學大學', '(022)國立高雄師範大學', '(027)國立中山大學', '(045)義守大學', '(050)實踐大學高雄校區', '(101)國立高雄大學'],
    '屏東市':['(036)國立屏東大學'],
    '宜蘭縣市':['(014)淡江大學蘭陽校區', '(130)佛光大學', '(150)國立宜蘭大學'],
    '花蓮縣市':['(034)國立東華大學', '(108)慈濟大學'],
    '台東市':['(038)國立臺東大學'],
    '金門縣':['(046)銘傳大學金門校區', '(153)國立金門大學'],
  };

  @override
  Widget build(BuildContext context) {

    List<String> SchoolList = AreaSchool[widget.AreaName];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 75, 110, 1),
        title: Text(widget.AreaName),
      ),
      body: ListView.builder(
        itemCount: SchoolList.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(SchoolList[index]),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: (){
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => WebUarea(index: index, AreaName: widget.AreaName, SchoolName: SchoolList[index],),
                    transitionDuration: Duration(seconds: 0),
                  ),
                );
              },
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
}

//WebUarea-------------------------------------------------------------------------------------------------------------------------------------------------------------------


class WebUarea extends StatefulWidget{
  int index;
  String AreaName;
  String SchoolName;
  WebUarea({this.index, this.AreaName, this.SchoolName});

  WebUareaState createState() => WebUareaState();
}

class WebUareaState extends State<WebUarea>{

  final AreaSchoolCode = {
    '基隆市':['021'],
    '台北市':['001', '002', '005', '006', '013', '014', '017', '019', '025', '028', '032', '035', '046', '047', '050', '099', '109', '112'],
    '新北市':['002', '014', '020', '044', '056', '079', '099', '152'],
    '桃園市':['008', '016', '030', '039', '046)', '040', '110'],
    '新竹市':['011', '013', '043', '065'],
    '苗栗縣':['151'],
    '台中市':['003', '009', '012', '015', '018', '026', '031', '060', '134'],
    '彰化縣市':['023', '042', '133'],
    '南投縣':['058'],
    '嘉義縣市':['041', '059', '100'],
    '台南市':['004', '033', '051', '063', '079', '111', '112', '113'],
    '高雄市':['007', '022', '027', '045', '050', '101'],
    '屏東市':['036'],
    '宜蘭縣市':['014', '130', '150'],
    '花蓮縣市':['034', '108'],
    '台東市':['038'],
    '金門縣':['046', '153'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(47, 75, 110, 1),
        title: Text(widget.SchoolName),
      ),
      body: WebView(
        initialUrl: 'https://university-tw.ldkrsi.men/caac/${AreaSchoolCode[widget.AreaName][widget.index]}/#gsc.tab=0',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}


























