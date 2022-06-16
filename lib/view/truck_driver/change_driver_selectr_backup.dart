import 'package:cpac/controller/driver_employee.dart';
import 'package:flutter/material.dart';
import 'change_driver.dart';
import 'loading_driver.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Change_Driver_Select extends StatefulWidget {
  Change_Driver_Select(String name, {Key? key}) : super(key: key);

  @override
  State<Change_Driver_Select> createState() => _Change_Driver_SelectState();
}

class _Change_Driver_SelectState extends State<Change_Driver_Select> {
  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Loading_Driver_List()),
                      (route) => false);
                },
                icon: Icon(Icons.arrow_back)),
            Text('เลือก พขรที่ต้องการเปลี่ยน')
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
      body: Container(
        child: List_Driver(),
      ),
    );
  }
}

Widget List_Driver() {
  return ListView.builder(
      itemCount: Driver_List_Chang.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Column(
            children: [
              TextButton(
                onPressed: () {
                  Change_Driver(name, editDriverEmployee_id);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Loading_Driver_List()),
                      (Route<dynamic> route) => false);

                  name = Driver_List_Chang[index]['fullname'].toString();
                  editDriverEmployee_id =
                      Driver_List_Chang[index]['id'].toString();
                  print(Driver_List_Chang[index]['id'].toString());
                },
                child: Center(
                    child: Text(
                  Driver_List_Chang[index]['fullname'].toString(),
                  style: TextStyle(color: Colors.black),
                )),
              ),
              const Divider(
                height: 2,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                color: Colors.grey,
              ),
            ],
          ),
        );
      });
}
