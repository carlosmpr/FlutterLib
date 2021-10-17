import 'package:flutter/material.dart';
import '../people.dart';

class PersonDetail extends StatelessWidget {
  final Person person;
  const PersonDetail(this.person);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(person.name), Text(person.phone)],
        ),
      ),
    );
  }
}
