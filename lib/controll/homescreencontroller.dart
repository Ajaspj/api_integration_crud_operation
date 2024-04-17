import 'dart:convert';

import 'package:api_integration_crud_operation/model/employeeres_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  bool isloading = false;
  String baseurl = "http://3.93.46.140";
  List<Employee>? employeeslist = [];

  Future getEmployee() async {
    isloading = true;
    notifyListeners();

    Uri url = Uri.parse(baseurl + "/employees/");

    var res = await http.get(url);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      var decodedata = jsonDecode(res.body);
      Employeeresmodel resmodel = Employeeresmodel.fromJson(decodedata);
      employeeslist = resmodel.employeeslist ?? [];
    }
    isloading = false;
    notifyListeners();
  }

  Future Deleteemployee(var id) async {
    isloading = true;
    notifyListeners();

    Uri url = Uri.parse(baseurl + "/employees/$id/");

    var res = await http.delete(url);

    if (res.statusCode >= 200 && res.statusCode < 300) {
      await getEmployee();
    }
    isloading = false;
    notifyListeners();
  }

  Future Addemployee(var id) async {
    isloading = true;
    notifyListeners();

    Uri url = Uri.parse(baseurl + "/employees/create/");

    var res = await http.post(url, body: {"name": "sdd", "role": "flutter"});

    if (res.statusCode >= 200 && res.statusCode < 300) {
      await getEmployee();
    }
    isloading = false;
    notifyListeners();
  }
}
