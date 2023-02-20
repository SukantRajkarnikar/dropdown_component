import 'package:dropdown_component/common_bottom_sheet_list_widget.dart';
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

  String titleSelected = "";
  TextEditingController textFieldController = TextEditingController();

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
              TextField(
                readOnly: true,
                controller: textFieldController,
                style: text_1F2024_14_Regular_w400,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  hintText: "Select Country",
                  hintStyle: text_8f9098_14_Normal_w400,
                  filled: true,
                  fillColor: const Color.fromRGBO(255, 255, 255, 1),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color.fromRGBO(197, 198, 204, 1)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF006FFD)),
                      borderRadius: BorderRadius.circular(12)),
                ),
                onTap: () {
                  getBottomSheet(context,
                    "Select Country",
                    countries,
                        (SpinnerModel selected) {
                      titleSelected = selected.title;
                      textFieldController.text= titleSelected;
                      debugPrint("-----------------------> $titleSelected");
                    },
                  );
                  debugPrint("Pressed");
                },
              ),
            ],
          ),
        ));
  }
}
