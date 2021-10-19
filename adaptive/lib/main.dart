import 'package:flutter/material.dart';
import 'src/people.dart';
import 'src/widgets/person_detail.dart';

//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Home());
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Adaptive Design'),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return WideLayout();
        } else {
          return NarrowLayout();
        }
      }),
    );
  }
}

class WideLayout extends StatefulWidget {
  const WideLayout();

  @override
  State<WideLayout> createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  Person _person = Person('Jhon', 'Doe', 'dfdf');
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PeopleList(
            onPersonTap: (person) => setState(() {
              _person = person;
            }),
          ),
          flex: 2,
        ),
        Expanded(
          child: _person == null ? Placeholder() : PersonDetail(_person),
          flex: 3,
        ),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PeopleList(
        onPersonTap: (person) => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Scaffold(
              appBar: AppBar(
                title: const Text('Great'),
              ),
              body: PersonDetail(person)),
        )),
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  final void Function(Person) onPersonTap;
  const PeopleList({required this.onPersonTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var person in people)
          ListTile(
              leading: Image.network(person.picture),
              title: Text(person.name),
              onTap: () => onPersonTap(person))
      ],
    );
  }
}
