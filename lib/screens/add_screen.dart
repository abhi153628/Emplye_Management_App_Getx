import 'package:employee_registration/controller/getx/getx.dart';
import 'package:employee_registration/controller/text.dart';
import 'package:employee_registration/controller/textform.dart';
import 'package:employee_registration/modal/employee_modal.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddEmployee extends StatelessWidget {
 final EmplopyeeController controller=Get.find();
  


  AddEmployee({super.key});

  final employeeNameController = TextEditingController();
  final emploidcontroller = TextEditingController();
  final contactcontroller = TextEditingController();
  final adressController = TextEditingController();
  final numbercontroller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
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
                color: const Color.fromARGB(255, 255, 255, 255),
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
                      text: "Employee Profile",
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
                 
                  controller: employeeNameController,
                  hintText: 'Employe Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please type a Employe Name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                
                  controller: emploidcontroller,
                  hintText: 'Id',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Id';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
                
                  controller: contactcontroller,
                  hintText: 'Contact',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please give your Contact ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
         
                  controller: adressController,
                  hintText: ' Adress',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Adress ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomFormField(
              
                  controller: numbercontroller,
                  hintText: 'Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please give your Number ';
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
                      await addEmployye(context);
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

  addEmployye(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final employ = Employee(
        employeeId: employeeNameController.text.trim(),
        employeeName: employeeNameController.text.trim(),
        buisnessAddress:adressController.text.trim(),
        contactInformation: contactcontroller.text.trim(),
        number: numbercontroller.text.trim()
        

        
      );
      await controller.AddEmployee(employ);
     
    }
  }
}
