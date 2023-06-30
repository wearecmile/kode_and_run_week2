import 'package:flutter/material.dart';

import '../../main/navigation/bottomNavigation.dart';
import '../../utils/constants/color_constants.dart';
import '../../utils/constants/number_constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}
bool isCaptain = true;
class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        title:Image.asset("assets/Meetwell_Logo.png"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: CircleAvatar(
              backgroundColor: greycolor,
              child: IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Perform search action
                },
              ),
            ),
          ),
        ],

      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(25, 12,0,0),
              child: Text("Group Name",
              maxLines: 2,
              style: TextStyle(
                fontSize: NumberConstant.doubleThirty,
              )

        ),
            ),
            SizedBox(height: 20,),
            MeetingCard(),

           //

          ],
        ),
      ),
      floatingActionButton: isCaptain ?  FloatingActionButton(onPressed: (){},
        backgroundColor: greycolor,
      child: const Icon(Icons.add, color: listTextPrimaryColor, size: 30),
      ):  null,
      bottomNavigationBar: const bottomNavigation(),
    );
  }

  Widget MeetingCard(){

    return ListView.builder(
     shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return const  Padding(
          padding: EdgeInsets.all(10.0),
          child: Card(
            elevation: 5,
            color: greycolor,
            child:Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Meeting Title",
                    style: TextStyle(
                        fontSize: NumberConstant.doubleTwenty
                    ),
                  ),
                  SizedBox(height:10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("29/06/2023",
                        style: TextStyle(
                          fontSize: NumberConstant.doubleSixteen,

                        ),
                      ),
                      SizedBox(width:10),
                      Text("10:30 pm",
                        style: TextStyle(
                          fontSize: NumberConstant.doubleSixteen,

                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text("Address",
                        style: TextStyle(
                          fontSize: NumberConstant.doubleSixteen,

                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

          ),
        );
      },
    );
  }
}
