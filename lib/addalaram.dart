import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAlarm extends StatefulWidget {
  final bool isEditing; 

  
  AddAlarm({required this.isEditing});

  @override
  State<AddAlarm> createState() => _AddAlarmState();
}

class _AddAlarmState extends State<AddAlarm> {
  int selectedHour = 0;
  int selectedMinute = 0;
  String selectedPeriod = 'AM';
  String selectedRingtone = 'Default';
  bool isRepeat = false;
  bool vibrate = false;
  bool deleteAfterOff = false;

  void playRingtone(String ringtone) async {
    if (ringtone != 'Default') {
      final player = AudioPlayer();
      final audioPath = 'assets/audio/$ringtone';
      await player.play(AssetSource(audioPath));
      await Future.delayed(Duration(seconds: 10));
      player.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            widget.isEditing ? 'Edit Alarm' : 'Add Alarm',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done, color: Colors.black, size: 30),
            onPressed: () {
              // Add your 'done' action logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: CupertinoPicker(
                      itemExtent: 60,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedPeriod = index == 0 ? 'AM' : 'PM';
                        });
                      },
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('AM', style: TextStyle(fontSize: 30)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('PM', style: TextStyle(fontSize: 30)),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: 0.5,
                  color: Colors.grey,
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: CupertinoPicker.builder(
                      itemExtent: 60,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedHour = (index % 12) + 1;
                        });
                      },
                      childCount: null,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Text(
                            '${(index % 12) + 1}',
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: 0.5,
                  color: Colors.grey,
                ),
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: CupertinoPicker.builder(
                      itemExtent: 60,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedMinute = index % 60;
                        });
                      },
                      childCount: null,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Text(
                            index % 60 < 10
                                ? '0${index % 60}'
                                : '${index % 60}',
                            style: TextStyle(fontSize: 30),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              title: Text('Ringtone'),
              subtitle: Text(selectedRingtone),
              trailing: DropdownButton<String>(
                value: selectedRingtone,
                items: <String>['Default', 'audio1.mp3', 'audio2.mp3', 'audio3.mp3', 'audio4.mp3', 'audio5.mp3']
                    .map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.replaceAll('.mp3', '')),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRingtone = newValue!;
                    playRingtone(newValue);
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Repeat'),
              trailing: Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: isRepeat,
                  onChanged: (bool value) {
                    setState(() {
                      isRepeat = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Vibrate when alarm sounds'),
              trailing: Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: vibrate,
                  onChanged: (bool value) {
                    setState(() {
                      vibrate = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: Text('Delete after alarm goes off'),
              trailing: Transform.scale(
                scale: 0.9,
                child: Switch(
                  value: deleteAfterOff,
                  onChanged: (bool value) {
                    setState(() {
                      deleteAfterOff = value;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
