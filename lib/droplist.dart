import 'package:flutter/material.dart';

class DropDown {
  /// This will give the list of data.
  final List<Widget> data;

  /// This will give the call back to the selected items from list.

  /// [listBuilder] will gives [index] as a function parameter and you can return your own widget based on [index].
  final Widget Function(int index)? listBuilder;

  /// This will give selection choice for single or multiple for list.

  /// This gives the bottom sheet title.
  final Widget? bottomSheetTitle;

  /// You can set your custom submit button when the multiple selection is enabled.
  final Widget? submitButtonChild;

  /// [searchWidget] is use to show the text box for the searching.
  /// If you are passing your own widget then you must have to add [TextEditingController] for the [TextFormField].
  final TextFormField? searchWidget;

  /// [isSearchVisible] flag use to manage the search widget visibility
  /// by default it is [True] so widget will be visible.
  final bool isSearchVisible;

  /// This will set the background color to the dropdown.
  final Color dropDownBackgroundColor;

  DropDown({
    Key? key,
    required this.data,
    this.listBuilder,
    this.bottomSheetTitle,
    this.submitButtonChild,
    this.searchWidget,
    this.isSearchVisible = true,
    this.dropDownBackgroundColor = Colors.transparent,
  });
}

class DropDownState {
  DropDown dropDown;

  DropDownState(this.dropDown);

  /// This gives the bottom sheet widget.
  void showModal(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return MainBody(dropDown: dropDown);
          },
        );
      },
    );
  }
}

/// This is main class to display the bottom sheet body.
class MainBody extends StatefulWidget {
  final DropDown dropDown;

  const MainBody({required this.dropDown, Key? key}) : super(key: key);

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
  /// This list will set when the list of data is not available.
  List<Widget> mainList = [];

  @override
  void initState() {
    super.initState();
    mainList = widget.dropDown.data;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.13,
      maxChildSize: 0.9,
      expand: false,
      builder: (BuildContext context, ScrollController scrollController) {
        return Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Bottom sheet title text
                  Expanded(
                      child: widget.dropDown.bottomSheetTitle ?? Container()),

                  /// Done button
                  Visibility(
                    visible: true,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Material(
                        child: ElevatedButton(
                          onPressed: () {
                            List<Widget> selectedList = widget.dropDown.data
                                .where((element) => element == true)
                                .toList();
                            List<dynamic> selectedNameList = [];

                            for (var element in selectedList) {
                              selectedNameList.add(element);
                            }

                            _onUnFocusKeyboardAndPop();
                          },
                          child: widget.dropDown.submitButtonChild ??
                              const Text('Done'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// A [TextField] that displays a list of suggestions as the user types with clear button.

            /// Listview (list of data with check box for multiple selection & on tile tap single selection)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Column(
                  children: [
                    Expanded(child: mainList[0]),
                    const SizedBox(
                      height: 10,
                    ),
                    mainList[1],
                    mainList[2],
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  /// This helps when search enabled & show the filtered data in list.

  /// This helps to UnFocus the keyboard & pop from the bottom sheet.
  _onUnFocusKeyboardAndPop() {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pop();
  }
}
