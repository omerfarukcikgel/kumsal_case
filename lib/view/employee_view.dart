import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../view-model/employee_view_model.dart';

class EmployeeView extends StatelessWidget {
  EmployeeView({Key? key}) : super(key: key);

  final _viewModel = EmployeeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) {
          return Text("Employee (${_viewModel.employee.length})");
        }),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: FutureBuilder(
                    future: _viewModel.getAllEmployee(),
                    builder: (context, snapshot) {
                      return Observer(builder: (_) {
                        return ListView.builder(
                            itemCount: _viewModel.employee.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title:
                                    Text(_viewModel.employee[index].firstName),
                                subtitle: Text(_viewModel.employee[index].email
                                    .toString()),
                                trailing: IconButton(
                                    onPressed: () {
                                      _viewModel.deleteEmployee(index);
                                      _viewModel.deleteEmployee(index).then(
                                          (value) =>
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content: Text(value),
                                              )));
                                    },
                                    icon: const Icon(Icons.delete)),
                              );
                            });
                      });
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add Employee"),
                  actions: [
                    Card(
                      elevation: 5,
                      child: TextField(
                        controller: _viewModel.controller_1,
                      ),
                    ),
                    Card(
                      elevation: 5,
                      child: TextField(
                        controller: _viewModel.controller_2,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _viewModel.addEmployee();
                          Navigator.pop(context);
                          _viewModel.addEmployee().then((value) =>
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(value),
                              )));
                        },
                        child: const Text("Add"))
                  ],
                );
              });
          _viewModel.controller_1.clear();
          _viewModel.controller_2.clear();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
