import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:whatsapp_redesign/src/screens/chat_screen.dart';
import 'package:whatsapp_redesign/src/widgets/user_avatar_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  List<Tab> _tabList = [
    Tab(icon: Icon(Icons.camera_alt)),
    Tab(text: 'Chat'),
    Tab(text: 'Groups'),
    Tab(text: 'Status'),
    Tab(text: 'Call'),
  ];

  List<Widget> _tabItems = [
    ChatsScreen(),
    ChatsScreen(),
    ChatsScreen(),
    ChatsScreen(),
    ChatsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabList.length,
      initialIndex: 1,
      child: Scaffold( 
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          leading: UserAvatarWidget(
            available: true,
            image: NetworkImage('https://randomuser.me/api/portraits/men/75.jpg'),
          ),
          title: Text('Hi, Kent',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          actions: <Widget>[
            Icon(Icons.search, color: Theme.of(context).primaryColor,),
            SizedBox(width: 10,),
            Icon(Icons.more_horiz, color: Theme.of(context).primaryColor,),
            SizedBox(width: 10,),
          ],
          bottom: TabBar(
            isScrollable: false,
            labelPadding: EdgeInsets.symmetric(horizontal: 10),
            labelColor: Theme.of(context).primaryColor,
            indicatorColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).disabledColor,
            labelStyle: GoogleFonts.poppins().copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),
            tabs: _tabList
          ),
        ),
        body: TabBarView(
          children: _tabItems
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.message, color: Colors.white, size: 30),
        ),
      )
    );
  }
}