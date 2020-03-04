import 'package:flutter/material.dart';

final Map<String, IconData> _icons = {
  'add_alert'     : Icons.add_alert,
  'accessibility' : Icons.accessibility,
  'folder_open'   : Icons.folder_open,
  'donut_large'   : Icons.donut_large,
  'input'   : Icons.input,
};

IconData getIcon(String iconName) => _icons[iconName];