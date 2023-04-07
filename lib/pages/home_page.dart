import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData() async {
      final catelogJson =
          await rootBundle.loadString("assets/files/catalog.json");
      final decodeData = jsonDecode(catelogJson);
      var productsData = decodeData['products'];
      catalogModel.items = List.from(productsData)
          .map<Item>((item) => Item.fromMap(item))
          .toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (catalogModel.items != null && catalogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16),
                itemBuilder: (context, index) {
                  final item = catalogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: GridTile(
                        header: Container(
                          child: Text(
                            item.name,
                            style: TextStyle(color: Colors.black),
                          ),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(),
                        ),
                        footer: Container(
                            child: Text(
                          item.price.toString(),
                          style: TextStyle(color: Colors.black),
                        )),
                        child: Image.network(
                          item.image,
                        )),
                  );
                },
                itemCount: catalogModel.items.length,
              )
            //  ListView.builder(
            //     itemCount: catalogModel.items.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ItemWidget(
            //         item: catalogModel.items[index],
            //       );
            //     },
            //   )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
