// ignore_for_file: unnecessary_new

import 'package:cpac/controller/driver_employee.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'change_driver.dart';
import 'loading_driver.dart';

class Change_Driver_Select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

Future<void> AlertDriver_Search(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) => MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: AlertDialog(
        actions: [
          Column(
            children: [
              Icon(
                Icons.error_outline,
                size: 50,
                color: Colors.red,
              ),
              Container(
                height: 10,
              ),
              const Text(
                'ไม่พบรายชื่อ พขร ที่ค้นหา',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  controller:
                  _controller.clear();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => Loading_Change_Driver_Select()),
                      (Route<dynamic> route) => false);
                },
                child: const Center(
                    child: Text(
                  'ตกลง',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var _controller = TextEditingController();

class _MyHomePageState extends State<MyHomePage> {
  List<String> fooList = [
    for (var i = 0; i < Driver_List_Chang.length; i++)
      Driver_List_Chang[i]['fullname'].toString(),
  ];
  List filteredList = [];
  @override
  void initState() {
    super.initState();
    filteredList = fooList;
  }

  void filter(String inputString) {
    filteredList =
        fooList.where((i) => i.toLowerCase().contains(inputString)).toList();
    setState(() {});
  }

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
                      MaterialPageRoute(builder: (context) => Loading_Driver()),
                      (route) => false);
                },
                icon: Icon(Icons.arrow_back)),
            Image.asset(
              'images/002.png',
              fit: BoxFit.cover,
              width: 250,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xff438EB9),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหารายชื่อ พขร. ',
                hintStyle: TextStyle(
                  fontSize: 14,
                ),
                suffixIcon: IconButton(
                  onPressed: _controller.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
              controller: _controller,
              onChanged: (text) {
                if (text.length <= 20) {
                  text = text.toLowerCase();
                  GetapiSearch_Driver(context, text);
                  filter(text);
                } else {
                  _controller.clear();
                }
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredList.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(filteredList[index]),
                onTap: () {
                  if (filteredList[index] !=
                      Driver_List_Chang[index]['fullname']) {
                    name = Search_Driver[index]['fullname'].toString();
                    editDriverEmployee_id = Search_Driver[index]['id'];
                    print(name);
                    Change_Driver(name, editDriverEmployee_id);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Loading_Driver_List()),
                        (Route<dynamic> route) => false);
                  } else {
                    print(Driver_List_Chang[index]['id'].toString());
                    print(Driver_List_Chang[index]['fullname']);
                    name = Driver_List_Chang[index]['fullname'];
                    editDriverEmployee_id = Driver_List_Chang[index]['id'];
                    Change_Driver(name, editDriverEmployee_id);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => Loading_Driver_List()),
                        (Route<dynamic> route) => false);
                  }

                  // name = Driver_List_Chang[index]['fullname'];
                  // editDriverEmployee_id = Driver_List_Chang[index]['id'];
                  // Change_Driver(name, editDriverEmployee_id);
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (context) => Loading_Driver_List()),
                  //     (Route<dynamic> route) => false);
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Display(
                  //       text: Driver_List_Chang[index],
                  //     ),
                  //   ),
                  // );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  final String text;

  const Display({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(text),
      ),
    );
  }
}
