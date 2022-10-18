import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:pharmacy_app/utils/images.dart';

import '../models/drags/drags_model.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Future<List<Drugs?>?>? getResult;

  Future<List<Drugs?>?>? getData() async {
    String url = "https://pharmacy-app-management.herokuapp.com/api/drugs";

    Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body) as List;

      List<Drugs> drugs = json.map((e) => Drugs.fromJson(e)).toList();
      return drugs;
    }

    return List.empty();
  }

  @override
  void initState() {
    super.initState();
    getResult = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "All products",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<Drugs?>?>(
          future: getResult,
          builder:
              (BuildContext context, AsyncSnapshot<List<Drugs?>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              List<Drugs?>? drugs = snapshot.data;
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      height: 900,
                      margin: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: drugs?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Column(
                                children: [
                                  Container(
                                      width: double.infinity,
                                      height: 100,
                                      child: Image.network(
                                          drugs?[index]?.imageUrl ??
                                              myImages.logo_image)),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(drugs?[index]?.name ?? "NO",
                                            style: TextStyle(fontSize: 16)),
                                        Text(
                                          drugs?[index]?.price.toString() ?? "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
