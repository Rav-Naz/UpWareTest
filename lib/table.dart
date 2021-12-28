import 'package:flutter/material.dart';
import 'package:up_ware_test/counter.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<TablePage> createState() => _TableState();
}

class _TableState extends State<TablePage> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
  TableRow _buildTableRow(String counter) {
    return  TableRow(
        children: <Widget> [
          const Padding(padding: EdgeInsets.all(10.0), child: Text("Kolumna 1"),),
          Padding(padding: const  EdgeInsets.all(10.0), child: Text(counter),),
          const Padding(padding: EdgeInsets.all(10.0), child: Text("Dłuuuuuuuuga Kolumna 3"),),
          const Padding(padding: EdgeInsets.all(10.0), child: Icon(Icons.table_chart_outlined, color: Colors.grey,),),
          const Padding(padding: EdgeInsets.all(10.0), child: Text("Kolumna 5"),),
          const Padding(padding: EdgeInsets.all(10.0), child: Text("Kolumna 6"),),
          const Padding(padding: EdgeInsets.all(10.0), child: Text("Dłuuuuuuuuga Kolumna 7"),),
          const Padding(padding: EdgeInsets.all(10.0), child: Icon(Icons.table_chart_outlined, color: Colors.grey,),),
        ]
    );
  }
    return Center(

      child: RawScrollbar(
        thumbColor: Colors.redAccent,
        radius: const Radius.circular(50),
        controller: _firstController,
        isAlwaysShown: true,
        thickness: 5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _firstController,
            child: StreamBuilder(
              stream: counterService.stream$,
              builder: (context, snapshot) {
                return Table(
                      border: TableBorder.all(),
                      defaultColumnWidth: const IntrinsicColumnWidth(),
                      children: <TableRow>[
                        _buildTableRow('${snapshot.data}'),
                        _buildTableRow('${snapshot.data}'),
                        _buildTableRow('${snapshot.data}'),
                        _buildTableRow('${snapshot.data}'),
                        _buildTableRow('${snapshot.data}')

                      ],
                    );
              }
            )
            ),
          ),
        ),
    );
  }
}