import 'package:flutter/material.dart';
import 'package:practice/src/pages/user_detail.dart';
import 'package:practice/src/providers/user_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => Scaffold(
      appBar: AppBar(
        title: Text("Contact List"),
      ),
      body: PageContent(),
    );
}

class PageContent extends StatelessWidget {
  @override
  Widget build(BuildContext context)
    => _getList();

  Widget _getList()
    => FutureBuilder(
      future: userProvider.getData(),
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot)
        => ListView(
          children: _getListContent(snapshot.data, context),
        )
    );

  List<Widget> _getListContent(List<dynamic> data, BuildContext context) {
    final List<Widget> _listContent = List<Widget>();
    data.forEach((user) {
      _listContent..add(
        ListTile(
          title: Text(user['name']),
          subtitle: Text(user['company']),
          leading: Icon(Icons.account_circle),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            final MaterialPageRoute userDetailRoute = MaterialPageRoute(
              builder: (BuildContext context) => UserDetail()
            );

            Navigator.push(context, userDetailRoute)
              .then((onBackValue){
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(onBackValue),
                    action: SnackBarAction(
                      label: "OK",
                      onPressed: () {

                      },
                    ),
                  )
                );
              });
          },
        )
      )
      ..add(Divider());
    });
    return _listContent;
  }
}