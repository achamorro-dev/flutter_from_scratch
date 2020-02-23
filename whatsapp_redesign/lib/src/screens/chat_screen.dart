import 'package:flutter/material.dart';
import 'package:whatsapp_redesign/src/models/user_model.dart';
import 'package:whatsapp_redesign/src/providers/users_provider.dart';
import 'package:whatsapp_redesign/src/widgets/chat_list_view_item_widget.dart';
import 'package:whatsapp_redesign/src/widgets/user_add_status_widget.dart';
import 'package:whatsapp_redesign/src/widgets/user_status_avatar_widget.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({Key key}) : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {

  List<User> users;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  _getUsers() async {
    print('hola');
    users = await UsersProvider.getUsers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return isLoading ?
      Center(
        child: CircularProgressIndicator()
      ) :
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10,),
            child: Container(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _getUserStatuses()
              ),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView(
              children: _getUserChats()
            ),
          ),
        ],
      );
  }

  List<Widget> _getUserStatuses() {
    List<Widget> result = new List();

    result.add(
      UserAddStatusWidget(pictureUrl: 'https://randomuser.me/api/portraits/men/75.jpg',)
    );
    
    result.addAll(
      users
      .where((user) => user.hasStatus)
      .map<Widget>((user) => UserStatusAvatarWidget(user: user, size: 80))  
    );

    return result;
  }

  List<Widget> _getUserChats() {
    return users.map((user) =>
      ChatListViewItem(user: user)
    ).toList();
  }
}