import 'package:flutter/material.dart';
import 'package:up_ware_test/table.dart';
import 'package:up_ware_test/barcode_scanner.dart';
import 'package:up_ware_test/barcode_generator.dart';
import 'package:up_ware_test/image.dart';
import 'package:up_ware_test/notifications.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.table_chart_outlined)),
                Tab(icon: Icon(Icons.qr_code)),
                Tab(icon: Icon(Icons.qr_code_2)),
                Tab(icon: Icon(Icons.camera)),
                Tab(icon: Icon(Icons.notification_add)),
              ],
            ),
            title: const Text('UpWare test'),
          ),
          body: const TabBarView(
            children: [
              TablePage(),
              BarcodeScannerPage(),
              BarcodeGeneratorPage(),
              ImagePickerPage(),
              NotificationsPage()
            ],
          ),
        ),
      ),
    );
  }
}
