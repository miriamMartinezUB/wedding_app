// import 'package:flutter/material.dart';
// import 'package:mpalliative_flutter/model/forms.dart';
// import 'package:mpalliative_flutter/texts/texts.dart';
//
// class SingleSelectQuestion extends StatefulWidget {
//   final bool isVertical;
//   Question question;
//   Function function;
//
//   SingleSelectQuestion(this.question, {Key key, this.isVertical = true, @required this.function}) : super(key: key);
//
//   @override
//   _SingleSelectQuestionState createState() => _SingleSelectQuestionState();
// }
//
// class _SingleSelectQuestionState extends State<SingleSelectQuestion> {
//   int group;
//
//   void selectAnswer(int index) {
//     setState(() {
//       widget.question.answer = [widget.question.values[index].text, widget.question.values[index].value];
//       group = index;
//     });
//   }
//
//   void checkDefaultAnswer() {
//     bool match = false;
//     for (int i = 0; i < widget.question.values.length && !match; i++) {
//       if (widget.question.answer == -9999) {
//         //Default No
//         if (widget.question.values[i].text.toLowerCase() == "no") {
//           match = true;
//
//           selectAnswer(i);
//         }
//       } else {
//         if (widget.question.values[i].text.toLowerCase() == widget.question.answer[0].toLowerCase()) {
//           match = true;
//
//           selectAnswer(i);
//         }
//       }
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     checkDefaultAnswer();
//
//     return widget.isVertical
//         ? Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: List<Widget>.generate(
//               widget.question.values.length,
//               (int index) => InkWell(
//                 onTap: () {
//                   selectAnswer(index);
//                   widget.function.call();
//                 },
//                 child: Row(
//                   children: [
//                     Radio(
//                       value: index,
//                       groupValue: group,
//                       onChanged: (value) {
//                         selectAnswer(index);
//                         widget.function.call();
//                       },
//                     ),
//                     Expanded(child: TextBodySmall(widget.question.values[index].text)),
//                   ],
//                 ),
//               ),
//             ),
//           )
//         : SizedBox(
//             height: 50,
//             child: ListView.builder(
//                 physics: ClampingScrollPhysics(),
//                 shrinkWrap: true,
//                 primary: false,
//                 scrollDirection: Axis.horizontal,
//                 itemCount: widget.question.values.length,
//                 itemBuilder: (context, index) {
//                   return Row(
//                     children: [
//                       Radio(
//                         value: index,
//                         groupValue: group,
//                         onChanged: (value) {
//                           setState(() {
//                             selectAnswer(index);
//                             widget.function.call();
//                           });
//                         },
//                       ),
//                       TextBodySmall(widget.question.values[index].text),
//                     ],
//                   );
//                 }));
//   }
// }
