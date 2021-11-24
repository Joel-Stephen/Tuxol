import 'package:app_template/src/screens/home_page.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class ScorePage extends StatefulWidget {
  final int score;
  ScorePage({this.score});

  @override
  _ScorePageState createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: screenHeight(context,dividedBy: 1),
          width: screenWidth(context,dividedBy: 1),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TRIVIA APP",style: TextStyle(fontSize: screenWidth(context,dividedBy: 10),color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: screenHeight(context,dividedBy: 5)),
              Text("Your Score is",style: TextStyle(fontSize: screenWidth(context,dividedBy: 20),color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: screenHeight(context,dividedBy: 30)),
              Text(widget.score.toString(),style: TextStyle(fontSize: screenWidth(context,dividedBy: 12),color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: screenHeight(context,dividedBy: 5)),


              GestureDetector(
                onTap: (){
                  pushAndReplacement(context, HomePage());
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: screenWidth(context,dividedBy: 2),
                  height: screenHeight(context,dividedBy: 15),
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
                            child: Text("RETAKE TRIVIA",style: TextStyle(fontSize: screenWidth(context,dividedBy: 25),color: Colors.black,fontWeight: FontWeight.w900))),
                      ),
                      Align(
                          alignment:Alignment.centerRight,
                          child: Icon(Icons.arrow_forward))

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
