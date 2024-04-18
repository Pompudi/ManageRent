import 'package:flutter/material.dart';
import '../design/colors.dart';
import '../design/images.dart' show crossImage, folderImage;

class CollapsibleButton extends StatefulWidget {
  final bool isButtonActive;
  final Function itPressed;
  final String nameButton;

  const CollapsibleButton({
    super.key,
    required this.isButtonActive,
    required this.itPressed,
    required this.nameButton,
  });

  @override
  State<StatefulWidget> createState() => _CollapsibleButtonState();
}

class _CollapsibleButtonState extends State<CollapsibleButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.itPressed(),
      child: Container(
        width: 361,
        height: 32,
        decoration: BoxDecoration(
          color: blackColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 31.25),
            widget.isButtonActive ? crossImage : folderImage,
            const SizedBox(
              width: 31.25,
            ),
            Text(widget.nameButton,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 20,
                ))
          ],
        ),
      ),
    );
  }
}
