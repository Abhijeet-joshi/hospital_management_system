import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/app_widgets.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String? hintText;
  final String? value;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({
    Key? key,
    required this.items,
    this.hintText,
    this.value,
    this.onChanged,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.value;
  }

  @override
  void didUpdateWidget(covariant CustomDropdown oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _selectedValue = widget.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: 40,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          border: Border.all(color: Colors.black), // Optional: Add a border
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: DropdownButton<String>(
            value: _selectedValue,
            hint: widget.hintText != null ? Text(widget.hintText!) : null,
            dropdownColor: Colors.white,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
            underline: Container(), // Remove the default underline
            isExpanded: true,
            items: widget.items.map((String item) {
              return DropdownMenuItem<String>(
                value: item,
                child: textBox(data: item, setFontWeight: FontWeight.w500, setFontSize: 16),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
              });
              if (widget.onChanged != null) {
                widget.onChanged!(newValue);
              }
            },
          ),
        ),
      ),
    );
  }
}