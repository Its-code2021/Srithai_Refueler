import 'package:flutter/material.dart';

class Cpac_Coupong extends StatefulWidget {
  Cpac_Coupong({Key? key}) : super(key: key);

  @override
  State<Cpac_Coupong> createState() => _Cpac_CoupongState();
}

class _Cpac_CoupongState extends State<Cpac_Coupong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Image.asset('images/002.png', fit: BoxFit.cover)),
        backgroundColor: const Color(0xff438EB9),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              color: const Color(0xff438EB9),
              child: const Text(
                'รายการคูปองทั้งหมด',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 10,
            ),
            List_Cpac_Coupong(),
          ],
        ),
      ),
    );
  }
}

Widget List_Cpac_Coupong() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(3),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      border: Border.all(color: Colors.grey, width: 2.0)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'เลขที่คูปอง: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '404018168$index ',
                                  style: TextStyle(
                                      color: Color(0xff0044FF),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  'เติมปั๊มนอก',
                                  style: TextStyle(
                                      color: Color(0xff0044FF),
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const Text(
                                  'จำนวนน้ำมัน: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '8$index',
                                  style: const TextStyle(
                                      color: Color(0xff0044FF),
                                      fontWeight: FontWeight.bold),
                                ),
                                const Text(
                                  ' ลิตร',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xff0044FF),
                                    ),
                                    onPressed: () {
                                      print(index);
                                      print('$index คูปอง');
                                    },
                                    child: Row(
                                      children: const [
                                        Text(
                                          'เติมน้ำมัน ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(Icons.local_gas_station)
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    ),
  );
}
