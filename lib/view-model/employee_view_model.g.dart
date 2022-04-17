// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EmployeeViewModel on _EmployeeViewModelBase, Store {
  final _$employeeAtom = Atom(name: '_EmployeeViewModelBase.employee');

  @override
  ObservableList<Employee> get employee {
    _$employeeAtom.reportRead();
    return super.employee;
  }

  @override
  set employee(ObservableList<Employee> value) {
    _$employeeAtom.reportWrite(value, super.employee, () {
      super.employee = value;
    });
  }

  final _$controller_1Atom = Atom(name: '_EmployeeViewModelBase.controller_1');

  @override
  TextEditingController get controller_1 {
    _$controller_1Atom.reportRead();
    return super.controller_1;
  }

  @override
  set controller_1(TextEditingController value) {
    _$controller_1Atom.reportWrite(value, super.controller_1, () {
      super.controller_1 = value;
    });
  }

  final _$controller_2Atom = Atom(name: '_EmployeeViewModelBase.controller_2');

  @override
  TextEditingController get controller_2 {
    _$controller_2Atom.reportRead();
    return super.controller_2;
  }

  @override
  set controller_2(TextEditingController value) {
    _$controller_2Atom.reportWrite(value, super.controller_2, () {
      super.controller_2 = value;
    });
  }

  final _$getAllEmployeeAsyncAction =
      AsyncAction('_EmployeeViewModelBase.getAllEmployee');

  @override
  Future<void> getAllEmployee() {
    return _$getAllEmployeeAsyncAction.run(() => super.getAllEmployee());
  }

  final _$addEmployeeAsyncAction =
      AsyncAction('_EmployeeViewModelBase.addEmployee');

  @override
  Future<String> addEmployee() {
    return _$addEmployeeAsyncAction.run(() => super.addEmployee());
  }

  @override
  String toString() {
    return '''
employee: ${employee},
controller_1: ${controller_1},
controller_2: ${controller_2}
    ''';
  }
}
