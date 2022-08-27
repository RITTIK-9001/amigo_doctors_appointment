import 'package:badges/badges.dart';
import 'package:doctors_appointment/assets/json.dart';
import 'package:doctors_appointment/screens/doctorProfilePage.dart';
import 'package:doctors_appointment/theme/colors.dart';
import 'package:doctors_appointment/widgets/avtarImage.dart';
import 'package:doctors_appointment/widgets/doctorBox.dart';
import 'package:doctors_appointment/widgets/textbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Dentist extends StatefulWidget {
  const Dentist({Key? key}) : super(key: key);

  @override
  _DentistState createState() => _DentistState();
}

class _DentistState extends State<Dentist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Dentist",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.info,
              color: Color.fromARGB(255, 8, 1, 1),
            ),
          )
        ],
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Expanded(child: CustomTextBox()),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.filter_list_rounded,
                    color: primary,
                    size: 35,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        chatsData.length,
                        (index) => Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Badge(
                                  badgeColor: Colors.green,
                                  borderSide: BorderSide(color: Colors.white),
                                  position:
                                      BadgePosition.topEnd(top: -3, end: 0),
                                  badgeContent: Text(''),
                                  child: AvatarImage(
                                      chatsData[index]["image"].toString())),
                            ))),
              ),
              SizedBox(
                height: 20,
              ),
              getDoctorList()
            ])));
  }

  getDoctorList() {
    return new StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      itemCount: doctors.length,
      itemBuilder: (BuildContext context, int index) => DoctorBox(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DoctorProfilePage()));
          },
          index: index,
          doctor: doctors[index]),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 3 : 2),
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
    );
  }
}
