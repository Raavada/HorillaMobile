import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({super.key});

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<Employee