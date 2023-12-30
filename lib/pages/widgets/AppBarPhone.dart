import 'package:flutter/material.dart';

class AppBarPhone extends StatefulWidget {
  const AppBarPhone({Key? key}) : super(key: key);

  @override
  State<AppBarPhone> createState() => _AppBarPhoneState();
}

class _AppBarPhoneState extends State<AppBarPhone> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBarsMethod(),
        body: Container(),
      ),
    );
  }

  AppBar AppBarsMethod() {
    return AppBar(
      bottom: TabBar(tabs: [
        Tab(
          child: Text("data"),
        ),
        Tab(
          child: Text("data"),
        ),
        Tab(
          child: Text("data"),
        ),
        Tab(
          child: Text("data"),
        ),
        Tab(
          child: Text("data"),
        ),
        Tab(
          child: Text("data"),
        ),
        Tab(
          child: Text("data"),
        ),
      ]),
    );
  }
}
