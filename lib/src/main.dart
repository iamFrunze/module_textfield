import 'package:flutter/material.dart';
import 'package:module_textfield/src/widgets/label_widget.dart';
import 'package:module_textfield/src/widgets/text_field_widget.dart';

const padding = 12.0;

class ModuleTextField extends StatefulWidget {
  final double width;
  final Widget icon;
  final Color iconBackgroundColor;
  final String labelText;
  final TextStyle? labelStyle;
  final Color borderColor;

  final Color fillColor;
  final TextStyle? inputTextStyle;
  final TextStyle? suffixTextStyle;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const ModuleTextField({
    Key? key,
    this.width = 400,
    required this.icon,
    required this.iconBackgroundColor,
    required this.labelText,
    required this.labelStyle,
    required this.borderColor,
    required this.fillColor,
    required this.inputTextStyle,
    required this.suffixTextStyle,
    required this.textEditingController,
    required this.textInputType,
  }) : super(key: key);

  @override
  State<ModuleTextField> createState() => _ModuleTextFieldState();
}

class _ModuleTextFieldState extends State<ModuleTextField> {
  var textFieldAlign = TextAlign.right;
  final controller = TextEditingController(text: '100');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: widget.borderColor,
        ),
      ),
      width: widget.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LabelWidget(
            icon: widget.icon,
            iconBackgroundColor: widget.iconBackgroundColor,
            labelText: widget.labelText,
            labelStyle: widget.labelStyle,
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 60,
            child: TextFieldWidget(
              fillColor: widget.fillColor,
              inputTextStyle: widget.inputTextStyle,
              suffixTextStyle: widget.suffixTextStyle,
              textEditingController: widget.textEditingController,
              textInputType: widget.textInputType,
            ),
          ),
        ],
      ),
    );
  }
}
