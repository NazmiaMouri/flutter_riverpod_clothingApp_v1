import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/view/widgets/filled_button.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final _houseNumber = TextEditingController();
    final _aptNumber = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter:
                  LatLng(23.7658, 90.3584), // Center the map over London
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(23.7658, 90.3584),
                    width: 80,
                    height: 80,
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 20, 0, 0),
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50)),
                child: InkWell(
                  child: Icon(Icons.arrow_back),
                  onTap: () {
                    context.pop();
                  },
                )),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (BuildContext context, ScrollController scrollController) {
              return ColoredBox(
                color: Colors.white,
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Edit your address',
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text('Address'),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _houseNumber,
                        decoration: InputDecoration(
                            labelText: 'House number',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 0.5))),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _aptNumber,
                        decoration: InputDecoration(
                            labelText: 'Apartment name',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 0.5))),
                      ),
                      SizedBox(height: 10),
                      Text('Delivery instructions',
                          style: TextStyle(fontSize: 24)),
                      SizedBox(height: 10),
                      Text('Please give us more information about your address',
                          style:
                              TextStyle(fontSize: 12, color: Colors.black45)),
                      SizedBox(height: 10),
                      TextField(
                        controller: _houseNumber,
                        decoration: InputDecoration(
                            labelText:
                                'Floor or Apt no or tell us how we can find you',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 0.5))),
                      ),
                      SizedBox(height: 10),
                      Text('Add a label', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              IconButton.outlined(
                                  onPressed: () {},
                                  icon: Icon(Icons.home_outlined)),
                              Text('Home')
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton.outlined(
                                  onPressed: () {},
                                  icon: Icon(Icons.work_history_outlined)),
                              Text('Work')
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton.outlined(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite_outline)),
                              Text('Partner')
                            ],
                          ),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              IconButton.filledTonal(
                                  color: Colors.black12,
                                  onPressed: () {},
                                  icon: Icon(Icons.add)),
                              Text('Other')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: _houseNumber,
                        decoration: InputDecoration(
                            labelText:
                                'Floor or Apt no or tell us how we can find you',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    style: BorderStyle.solid, width: 0.5))),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
      persistentFooterButtons: [
        filledButton(
            context: context,
            width: MediaQuery.of(context).size.width,
            buttonName: 'Save and continue',
            buttonColour: Colors.black,
            buttonAction: () {})
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }
}
