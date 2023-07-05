import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meet_well/main/model/master/meeting.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:meet_well/utils/constants/style_constants.dart';
import 'package:meet_well/utils/route/route.dart' as routes;
import 'package:provider/provider.dart';

import '../../../utils/constants/color_constants.dart';
import '../../../utils/constants/number_constants.dart';
import '../controller/dashboard_screen_controller.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Meeting> meetings = [];
  String groupName = StringConstant.textEmpty;

  @override
  void initState() {
    // TODO: implement initState
    callGetAllMeetings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(
                NumberConstant.doubleTwentyFive,
                NumberConstant.doubleTwelve,
                NumberConstant.doubleZero,
                NumberConstant.doubleTen),
            child: Text(groupName,
                maxLines: NumberConstant.intTwo,
                style: AppStyle.displayGroupName()),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                    NumberConstant.doubleTwelve,
                    NumberConstant.doubleZero,
                    NumberConstant.doubleZero,
                    NumberConstant.doubleZero),
                child: Text(
                  StringConstant.textScheduledMeetings,
                  style: AppStyle.textSchedule(),
                ),
              ),
            ],
          ),

          (meetings.length > NumberConstant.intZero)
              ? meetingCard()
              : SizedBox(
                  height: NumberConstant.doubleForty,
                  child: Center(
                      child: Text(
                    StringConstant.textNoMeetings,
                    style: AppStyle.errorNoMeeting(),
                  ))),

          //
        ],
      ),
    );
  }

  Widget meetingCard() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: StringConstant.boolTrue,
      itemCount: meetings.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(
                context, routes.meetingDetailsScreen);
          },
          child: Padding(
            padding: const EdgeInsets.only(
                top: NumberConstant.doubleTen,
                right: NumberConstant.doubleTen,
                left: NumberConstant.doubleTen),
            child: Container(
              decoration: const BoxDecoration(
                  color: greycolor,
                  borderRadius: BorderRadius.all(
                      Radius.circular(NumberConstant.doubleTen))),
              child: Padding(
                padding: const EdgeInsets.all(NumberConstant.doubleSixteen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${meetings[index].title}",
                        style: AppStyle.meetingTitle()),
                    const SizedBox(height: NumberConstant.doubleTen),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${meetings[index].date}",
                          style: AppStyle.meetingDateTimeLocation(),
                        ),
                        const SizedBox(width: NumberConstant.doubleTen),
                        Text(
                          "${meetings[index].time}",
                          style: AppStyle.meetingDateTimeLocation(),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text(
                          "${meetings[index].location}",
                          style: AppStyle.meetingDateTimeLocation(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void callGetAllMeetings() async {
    Provider.of<DashboardScreenController>(context,
            listen: StringConstant.boolFalse)
        .getMeetingDetails() // send group id
        .then((value) => {
              formatMeetings(value),
            })
        .onError((error, stackTrace) => {});
  }

  formatMeetings(result) async {
    meetings = [];
    groupName = result.data.groupName;
    for (var i = NumberConstant.intZero;
        i < result.data.listOfMeetings.length;
        i++) {
      meetings.add(result.data.listOfMeetings[i]);
    }
    setState(() {
      meetings;
      groupName;
    });
  }
}
