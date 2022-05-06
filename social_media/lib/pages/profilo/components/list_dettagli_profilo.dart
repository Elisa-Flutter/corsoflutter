import 'package:flutter/material.dart';

import '../../../models/user.dart';

class ListProfDett extends StatefulWidget {
  final User user;
  const ListProfDett(this.user, {Key? key}) : super(key: key);

  @override
  State<ListProfDett> createState() => _ListProfDettState();
}

class _ListProfDettState extends State<ListProfDett> {
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool exapand) {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: const Icon(
                Icons.person,
              ),
              title: Text("${widget.user.firstName}\t${widget.user.lastName}"),
            );
          },
          body: Column(
            children: [
              ListTile(
                leading: const Icon(
                  Icons.mail,
                ),
                title: Text(widget.user.email ?? "not found"),
              ),
              ListTile(
                leading: const Icon(
                  Icons.gps_fixed,
                ),
                title: Text(
                    "${widget.user.location?.city},\t${widget.user.location?.country}"),
              ),
              ListTile(
                leading: Icon(
                  widget.user.gender == "female" ? Icons.girl : Icons.boy,
                ),
                title: Text(widget.user.gender ?? "not found"),
              ),
            ],
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}
