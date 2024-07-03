import 'package:hive/hive.dart';
part 'employee_modal.g.dart';
@HiveType(typeId: 0)
class Employee extends HiveObject {
  @HiveField(0)
  String employeeId;
  @HiveField(1)
  String employeeName;
  @HiveField(2)
  String buisnessAddress;
  @HiveField(3)
  String contactInformation;
  @HiveField(4)
  String number;
  Employee(
      {required this.employeeName,
      required this.buisnessAddress,
      required this.contactInformation,
      required this.employeeId,
      required this.number});
}
