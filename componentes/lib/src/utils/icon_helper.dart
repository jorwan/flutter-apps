import 'package:flutter/material.dart';

final Map<String, IconData> _icons = {
  'account_circle' : Icons.account_circle,
  'local_movies' : Icons.local_movies
};

IconData getIcon(String iconName) => _icons[iconName];