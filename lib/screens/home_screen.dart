import 'package:employee_registration/controller/getx/getx.dart';
import 'package:employee_registration/controller/text.dart';
import 'package:employee_registration/screens/add_screen.dart';
import 'package:employee_registration/screens/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomePage extends StatelessWidget {
  final EmplopyeeController controller=Get.put<EmplopyeeController>(EmplopyeeController());
 
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
 

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(220.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              child: Container(
                color: const Color.fromARGB(255, 46, 49, 49),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 20,
              right: 20,
              child: AppBar(
                backgroundColor: const Color.fromARGB(255, 46, 49, 49),
                elevation: 0.0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Student Profile',
                      color: const Color.fromARGB(255, 255, 255, 255),
                      style: const TextStyle(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: controller.empo.isEmpty
          ? const Center(
              child: Text("No Employee details available."),
            )
          : Obx(()=>
            ListView.builder(
                itemCount: controller.empo.length,
                itemBuilder: (context, index) {
                  final employee = controller.empo[index];
                  return Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 250,
                        width: 400,
                        decoration: const BoxDecoration(
                          color: const Color.fromARGB(255, 46, 49, 49),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                        ),
                        child: ListTile(
                          subtitle: Column(
                            children: [
                              Text(
                                'Name: ${employee.employeeName}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Age: ${employee.employeeId}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Text('Cource Name: ${employee.buisnessAddress}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              Text('Email: ${employee.contactInformation}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold
                                      )),
                              Text('Admission No: ${employee.number}',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Spacer(),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    (EditPage(employee: employee))));
                                      },
                                      child: const Text('Edit')),
                                  const Spacer(),
                                  ElevatedButton(
                                      onPressed: () { showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text('Delete'),
                                          content: const Text(
                                              'Are you sure you want to delete this student?'),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Cancel')),
                                            TextButton(
                                                onPressed: () {
                                             
                                                  controller
                                                      .deletEmploye(employee);
                                                           print('deleted');
                                                  Navigator.of(context).pop();
                                                },
                                                child: const Text('Delete'))
                                          ],
                                        );
                                      },
                                    );}, child: const Text('Delete')),
                                  const Spacer(),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                     
                    ],
                  );
                },
              ),
          ), bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Add Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'College',
          ),
        ],
   
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AddEmployee()));
          
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
        elevation: 7.0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
