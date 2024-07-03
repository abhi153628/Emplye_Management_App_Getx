import 'package:employee_registration/controller/getx/getx.dart';
import 'package:employee_registration/controller/text.dart';
import 'package:employee_registration/controller/textform.dart';
import 'package:employee_registration/modal/employee_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EditPage extends StatelessWidget {
  final EmplopyeeController controller=Get.find();
  final Employee employee;
   EditPage({super.key, required this.employee});
      final GlobalKey<FormState>formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {

    final idcontroller=TextEditingController(text: employee.employeeId);
    final nameController=TextEditingController(text: employee.employeeName);
    final adressController =TextEditingController(text:employee.buisnessAddress);
    final contactNUmber=TextEditingController(text: employee.contactInformation);
    final numberController = TextEditingController(text: employee.number);
  
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 49, 49),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              child: Container(
                color:  Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Create",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      color: Colors.black,
                    ),
                    CustomText(
                      text: "employee Profile",
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                CustomFormField(
                 
                  controller: idcontroller,
                  hintText: 'id',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please type a id';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                
                  controller: nameController,
                  hintText: 'name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                
                  controller: adressController,
                  hintText: 'adress',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please give your adress';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
         
                  controller: contactNUmber,
                  hintText: 'contact ',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact No';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
              
                  controller: numberController,
                  hintText: 'number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please give your number ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 40),
                Container(
                  height: 40,
                  width: 600,
                  color: const Color.fromARGB(0, 255, 255, 255),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                      backgroundColor: const Color.fromARGB(
                          255, 255, 255, 255), // Button background color
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Circular radius
                      ),
                    ),
                    onPressed: () async {
                      await editemployee(context,nameController.text.trim(),idcontroller.text.trim(),adressController.text.trim(),contactNUmber.text.trim(),numberController.text.trim());
                      Get.back();
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  editemployee(BuildContext context,String employeeId,String employeeName,String employeeAdress,String contactInformation,String number)async{
    if(formKey.currentState!.validate()){
      employee.employeeId=employeeId;
      employee.employeeName=employeeName;
      employee.buisnessAddress=employeeAdress;
      employee.contactInformation=contactInformation;
      employee.number=number;
      
      
    }

  }
}