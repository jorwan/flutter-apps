import 'package:flutter/material.dart';

import 'package:componentes/src/providers/route_provider.dart';

import 'package:componentes/src/utils/icon_helper.dart';

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
    future: routeProvider.getRoutes(),
    initialData: [],
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) 
      => ListView(
        children: _getListItems(snapshot.data, context),
      )
  );

  List<Widget> _getListItems(List<dynamic> items, BuildContext context) {
    final List<Widget> _items = [];
    items.forEach((item) {
      _items
        ..add(
          ListTile(
            title: Text(item['title']),
            leading: Icon(getIcon(item['icon'])),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.pushNamed(context, item['route']);
            },
          )
        )
        ..add(Divider());
    });
    return _items;
  }
}