import 'dart:developer';

import 'package:employee_registration/modal/employee_modal.dart';
import 'package:employee_registration/screens/add_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:hive_flutter/hive_flutter.dart';


class EmplopyeeController extends GetxController {

  List<Employee> get empo => employeRxList.toList();
  RxList <Employee> employeRxList=<Employee>[].obs;
  late Box<Employee> EmployeeBox;

  void onInit(){
    super.onInit();
   openBox();
    

  }
  Future<void>openBox()async{
      EmployeeBox = await Hive.openBox('EmployeeBox');
      loadStudent();


  }
  Future <void >loadStudent()async{
    employeRxList.assignAll(EmployeeBox.values.toList());
    EmployeeBox.watch().listen((event) => employeRxList
        .assignAll(EmployeeBox.values.toList().cast<Employee>()));


  }




  Future<void> AddEmployee(Employee employe) async {
    try {
      await EmployeeBox.add(employe);
      employeRxList.add(employe);
      log('employeead');
      Get.back();
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to add student: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> deletEmploye(Employee student) async {
    await EmployeeBox.delete(student.key);
    employeRxList.remove(student);
  }

  Future<void> updateEmploye(Employee employe,String employeeName, String employeeId, String contactInformation,
      String buisnessAddress, String number,) async {
    final index =
        employeRxList.indexWhere((element) => element.key == employe.key);

    employeRxList[index].employeeName = '';
    employeRxList[index].employeeId = employeeId;
    employeRxList[index].contactInformation = contactInformation;
    employeRxList[index].buisnessAddress = buisnessAddress;
    employeRxList[index].number = number;

    await EmployeeBox.put(employeRxList[index].key, employeRxList[index]);
  }


}
