import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:kumsal_case/view/employee_view.dart';

void main() async {
  runApp(const MyApp());
  var hasInternet = await InternetConnectionChecker().hasConnection;
  if (hasInternet == true) {
    return print("Connected");
  } else {
    return print("Not Connected");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kumsal Case',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: EmployeeView(),
    );
  }
}
