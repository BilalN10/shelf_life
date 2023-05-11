import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shelf_life/constants/icons.dart';

class CategoryDropDown extends StatefulWidget {
  const CategoryDropDown({
    super.key,
    required this.category,
  });

  final List<String> category;

  @override
  State<CategoryDropDown> createState() => _CategoryDropDownState();
}

class _CategoryDropDownState extends State<CategoryDropDown> {
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.07,
      width: Adaptive.w(100),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adaptive.w(11)),
          child: Platform.isAndroid
              ? MaterialDropDown(
                  selectedCategory: _selectedCategory, widget: widget)
              : MyCupertinoDropdown()),
    );
  }
}

class MyCupertinoDropdown extends StatefulWidget {
  const MyCupertinoDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyCupertinoDropdownState createState() => _MyCupertinoDropdownState();
}

class _MyCupertinoDropdownState extends State<MyCupertinoDropdown> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      scrollController: FixedExtentScrollController(),
      itemExtent: 32,
      onSelectedItemChanged: (int index) {
        setState(() {
          dropdownValue = ['Option 1', 'Option 2', 'Option 3'][index];
        });
      },
      children: <Widget>[
        Text('Option 1'),
        Text('Option 2'),
        Text('Option 3'),
      ],
    );
  }
}

class MaterialDropDown extends StatefulWidget {
  MaterialDropDown({
    super.key,
    required this.widget,
    this.selectedCategory,
  });

  String? selectedCategory;
  final CategoryDropDown widget;

  @override
  State<MaterialDropDown> createState() => _MaterialDropDownState();
}

class _MaterialDropDownState extends State<MaterialDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: Image.asset(IconClass.arrowDown),
        hint: Text(
          'Select Category',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff080C2F),
          ),
        ),
        value: widget.selectedCategory,
        onChanged: (newValue) {
          setState(() {
            widget.selectedCategory = newValue;
          });
        },
        items: widget.widget.category.map((categories) {
          return DropdownMenuItem(
            value: categories,
            child: Text(
              categories,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: const Color(0xff080C2F),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
