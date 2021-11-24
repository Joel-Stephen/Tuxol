import 'package:app_template/src/models/questions_model.dart';
import 'package:app_template/src/screens/score_page.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsModel questionsModel;
  int index;
  int score;
  QuestionsPage({this.questionsModel, this.index, this.score});

  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  bool loading = false;
  QuestionsModel questionsModel;
  List<String> options;
  int _radioSelected;
  String _radioVal="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(_radioVal+"dsds");
    widget.questionsModel.results[widget.index].incorrectAnswers
        .add(widget.questionsModel.results[widget.index].correctAnswer);
    print(widget.questionsModel.results[widget.index].incorrectAnswers);
    widget.questionsModel.results[widget.index].incorrectAnswers.shuffle();
    print(widget.questionsModel.results[widget.index].incorrectAnswers);
    print(widget.questionsModel.results[widget.index].correctAnswer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(context, dividedBy: 20)),
          height: screenHeight(context, dividedBy: 1),
          width: screenWidth(context, dividedBy: 1),
          child: Column(
            children: [
              Text(
                "TRIVIA APP",
                style: TextStyle(
                    fontSize: screenWidth(context, dividedBy: 10),
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight(context, dividedBy: 5)),
              Row(
                children: [
                  Text(
                    "Question " + (widget.index + 1).toString(),
                    style: TextStyle(
                        fontSize: screenWidth(context, dividedBy: 25),
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: screenHeight(context, dividedBy: 30)),
              Row(
                children: [
                  Container(
                      width: screenWidth(context, dividedBy: 1.2),
                      child: Text(
                        widget.questionsModel.results[widget.index].question,
                        style: TextStyle(
                            fontSize: screenWidth(context, dividedBy: 30),
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      )),
                ],
              ),
              SizedBox(height: screenHeight(context, dividedBy: 30)),
              Row(
                children: [
                  Text(
                    "Choices",
                    style: TextStyle(
                        fontSize: screenWidth(context, dividedBy: 25),
                        color: Colors.black.withOpacity(0.5),
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              SizedBox(height: screenHeight(context, dividedBy: 30)),
              Row(
                children: [
                  Container(
                      width: screenWidth(context, dividedBy: 1.2),
                      child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: _radioSelected,
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        setState(() {
                                          _radioSelected = value;
                                          _radioVal = widget
                                              .questionsModel
                                              .results[widget.index]
                                              .incorrectAnswers[0];
                                        });
                                      },
                                    ),
                                    Container(width: screenWidth(context,dividedBy: 1.5),
                                      child: Text(widget
                                          .questionsModel
                                          .results[widget.index]
                                          .incorrectAnswers[0]),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 2,
                                      groupValue: _radioSelected,
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        setState(() {
                                          _radioSelected = value;
                                          _radioVal = widget
                                              .questionsModel
                                              .results[widget.index]
                                              .incorrectAnswers[1];
                                        });
                                      },
                                    ),
                                    Container(
                                      width: screenWidth(context,dividedBy: 1.5),
                                      child: Text(widget
                                          .questionsModel
                                          .results[widget.index]
                                          .incorrectAnswers[1]),
                                    ),
                                  ],
                                ),
                                widget.questionsModel.results[widget.index].incorrectAnswers.length>2
                                    ? Row(
                                  children: [
                                    Radio(
                                      value: 3,
                                      groupValue: _radioSelected,
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        setState(() {
                                          _radioSelected = value;
                                          _radioVal = widget
                                              .questionsModel
                                              .results[widget.index]
                                              .incorrectAnswers[2];
                                        });
                                      },
                                    ),
                                    Container(
                                      width: screenWidth(context,dividedBy: 1.5),
                                      child: Text(widget
                                          .questionsModel
                                          .results[widget.index]
                                          .incorrectAnswers[2]),
                                    ),
                                  ],
                                ):Column(),
                                widget.questionsModel.results[widget.index].incorrectAnswers.length>2
                                    ? Row(
                                  children: [
                                    Radio(
                                      value: 4,
                                      groupValue: _radioSelected,
                                      activeColor: Colors.blue,
                                      onChanged: (value) {
                                        setState(() {
                                          _radioSelected = value;
                                          _radioVal = widget
                                              .questionsModel
                                              .results[widget.index]
                                              .incorrectAnswers[3];
                                        });
                                      },
                                    ),
                                    Container(
                                      width: screenWidth(context,dividedBy: 1.5),
                                      child: Text(widget
                                          .questionsModel
                                          .results[widget.index]
                                          .incorrectAnswers[3]),
                                    ),
                                  ],
                                ):Container(),
                              ],
                            )
                          )
                ],
              ),
              GestureDetector(
                onTap: () {
                  if(_radioVal.isEmpty)
                    showToast("Please select an Option");
                  else
                  if (widget.questionsModel.results.length != widget.index + 1) {
                    pushAndReplacement(
                        context,
                        QuestionsPage(
                          score: _radioVal==widget.questionsModel.results[widget.index].correctAnswer?widget.score+10:widget.score,
                          questionsModel: widget.questionsModel,
                          index: widget.index + 1,
                        ));
                  }
                  else
                    pushAndReplacement(
                        context,
                        ScorePage(
                          score: _radioVal==widget.questionsModel.results[widget.index].correctAnswer?widget.score+10:widget.score,
                        ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: screenWidth(context, dividedBy: 4),
                      height: screenHeight(context, dividedBy: 15),
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                blurRadius: 2)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(
                            child: Container(
                                // color:Colors.red,
                                child: Text("Next",
                                    style: TextStyle(
                                        fontSize:
                                            screenWidth(context, dividedBy: 25),
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900))),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.arrow_forward))
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
