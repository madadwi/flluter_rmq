import 'package:flutter/material.dart';
import 'package:flutter_app_with_package/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool index = false;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.initState(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text("Smart Watering"),
            centerTitle: true,
          ),
          body: Container(
            margin: EdgeInsets.all(5),
            height: 230,
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(7),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(Icons.settings,
                                            color: Colors.green, size: 40),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "POMPA",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: model.pompa,
                                            style: TextStyle(
                                                color: model.pompa == 'On'
                                                    ? Colors.green
                                                    : Colors.grey,
                                                fontSize: 30),
                                          ),
                                          textAlign: TextAlign.left,
                                        )
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Icons.waves,
                                          color: Colors.blue,
                                          size: 40,
                                        ),
                                        Text(
                                          "NILAI SENSOR",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            text: model.value.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30),
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Column(
                          children: <Widget>[
                            InkWell(
                              splashColor: Colors.white,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.decelerate,
                                width: 70,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50.0),
                                    border: Border.all(
                                        color: index
                                            ? Colors.black
                                            : Colors.lightBlueAccent),
                                    color: index
                                        ? Colors.lightBlueAccent
                                        : Colors.white),
                                child: AnimatedAlign(
                                  duration: const Duration(milliseconds: 300),
                                  alignment: index
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  curve: Curves.decelerate,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: index
                                              ? Colors.white
                                              : Colors.lightBlueAccent,
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                    ),
                                  ),
                                ),
                              ),
                              onTap: () async {
                                setState(() {
                                  index = !index;
                                  model.controlPomp(index);
                                });
                              },
                            ),
                          ],
                        ),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
