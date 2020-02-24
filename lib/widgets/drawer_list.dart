import 'package:flutter/material.dart';
import 'package:carros/pages/loginPage.dart';

class DrawerList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var url = 'http://0.gravatar.com/avatar/b5a78dcf43e642a99aed4ec83cfa36aa';

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Ronaldo Bicca"),
              accountEmail: Text("ronaldo.bicca@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("mais informações..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item 1");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => _onClickLogout(context),
              )
            ],
          ),
        ),
      );
    }
              
    _onClickLogout(BuildContext context) {
      Navigator.pop(context);
       Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
    }

}