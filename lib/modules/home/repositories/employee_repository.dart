import 'package:interview_task/modules/home/models/EmployeeModel.dart';

abstract class EmployeeRepository {
  Future<void> getEmployees();
}
