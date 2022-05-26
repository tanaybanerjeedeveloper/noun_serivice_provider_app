import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  //DropdownWidget({Key? key}) : super(key: key);
  final List dataList;

  DropdownWidget({required this.dataList});

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var _selectedItem;

  @override
  void initState() {
    _selectedItem = widget.dataList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: _selectedItem,
          items: widget.dataList
              .map((item) => DropdownMenuItem(
                    child: Text(
                      item,
                    ),
                    value: item,
                  ))
              .toList(),
          onChanged: (item) => setState(() {
            _selectedItem = item as String?;
          }),
        ),
      ),
    );
  }
}
