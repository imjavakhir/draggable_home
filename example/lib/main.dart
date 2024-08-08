import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: "Draggable Home",
        home: HomePage(),
      );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableHome(
      // leading: const Icon(Icons.arrow_back_ios),
      title: SizedBox(),
      headerExpandedHeight: 0.135,
      curvedBodyRadius: 20,
      toolbarHeight: 0,
      // actions: [
      //   IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      // ],
      gradient: LinearGradient(colors: [Colors.blue, Colors.grey]),
      headerWidget: Stack(children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 200,
            decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.blue, Colors.grey])),
          ),
        ),
      ]),

      body: [
        listView(),
      ],
      // fullyStretchable: true,

      backgroundColor: Colors.white,
    );
  }

  Row headerBottomBarWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget headerWidget(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Text(
          "Title",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(color: Colors.white70),
        ),
      ),
    );
  }

  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
        ),
      ),
    );
  }
}
