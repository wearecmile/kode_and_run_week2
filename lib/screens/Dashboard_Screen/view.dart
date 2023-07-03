import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meet_well/main/model/master/meeting.dart';
import 'package:meet_well/utils/constants/string_constants.dart';
import 'package:provider/provider.dart';
import '../../main/navigation/bottomNavigation.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/constants/number_constants.dart';
import 'controller.dart';
import 'package:meet_well/utils/route/route.dart' as routes;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Meeting> meetings = [];
  String groupName = " ";
  bool isCaptain = true;
  @override
  void initState() {
    // TODO: implement initState
    callGetAllMeetings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title: Image.asset(StringConstant.logo),
        centerTitle: StringConstant.boolTrue,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: NumberConstant.doubleSeventeen),
            child: CircleAvatar(
              backgroundColor: greycolor,
              child: IconButton(
                icon: const Icon(StringConstant.iconPerson),
                onPressed: () {
                  Navigator.pushNamed(context, routes.profileScreen);
                },
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  NumberConstant.doubleTwentyFive,
                  NumberConstant.doubleTwelve,
                  NumberConstant.doubleZero,
                  NumberConstant.doubleTen),
              child: Text(groupName,
                  maxLines: NumberConstant.intTwo,
                  style: const TextStyle(
                    fontSize: NumberConstant.doubleThirty,
                  )),
            ),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      NumberConstant.doubleTwelve,
                      NumberConstant.doubleZero,
                      NumberConstant.doubleZero,
                      NumberConstant.doubleZero),
                  child: Text(StringConstant.textScheduledMeetings,
                      style: TextStyle(
                        fontSize: NumberConstant.doubleTwentyFive,
                      )),
                ),
              ],
            ),

            (meetings.length > 0)
                ? meetingCard()
                : const SizedBox(
                    height: NumberConstant.doubleForty,
                    child: Center(
                        child: Text(
                      StringConstant.textNoMeetings,
                      style: TextStyle(
                          fontSize: NumberConstant.doubleTwenty,
                          color: redColor),
                    ))),

            //
          ],
        ),
      ),
      floatingActionButton: isCaptain
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: greycolor,
              child: const Icon(StringConstant.iconAdd,
                  color: listTextPrimaryColor,
                  size: NumberConstant.doubleThirty),
            )
          : null,
      bottomNavigationBar: const bottomNavigation(),
    );
  }

  Widget meetingCard() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: meetings.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, routes.meetingDetailsScreen);
          },
          child: Padding(
            padding: const EdgeInsets.all(NumberConstant.doubleTen),
            child: Card(
              elevation: NumberConstant.doubleFive,
              color: greycolor,
              child: Padding(
                padding: const EdgeInsets.all(NumberConstant.doubleSixteen),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${meetings[index].title}",
                      style: const TextStyle(
                          fontSize: NumberConstant.doubleTwenty),
                    ),
                    const SizedBox(height: NumberConstant.doubleTen),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "${meetings[index].date}",
                          style: const TextStyle(
                            fontSize: NumberConstant.doubleSixteen,
                          ),
                        ),
                        const SizedBox(width: NumberConstant.doubleTen),
                        Text(
                          "${meetings[index].time}",
                          style: const TextStyle(
                            fontSize: NumberConstant.doubleSixteen,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined),
                        Text(
                          "${meetings[index].location}",
                          style: const TextStyle(
                            fontSize: NumberConstant.doubleSixteen,
                          ),
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
    Provider.of<DashboardScreenController>(context, listen: false)
        .getMeetingDetails()
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
