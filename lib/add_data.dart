import 'package:flutter/material.dart';

List aw = [
  "Pemasukan",
  "Pengeluaran",
];

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  String val = aw.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Laporan"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DropdownButton(
              items: List.generate(
                aw.length,
                (index) => DropdownMenuItem<String>(
                  child: Text(
                    aw[index],
                  ),
                  value: aw[index],
                ),
              ),
              value: val,
              onChanged: (String? value) {
                setState(() {
                  val = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
