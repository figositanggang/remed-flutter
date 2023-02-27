import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:remed_sem5/add_data.dart';
import 'package:remed_sem5/firebase_auth_helper.dart';
import 'package:remed_sem5/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthHelper authHelper = AuthHelper();
  Map<String, double> data = {
    "aw": 1,
    'wa': 2,
  };

  List data2 = [
    {
      "Judul": "aw",
    },
  ];

  int? value = 1;
  List _text = ["Pemasukan", "Pengeluaran", "Semua"];

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Aplikasi Pencatatan Keuangan"),
          actions: [
            IconButton(
              onPressed: () {
                authHelper.signOut();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.logout),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 50),
                child: PieChart(
                  dataMap: data,
                  chartType: ChartType.ring,
                  ringStrokeWidth: 80,
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.5,
                child: Column(
                  children: [
                    TextFormField(
                      controller: search,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                      ),
                    ),
                    Wrap(
                      spacing: 5,
                      children: List.generate(
                        3,
                        (index) => ChoiceChip(
                          label: Text(_text[index]),
                          selected: value == index,
                          onSelected: (selected) {
                            setState(() {
                              value = selected ? index : null;
                            });
                          },
                          selectedColor: Colors.blue,
                          disabledColor: Colors.black.withOpacity(.1),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Column(
                          children: List.generate(
                            data2.length,
                            (index) => ListTile(
                              title: Text(data2[index]["Judul"]),
                              trailing: Icon(Icons.warning_sharp),
                            ),
                          ),
                        ),
                        Divider(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddDataScreen(),
            ));
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
