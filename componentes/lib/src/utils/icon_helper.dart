import 'package:flutter/material.dart';

final Map<String, IconData> _icons = {
  'add_alert' : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open' : Icons.folder_open
};

IconData getIcon(String iconName) => _icons[iconName];