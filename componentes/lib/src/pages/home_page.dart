import 'package:componentes/src/utils/icon_helper.dart';
import 'package:flutter/material.dart';

import 'package:componentes/src/providers/user_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes")
      ),
      body: _getLista(),
    );
  }

  Widget _getLista() => FutureBuilder(
    future: userProvider.getData(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) 
      => ListView(
        children: _getListItems(snapshot.data),
      )
  );

  List<Widget> _getListItems(List<dynamic> items) {
    final List<Widget> _items = [];
    items.forEach((item) {
      _items.add(
        ListTile(
          title: Text(item['name']),
          subtitle: Text(item['email']),
          leading: Icon(getIcon('account_circle')),
          trailing: Icon(Icons.keyboard_arrow_right),
        )
      );
      _items.add(Divider());
    });
    return _items;
  }
}