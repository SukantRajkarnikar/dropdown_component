import 'package:dropdown_component/bottomSheetListWidget.dart';
import 'package:dropdown_component/consts.dart';
import 'package:dropdown_component/spinner_model.dart';
import 'package:dropdown_component/widgets.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hemlo World")),
        body: const AppBody(),
      ),
    );
  }
}

class AppBody extends StatefulWidget {
  const AppBody({Key? key}) : super(key: key);

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  List<SpinnerModel> countries = [
    SpinnerModel(1, "Nepal"),
    SpinnerModel(2, "India"),
    SpinnerModel(3, "China"),
    SpinnerModel(4, "United States of America"),
    SpinnerModel(5, "United Kingdom"),
    SpinnerModel(6, "Australia"),
    SpinnerModel(7, "Nepal1"),
    SpinnerModel(8, "India1"),
    SpinnerModel(9, "China1"),
    SpinnerModel(10, "United States of America1"),
    SpinnerModel(11, "United Kingdom1"),
    SpinnerModel(12, "Australia1"),
    SpinnerModel(13, "Nepal2"),
    SpinnerModel(14, "India2"),
    SpinnerModel(15, "China2"),
    SpinnerModel(16, "United States of America2"),
    SpinnerModel(17, "United Kingdom2"),
    SpinnerModel(18, "Australia2"),
  ];

  String countrySelected = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color(0xFFF8F9FE),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Country",
                  style: text_2F3036_12_Bold_w600,
                ),
              ),
              addVerticalSpace(16),
              BottomSheetListWidget(
                context: context,
                title: "Select Country",
                modelList: countries,
                callback: (SpinnerModel country) {
                  countrySelected = country.title;
                  debugPrint("-----------------------> $countrySelected");
                },
              ),
            ],
          ),
        ));
  }
}
