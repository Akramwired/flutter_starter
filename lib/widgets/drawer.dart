import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Akramwired"), 
            accountEmail: Text('info@akramwired.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://avatars2.githubusercontent.com/u/48004814?s=400&u=cbe7da25bfc7946fd6b015c1aa63307d271084ab&v=4"
              ),
            ),
            ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Akramwired"),
            subtitle: Text("Pentester"),
            trailing: Icon(Icons.edit),
          ),
           ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("info@akramwired.com"),
            trailing: Icon(Icons.edit),
          ),
        ],
        ),
      );
  }
}