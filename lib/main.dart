import 'package:flutter/material.dart';
import 'package:task/get_it.dart';
import 'package:task/task_app.dart';

void main() {
  setupServiceLocator();
  runApp(const TaskApp());
}
