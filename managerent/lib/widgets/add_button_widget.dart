import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import '../design/images.dart' show plusImage;

class AddButton extends StatefulWidget {
  final String nameButton;
  final Function addFunction;

  const AddButton({
    super.key,
    required this.nameButton,
    required this.addFunction,
  });
  @override
  State<StatefulWidget> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(10),
      dashPattern: [20, 8],
      color: Colors.black,
      strokeWidth: 2,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          widget
              .addFunction(); // вызываем функцию обратного вызова по нажатию на кнопку
        },
        child: Container(
          width: 361,
          height: 70,
          child: Row(
            children: [
              SizedBox(
                width: 72,
              ),
              plusImage,
              SizedBox(
                width: 30,
              ),
              Text(
                widget.nameButton,
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
