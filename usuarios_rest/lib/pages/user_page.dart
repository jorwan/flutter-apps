import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:usuarios_rest/models/user_response.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuarios'),
      ),
      body: Center(child: _getUserList()),
    );
  }

  Widget _getUserList() => FutureBuilder<List<User>>(
      future: _getUsers(),
      initialData: <User>[],
      builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) =>
          (snapshot.connectionState == ConnectionState.waiting)
              ? CircularProgressIndicator()
              : _buildUserList(snapshot.data));

  Future<List<User>> _getUsers() async {
    final response = await http
        .get('http://www.json-generator.com/api/json/get/cqCjFSXSDC?indent=2');
    return UserResponse.fromRawJson(response.body).users;
  }

  ListView _buildUserList(List<User> users) => ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) => FadeInLeft(
            delay: Duration(milliseconds: 100 * index),
            child: ListTile(
              title: Text(users[index].name),
              subtitle: Text(users[index].email),
              leading: Image.network(users[index].picture),
            ),
          ));
}
