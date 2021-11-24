import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class NextButton extends StatefulWidget {
  final double width;
  final double height;
  final String text;
  final Function onPress;
  NextButton({this.onPress,this.text,this.width,this.height});

  @override
  _NextButtonState createState() => _NextButtonState();
}

class _NextButtonState extends State<NextButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        widget.onPress();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
            color: Colors.yellow,
            boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 2
            )
            ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Container(
                // color:Colors.red,
                  child: Text(widget.text,style: TextStyle(fontSize: screenWidth(context,dividedBy: 25),color: Colors.black,fontWeight: FontWeight.w600))),
            ),
            Align(
                alignment:Alignment.centerRight,
                child: Icon(Icons.arrow_forward))

          ],
        ),
      ),
    );
  }
}
