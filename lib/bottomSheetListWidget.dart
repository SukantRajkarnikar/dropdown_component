import 'package:dropdown_component/consts.dart';
import 'package:dropdown_component/spinner_model.dart';
import 'package:dropdown_component/widgets.dart';
import 'package:flutter/material.dart';

class BottomSheetListWidget extends StatefulWidget {
  final BuildContext context;
  final String title;
  final List<SpinnerModel> modelList;
  final Function callback;

  const BottomSheetListWidget(
      {Key? key,
      required this.context,
      required this.title,
      required this.modelList,
      required this.callback})
      : super(key: key);

  @override
  State<BottomSheetListWidget> createState() => _BottomSheetListWidgetState();
}

class _BottomSheetListWidgetState extends State<BottomSheetListWidget> {
  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController textFieldController = TextEditingController();

  List<dynamic> tempList = [];

  @override
  Widget build(BuildContext context) {
    return TextField(
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
        getBottomSheet(widget.title, widget.modelList);
        debugPrint("Pressed");
      },
    );
  }

  void getBottomSheet(String title, List<SpinnerModel> listItems) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        builder: (BuildContext context) {
          return StatefulBuilder(builder: (builderContext, setState) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.90,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Center(child: Text(title, style: text_2F3036_14_Bold_w400)),
                    addVerticalSpace(16),
                    TextFormField(
                      style: text_1F2024_14_Regular_w400,
                      controller: searchTextController,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsetsDirectional.only(
                              start: 12, end: 16),
                          child: Image.asset(
                            IC_SEARCH,
                            width: 8,
                            height: 8,
                            color: black_rgba_8F9098,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 16),
                        hintText: "Search",
                        hintStyle: text_8f9098_14_Normal_w400,
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 1),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(197, 198, 204, 1)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFF006FFD)),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      onChanged: (value) {
                        debugPrint(
                            "---------------------------> On changed Called");
                        setState(() {
                          debugPrint(
                              "---------------------------> set state called");
                          List searchList = [];
                          for (int i = 0; i < listItems.length; i++) {
                            String name = listItems[i].title;
                            if (name
                                .toLowerCase()
                                .contains(value.toLowerCase())) {
                              searchList.add(listItems[i]);
                            }
                          }
                          tempList = searchList;
                          debugPrint(
                              "---------------------------> ${tempList.length}");
                        });
                      },
                    ),
                    addVerticalSpace(16),
                    Expanded(
                      child: ListView.separated(
                        itemCount: ((searchTextController.text == "")
                            ? listItems.length
                            : tempList.length), // Example list items count
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              textFieldController.text =
                                  (searchTextController.text == "")
                                      ? listItems[index].title
                                      : tempList[index].title;
                              widget.callback((searchTextController.text == "")
                                  ? listItems[index]
                                  : tempList[index]);
                              searchTextController.text = "";
                              Navigator.pop(widget.context);
                            },
                            child: listItemComponent(
                                ((searchTextController.text == "")
                                        ? listItems
                                        : tempList)[index]
                                    .title),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        });
  }

  Widget listItemComponent(String text) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: text_1F2024_14_Regular_w400,
            ),
          ],
        ),
      ),
    );
  }
}
