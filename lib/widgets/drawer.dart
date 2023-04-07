import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text('this is accout name'),
                accountEmail: Text('this is account email'),
                // currentAccountPicture: CircleAvatar(
                //   backgroundImage: NetworkImage(imageUrl),
                // ),
              )),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text(
              'Home',
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text(
              'Profile',
              textScaleFactor: 1.2,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings),
            title: Text(
              'Setting',
              textScaleFactor: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
