import 'package:flutter/material.dart';

const animationDuration = 250;

class TextFieldWidget extends StatefulWidget {
  final Color fillColor;
  final TextStyle? inputTextStyle;
  final TextStyle? suffixTextStyle;
  final TextInputType textInputType;
  final TextEditingController textEditingController;

  const TextFieldWidget({
    Key? key,
    required this.fillColor,
    required this.inputTextStyle,
    required this.suffixTextStyle,
    required this.textInputType,
    required this.textEditingController,
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> animationAlign;
  late Animation<TextStyle> animationTextStyle;
  late Animation<Color?> animationColor;
  late AnimationController animationController;

  var textAlign = Alignment.centerRight;

  bool isRight = true;
  bool isSuffixVisible = true;

  late TextStyle? fontStyle;

  final focus = FocusNode();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: animationDuration),
    );

    animationAlign = AlignmentTween(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationTextStyle = TextStyleTween(
      begin: widget.suffixTextStyle,
      end: widget.inputTextStyle,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });
    animationColor = ColorTween(
      begin: Colors.transparent,
      end: widget.fillColor,
    ).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    focus.addListener(() {
      setState(() {
        if (!focus.hasFocus) {
          isSuffixVisible = !isSuffixVisible;
          focus.unfocus();
          animationController.reverse();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fontStyle = widget.suffixTextStyle;

    return Row(
      children: [
        Visibility(
          visible: isSuffixVisible,
          child: Expanded(
            child: SizedBox(
              height: 60,
              child: InkWell(
                onTap: () {
                  animationController.forward().whenComplete(() {
                    setState(() {
                      isSuffixVisible = !isSuffixVisible;
                      focus.requestFocus();
                    });
                  });
                },
                child: Ink(
                  color: animationColor.value,
                  child: Align(
                    alignment: animationAlign.value,
                    child: Text(
                      widget.textEditingController.text,
                      style: animationTextStyle.value,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isSuffixVisible,
          child: Expanded(
            child: AnimatedOpacity(
              opacity: !isSuffixVisible ? 1.0 : 0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: animationDuration),
              child: TextFormField(
                focusNode: focus,
                controller: widget.textEditingController,
                keyboardType: widget.textInputType,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  fillColor: widget.fillColor,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
                style: widget.inputTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
