import 'package:flutter/material.dart';
import 'package:learner_prokit/model/final030120124.dart';
import 'package:postgres/postgres.dart';
import 'package:learner_prokit/main.dart';
import 'package:learner_prokit/model/final030120124.dart';
import 'package:learner_prokit/utils/AppWidget.dart';
import 'package:learner_prokit/utils/LearnerColors.dart';
import 'package:learner_prokit/utils/LearnerConstant.dart';
//import 'package:learner_prokit/utils/LearnerDataGenerator.dart';
import 'package:learner_prokit/utils/LearnerImages.dart';
import 'package:nb_utils/nb_utils.dart';

class LearnerChattingScreen extends StatefulWidget {
  @override
  _LearnerChattingScreenState createState() => _LearnerChattingScreenState();
}

class _LearnerChattingScreenState extends State<LearnerChattingScreen> {
  String userId = '030120124';
  List<StudentModel> chatMessages = [];

  @override
  void initState() {
    super.initState();
    fetchChatMessages();
  }

  Future<void> fetchChatMessages() async {
    final connection = PostgreSQLConnection(
      '91.225.104.133',
      5432,
      'learning',
      username: 'learning',
      password: 'jI13K02U',
    );

    await connection.open();

    final results = await connection.query('SELECT * FROM final030120124');
    List<StudentModel> chatData = results.map((row) {
      return StudentModel(
        name: row[1],
        school: row[2],
        ogrNo: row[3],
        rights: row[4],
      );
    }).toList();
    print(results);

    setState(() {
      chatMessages = chatData;
    });

    await connection.close();
  }

  Widget buildChatMessages(StudentModel message) {
    if (message.ogrNo != userId) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              color: learner_colorPrimary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Text(
              message.ogrNo,
              style: primaryTextStyle(color: white),
            ).center().paddingOnly(left: 8, right: 8, top: 8, bottom: 8),
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ],
      );
    } else {
      return Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: context.cardColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
            ),
            width: MediaQuery.of(context).size.width * 0.75,
            child: Text(message.name, style: primaryTextStyle()).paddingAll(8),
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(width * 0.25),
          child: SafeArea(
            child: Container(
              color: context.cardColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: learner_colorPrimary),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            text("Marc Elliot",
                                textColor: learner_textColorPrimary,
                                fontSize: textSizeLargeMedium,
                                fontFamily: fontMedium),
                            text("Active",
                                textColor: learner_textColorSecondary,
                                fontSize: textSizeMedium,
                                fontFamily: fontRegular)
                          ],
                        ),
                        Image.network(learner_ic_profile4,
                                height: 45, width: 45, fit: BoxFit.fill)
                            .cornerRadiusWithClipRRect(25),
                      ],
                    ),
                  ),
                  16.height,
                ],
              ).paddingOnly(left: 12, right: 16),
            ),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ListView.builder(
              itemBuilder: (context, i) => buildChatMessages(chatMessages[i]),
              itemCount: chatMessages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 60, top: 18),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                width: width,
                margin: EdgeInsets.only(top: 8),
                decoration: boxDecorationDefault(color: context.cardColor),
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      learner_ic_smile,
                      height: 30,
                      width: 30,
                      color: appStore.isDarkModeOn ? white : black,
                    ).paddingAll(10),
                    TextFormField(
                      style: primaryTextStyle(),
                      decoration: InputDecoration(
                        hintText: "Ask me Something",
                        filled: true,
                        fillColor: context.cardColor,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: learner_white, width: 0.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide:
                              BorderSide(color: learner_white, width: 0.0),
                        ),
                      ),
                    ).expand(),
                    Container(
                      child: Icon(Icons.arrow_upward,
                          size: 24, color: learner_white),
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(right: 8, left: 8),
                      decoration: BoxDecoration(
                        color: learner_colorPrimary,
                        shape: BoxShape.circle,
                      ),
                    ).onTap(() {
                      //
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
