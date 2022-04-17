import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:kumsal_case/model/employee.dart';
import 'package:mobx/mobx.dart';
part 'employee_view_model.g.dart';

class EmployeeViewModel = _EmployeeViewModelBase with _$EmployeeViewModel;

abstract class _EmployeeViewModelBase with Store {
  @observable
  ObservableList<Employee> employee = ObservableList();

  final getUrl = 'https://reqres.in/api/users?page=1';
  final postUrl = 'https://reqres.in/api/users';
  final deleteUrl = 'https://reqres.in/api/users/2';

  @observable
  TextEditingController controller_1 = TextEditingController();
  @observable
  TextEditingController controller_2 = TextEditingController();

  @action
  Future<void> getAllEmployee() async {
    final response = await http.get(Uri.parse(getUrl));

    if (response.statusCode == 200) {
      var result = employeeDataFromJson(response.body);
      employee.addAll(result.data);
    } else {
      print(response.statusCode);
    }
  }

  @action
  Future<String> addEmployee() async {
    final request = await http.post(Uri.parse(postUrl),
        body: jsonEncode(
            {"name": "${controller_1.text}", "job": "${controller_2.text}"}));
    if (request.statusCode == 201) {
      return "Created";
    } else {
      return '${request.statusCode}';
    }
  }

  Future<String> deleteEmployee(index) async {
    final request = await http.delete(Uri.parse(deleteUrl),
        body: jsonEncode({"id": "$index"}));
    if (request.statusCode == 204) {
      return "Deleted";
    } else {
      return '${request.statusCode}';
    }
  }
}
