import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Address extends StatelessWidget {
  const Address({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: ListView.builder(itemBuilder: (_, int index) => addressTile(context)),
    );
  }
}

Widget addressTile(BuildContext context) {
  return InkWell(
    child: Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            color: Colors.amber,
            child: const Icon(Icons.location_on)),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text('Label'), Text('Address'), Text('Note to rider')],
          ),
          const Icon(Icons.edit),
          const InkWell(
            child: Icon(Icons.delete),
          )
        ],
      ),
    ),
    onTap: ()=> context.push('/editAddress'),
  );
}
