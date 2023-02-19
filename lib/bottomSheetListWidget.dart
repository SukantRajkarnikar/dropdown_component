import 'package:dropdown_component/consts.dart';
import 'package:dropdown_component/countryModel.dart';
import 'package:dropdown_component/widgets.dart';
import 'package:flutter/material.dart';

class BottomSheetListWidget extends StatefulWidget {
  final BuildContext context;
  final String title;
  final List<CountryModel> modelList;

  const BottomSheetListWidget(
      {Key? key,
      required this.context,
      required this.title,
      required this.modelList})
      : super(key: key);

  @override
  State<BottomSheetListWidget> createState() => _BottomSheetListWidgetState();
}

class _BottomSheetListWidgetState extends State<BottomSheetListWidget> {
  final TextEditingController searchTextController = TextEditingController();
  List<dynamic> tempList = [];

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: true,
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
        getBottomSheet(widget.context, widget.title, widget.modelList);
        debugPrint("Pressed");
      },
    );
  }

  void getBottomSheet(
      BuildContext context, String title, List<CountryModel> listItems) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
        ),
        builder: (BuildContext context) => DraggableScrollableSheet(
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return searchListComponent(
                  context, title, listItems, scrollController);
            }));
  }

  Widget searchListComponent(BuildContext context, String title,
      List<CountryModel> listItems, ScrollController scrollController) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: Text(title, style: text_2F3036_14_Bold_w400)),
          addVerticalSpace(16),
          TextFormField(
            style: text_1F2024_14_Regular_w400,
            controller: searchTextController,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsetsDirectional.only(start: 12, end: 16),
                child: Image.asset(
                  IC_SEARCH,
                  width: 8,
                  height: 8,
                  color: black_rgba_8F9098,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              hintText: "Search",
              hintStyle: text_8f9098_14_Normal_w400,
              filled: true,
              fillColor: const Color.fromRGBO(255, 255, 255, 1),
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromRGBO(197, 198, 204, 1)),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xFF006FFD)),
                  borderRadius: BorderRadius.circular(12)),
            ),
            onChanged: (value) {
              setState(() {
                List searchList = [];
                for (int i = 0; i < listItems.length; i++) {
                  String name = listItems[i].name;
                  if (name.toLowerCase().contains(value.toLowerCase())) {
                    searchList.add(listItems[i]);
                  }
                }
                tempList = searchList;
              });
            },
          ),
          addVerticalSpace(16),
          Expanded(
            child: ListView.separated(
              controller: scrollController,
              separatorBuilder: (context, a) {
                return Container();
              },
              itemCount:
                  ((searchTextController.text=="")
                      ? listItems.length
                      : tempList.length),
              itemBuilder: (context, index) {
                return listItemComponent(
                    ((searchTextController.text == "")
                            ? listItems
                            : tempList)[index]
                        .name);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget listItemComponent(String text) {
    return Card(
      elevation: 0,
      color: const Color.fromRGBO(255, 255, 255, 1),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
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
