import 'package:dropdown_component/bottomSheetListWidget.dart';
import 'package:dropdown_component/consts.dart';
import 'package:dropdown_component/countryModel.dart';
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

  List<CountryModel> countries = [
    CountryModel(1, "Nepal"),
    CountryModel(2, "India"),
    CountryModel(3, "China"),
    CountryModel(4, "United States of America"),
    CountryModel(5, "United Kingdom"),
    CountryModel(6, "Australia"),
    CountryModel(7, "Nepal1"),
    CountryModel(8, "India1"),
    CountryModel(9, "China1"),
    CountryModel(10, "United States of America1"),
    CountryModel(11, "United Kingdom1"),
    CountryModel(12, "Australia1"),
    CountryModel(13, "Nepal2"),
    CountryModel(14, "India2"),
    CountryModel(15, "China2"),
    CountryModel(16, "United States of America2"),
    CountryModel(17, "United Kingdom2"),
    CountryModel(18, "Australia2"),
  ];

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
              BottomSheetListWidget(context: context, title: "Select Country", modelList: countries),
            ],
          ),
        ));
  }
}