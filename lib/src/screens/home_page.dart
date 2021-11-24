import 'package:app_template/src/models/questions_model.dart';
import 'package:app_template/src/screens/questions_page.dart';
import 'package:app_template/src/utils/dio.dart';
import 'package:app_template/src/utils/object_factory.dart';
import 'package:app_template/src/utils/utils.dart';
import 'package:app_template/src/widgets/next_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading =false;
  QuestionsModel questionsModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loading=true;
    });
    getQuestions();
  }
  Future<State> getQuestions() async {
    final response = await AppDio().get(url: "https://opentdb.com/api.php?amount=10");
    print(response.toString());
    if (response.statusCode == 200) {

      setState(() {
        loading=false;
        questionsModel=QuestionsModel.fromJson(response.data);
        print(questionsModel.results.length);
      });
    }
    else
      showToast("Please try again later");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenHeight(context,dividedBy: 1),
        width: screenWidth(context,dividedBy: 1),
        child: loading == true?Container(
          child: Center(
            child: SpinKitRipple(
              color: Colors.yellow.withOpacity(1),
            ),
          ),
        ):Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("TRIVIA APP",style: TextStyle(fontSize: screenWidth(context,dividedBy: 10),color: Colors.black,fontWeight: FontWeight.w900),),
              SizedBox(height: screenHeight(context,dividedBy: 20)),
              NextButton(width: screenWidth(context,dividedBy: 2),height: screenHeight(context,dividedBy: 15),text: "TAKE TRIVIA",onPress: (){push(context, QuestionsPage(index: 0,questionsModel: questionsModel,score: 0,));},),
            //   GestureDetector(
            //     onTap: () {
            //
            //     },
            //     child: Container(
            //       padding: EdgeInsets.all(10),
            //       width: screenWidth(context,dividedBy: 2),
            //       height: screenHeight(context,dividedBy: 15),
            //       decoration: BoxDecoration(
            //         color: Colors.yellow,
            //         boxShadow: [BoxShadow(
            //           color: Colors.black.withOpacity(0.5),
            //           blurRadius: 2
            //         )
            // ]
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Center(
            //             child: Container(
            //               // color:Colors.red,
            //                 child: Text("TAKE TRIVIA",style: TextStyle(fontSize: screenWidth(context,dividedBy: 25),color: Colors.black,fontWeight: FontWeight.w600))),
            //           ),
            //           Align(
            //               alignment:Alignment.centerRight,
            //               child: Icon(Icons.arrow_forward))
            //
            //         ],
            //       ),
            //     ),
            //   )
            ],
          ),
        ),
      ),
    );
  }
}
