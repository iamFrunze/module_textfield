import 'package:flutter/material.dart';

const iconSize = 36.0;
const iconPadding = 4.0;
const iconBackgroundBorderRadius = 2.0;

class LabelWidget extends StatelessWidget {
  final String labelText;
  final TextStyle labelStyle;
  final Color iconBackgroundColor;
  final String icon;

  const LabelWidget({
    Key? key,
    required this.icon,
    required this.iconBackgroundColor,
    required this.labelText,
    required this.labelStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: iconSize,
          width: iconSize,
          padding: const EdgeInsets.all(iconPadding),
          decoration: BoxDecoration(
            color: iconBackgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(iconBackgroundBorderRadius),
            ),
          ),

          /// TODO(iam): change when create icons
          // child: SvgPicture.asset(widget.icon),
          child: Center(child: Text(icon)),
        ),
        const SizedBox(width: 10),
        Text(
          labelText.toUpperCase(),
          style: labelStyle,
        )
      ],
    );
  }
}
