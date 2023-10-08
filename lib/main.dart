import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("Size Selector"),
        centerTitle: true,
      ),
      body: SizeSelector(),
    ),
  ));
}

class SizeSelector extends StatefulWidget {
  const SizeSelector({Key? key}) : super(key: key);

  @override
  _SizeSelectorState createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  String selectedSize = 'S';

  void onSizeSelected(String size) {
    setState(() {
      selectedSize = size;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected size: $size'),
      ),
    );
  }

  ElevatedButton buildSizeButton(String size) {
    return ElevatedButton(
      onPressed: () => onSizeSelected(size),
      child: Text(size),
      style: ElevatedButton.styleFrom(
        primary: selectedSize == size ? Colors.orange : Colors.grey,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildSizeButton('S'),
            buildSizeButton('M'),
            buildSizeButton('L'),
            buildSizeButton('XL'),
            buildSizeButton('XXL'),
            buildSizeButton('XXXL'),
          ],
        )
      ],
    );
  }
}