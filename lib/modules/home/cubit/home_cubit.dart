import 'package:flutter/foundation.dart';
import 'package:interview_task/core/constants.dart';
import 'package:interview_task/modules/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interview_task/modules/home/models/EmployeeModel.dart';
import 'package:interview_task/modules/home/models/online_experts_model.dart';
import 'package:interview_task/modules/home/repositories/employee_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeCubit extends Cubit<HomeState> with EmployeeRepository {
  HomeCubit() : super(HomeInitial());

  List<OnlineExpertModel> onlineExpertList = [
    const OnlineExpertModel(name: 'Lance', image: ''),
    const OnlineExpertModel(name: 'Niles', image: ''),
    const OnlineExpertModel(name: 'Samuel', image: ''),
    const OnlineExpertModel(name: 'Hilary', image: ''),
    const OnlineExpertModel(name: 'Hanson', image: ''),
  ];
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  List<EmployeeModel> employeeList = [];

  @override
  Future<void> getEmployees() async {
    emit(HomeLoading());

    firestore.collection(employeeCollection).get().then((value) {
      value.docs.map((e) => employeeList.add(e as EmployeeModel));

    });
  }
}
