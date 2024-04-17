class Employeeresmodel {
  int? status;
  String? message;
  List<Employee>? employeeslist;

  Employeeresmodel({
    this.status,
    this.message,
    this.employeeslist,
  });

  factory Employeeresmodel.fromJson(Map<String, dynamic> json) =>
      Employeeresmodel(
        status: json["status"],
        message: json["message"],
        employeeslist: json["data"] == null
            ? []
            : List<Employee>.from(
                json["data"]!.map((x) => Employee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": employeeslist == null
            ? []
            : List<dynamic>.from(employeeslist!.map((x) => x.toJson())),
      };
}

class Employee {
  int? id;
  String? name;
  String? role;

  Employee({
    this.id,
    this.name,
    this.role,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "role": role,
      };
}
