import 'package:byte_bank_alura_app/helpers/constants.dart';
import 'package:flutter/material.dart';

const String dashboardPageRouteName = '/';

class DashboardPage extends StatefulWidget {
  const DashboardPage({this.onContactsClick, Key? key}) : super(key: key);
  final String title = dashboardPageTitle;

  final dynamic onContactsClick;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(cardElevation),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(logo),
                ElevatedButton.icon(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(extraLarge)),
                    ),
                    onPressed: () => widget.onContactsClick(),
                    icon: contacsIcon,
                    label: const Text(contactsPageTitle))
              ]),
        ));
  }
}
