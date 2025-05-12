import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/bottomSheetApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class MyLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    DialogApp dialogApp = new DialogApp();
    BottomSheetApp bottomSheetApp = new BottomSheetApp();
    return Consumer<Control>(builder: (context, val, child) {
      return val.kGooglePlexUser.target.latitude == 0.0 && val.allRegion == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.hybrid,
              markers: val.mymarker,
              circles: val.circless,
              initialCameraPosition: val.kGooglePlexUser,
              onTap: (argument) {
                val.pinMarcker(argument.latitude, argument.longitude);
                val.long = argument.longitude;
                val.lat = argument.latitude;
                print("new location${val.lat}///${argument.latitude}");
              },
              onMapCreated: (GoogleMapController controller) {
                // val.controller.complete(controller);
                val.gmc = controller;
                print(" loca${val.gmc}");
              },
            );
    });
  }
}
