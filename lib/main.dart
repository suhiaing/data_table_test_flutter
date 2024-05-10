import 'package:flutter/material.dart';
import 'package:table_test/constants.dart';

/// Flutter code sample for [DataTable].

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('DataTable Sample')),
        body: const DataTableExample(),
      ),
    );
  }
}

class DataTableExample extends StatefulWidget {
  const DataTableExample({super.key});

  @override
  State<DataTableExample> createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  List<String> labelList = [];
  @override
  Widget build(BuildContext context) {
    List<dynamic> constant = constants;
    List<Map> firstDate = constant[0]["data"];
    int lengthOfDate = (firstDate.length) + 1;

    return DataTable(
      columns: List.generate(
        lengthOfDate,
        (index) {
          int currentIndexMinusOne = index - 1;
          String currentDate = '';
          if (index == 0) {
            currentDate = "Habbit Name";
          } else {
            currentDate = firstDate[currentIndexMinusOne]["date"];
            setState(() {
              labelList.add(currentDate);
            });
          }

          return DataColumn(
            label: Expanded(
              child: Text(
                currentDate,
              ),
            ),
          );
        },
      ),
      rows: List.generate(constants.length, (index) {
        Map<String, dynamic> currentData = constants[index];
        String habbitName = currentData["habbitName"];

        return DataRow(
          cells: <DataCell>[
            DataCell(Text(habbitName)),
            for (int i = 0; i < currentData["data"].length; i++)
              DataCell(Text(currentData["data"][i]["date"] == labelList[i]
                  ? "${currentData["data"][i]["done"]}"
                  : "error")),
          ],
        );
      }),
    );
  }
}
