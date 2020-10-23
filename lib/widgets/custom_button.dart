
import 'package:calculator/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class NeuCalButton extends StatefulWidget {
  final String text;
  final Color textColor;
  final double textSize;
  final bool isDouble;
  final Function onTap;
  NeuCalButton(
      {Key key,
      @required this.text,
      this.textColor,
      this.textSize,
      this.isDouble, this.onTap})
      : super(key: key);

  @override
  _NeuCalButtonState createState() => _NeuCalButtonState();
}

class _NeuCalButtonState extends State<NeuCalButton> {
  bool _isPressed = false;
  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
    widget.onTap();
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final squareSideLength = _width / 5;
    final buttonWidth = squareSideLength * (widget.isDouble ? 2.3 : 1);
    final buttonSize = Size(buttonWidth, squareSideLength);
    return SizedBox(
      width: buttonSize.width,
      height: buttonSize.height,
      child: Listener(
        onPointerUp: _onPointerUp,
        onPointerDown: _onPointerDown,
        child: Container(
          alignment: Alignment(0, 0),
          child: CustomText(
            text: widget.text,
            fontColor: widget.textColor,
            fontSize: widget.textSize ?? 30,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1.0, -4.0),
                  end: Alignment(1.0, 4.0),
                  colors: [
                    Color(0xFFe7f3fa),
                    Color(0xFFdbdfe1),
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(35)),
              boxShadow: _isPressed
                  ? []
                  : [
                      BoxShadow(
                          color: Color(0xFFb9c9d3),
                          offset: Offset(5.0, 5.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                      BoxShadow(
                          color: Color(0xFFe6f7ff),
                          offset: Offset(-5.0, -5.0),
                          blurRadius: 15.0,
                          spreadRadius: 1.0),
                    ]),
        ),
      ),
    );
  }
}
