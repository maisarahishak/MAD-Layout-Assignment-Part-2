import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  TabBar makeTabBar() {
    return TabBar(tabs: <Tab>[
      Tab(
        text: "Living Room",
      ),
      Tab(
        text: "Bedroom",
      ),
    ], controller: tabController);
  }

  TabBarView makeTabBarView(tabs) {
    return TabBarView(
      children: tabs,
      controller: tabController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Maisarah's Home"),
          backgroundColor: Colors.green,
          bottom: makeTabBar(),
        ),
        body: makeTabBarView(
            <Widget>[GridViewLivingRoom().build(), GridViewBedroom().build()]),
      ),
    );
  }
}

//living room

class GridViewLivingRoom {
  Card makeGridCell(String name, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
              child: Icon(
            icon,
            size: 30,
          )),
          Center(child: Text(name)),
          Center(
            child: ToggleSwitch(
              minWidth: 40.0,
              minHeight: 30.0,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['On', 'Off'],
              activeBgColors: [
                [Colors.green],
                [Colors.red]
              ],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          )
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          makeGridCell("Nest Cam Indoor Camera\n", Icons.photo_camera_front),
          makeGridCell("Lockitron Bolt Smart Lock\n", Icons.lock_clock),
          makeGridCell("RingPro Smart Video Doorbell\n", Icons.doorbell),
          makeGridCell("Samsung Neo QLED TV\n", Icons.connected_tv),
        ]);
  }
}

//bedroom

class GridViewBedroom {
  Card makeGridCell(String name, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(
              child: Icon(
            icon,
            size: 30,
          )),
          Center(child: Text(name)),
          Center(
            child: ToggleSwitch(
              minWidth: 40.0,
              minHeight: 30.0,
              initialLabelIndex: 1,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['On', 'Off'],
              activeBgColors: [
                [Colors.green],
                [Colors.red]
              ],
              onToggle: (index) {
                print('switched to: $index');
              },
            ),
          )
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: <Widget>[
          makeGridCell("Smart Speaker Alexa\n", Icons.speaker_rounded),
          makeGridCell("Smoke and CO Detector\n", Icons.smoke_free_rounded),
          makeGridCell("Kodak Baby Monitor\n", Icons.switch_video_outlined),
        ]);
  }
}
