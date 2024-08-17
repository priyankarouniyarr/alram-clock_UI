import 'package:alaram_clockapp/alramdetail.dart';
import 'package:alaram_clockapp/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Alrampage extends StatefulWidget {
  const Alrampage({super.key});

  @override
  State<Alrampage> createState() => _AlrampageState();
}

class _AlrampageState extends State<Alrampage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 8, left: 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/alaram_clock.png",
                  width: MediaQuery.of(context).size.width / 6),
              Text(
                "Alarm Clock",
                style: TextStyle(
                  fontFamily: "Acme",
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[500],
                  fontSize: 24.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
//var alarmtime=DateFormat('hh:mm:aa').format(alarm.alramDatetime)

                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 225, 254, 255),
                        Color.fromARGB(255, 139, 151, 150),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 2,
                          offset: Offset(1, 2)),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Alramdetail()));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "07:00 ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Acme",
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    "am ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Acme",
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                value: true,
                                onChanged: (bool value) {},
                                activeColor: Colors.white,
                                activeTrackColor: Colors.blue,
                              ),
                            )
                          ],
                        ),
                        Text(
                          "Mon-Sun",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Poppins",
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
