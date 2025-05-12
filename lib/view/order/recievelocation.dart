import 'package:flutter/material.dart';
import 'package:hawy_altawsil/componant/bottomSheetApp.dart';
import 'package:hawy_altawsil/componant/buttonapp.dart';
import 'package:hawy_altawsil/componant/colorsApp.dart';
import 'package:hawy_altawsil/componant/dialogApp.dart';
import 'package:hawy_altawsil/prov/prov.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class ReceverLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorsApp colorsApp = new ColorsApp();
    DialogApp dialogApp = new DialogApp();
    BottomSheetApp bottomSheetApp = new BottomSheetApp();
    return Consumer<Control>(builder: (context, val, child) {
      return val.kGooglePlex_ReUser.target.latitude == 0.0 &&
              val.allRegion == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              mapType: MapType.hybrid,
              markers: val.mymarker_Re,
              circles: val.circless,
              initialCameraPosition: val.kGooglePlex_ReUser,
              onTap: (argument) {
                val.pinMarcker_Re(argument.latitude, argument.longitude);
                val.long_Re = argument.longitude;
                val.lat_Re = argument.latitude;
                print("new location${val.lat_Re}///${argument.latitude}");
              },
              onMapCreated: (GoogleMapController controller) {
                // val.controller.complete(controller);
                val.gmc_Re = controller;
                print(" loca${val.gmc_Re}");
              },
            );
    });
  }
}
