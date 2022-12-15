import 'dart:async';

import 'package:demo1/src/constants/asset.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../services/common.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  static const CameraPosition _initMap = CameraPosition(
    target: LatLng(13.7462463, 100.5325515),
    zoom: 20,
  );

  final Completer<GoogleMapController> _controller = Completer();
  StreamSubscription<LocationData>? _locationSubscription;
  final _locationService = Location();
  final Set<Marker> _markers = {};
  final Set<Polygon> _polygons = {};

  final List<LatLng> _dummyLatLng = [
    LatLng(13.729336912458525, 100.57422749698162),
    LatLng(13.724325366482798, 100.58511726558208),
    LatLng(13.716931129483003, 100.57489234954119),
    LatLng(13.724794053328308, 100.56783076375723),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buildSingleMarker(position: LatLng(13.7462463, 100.5325515));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Header(),
          Expanded(
            child: GoogleMap(
              markers: _markers,
              onTap: (latLng) => _buildSingleMarker(position: latLng),
              mapType: MapType.normal,
              initialCameraPosition: _initMap,
            ),
          )
        ],
      ),
    );
  }

  _buildSingleMarker({required LatLng position}) async {
    final Uint8List markerIcon = await getBytesFromAsset(Asset.pinBikerImage, width: 150);
    final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(markerIcon);

    _markers.add(
      Marker(
        icon: bitmap,
        markerId: MarkerId(position.toString()),
        position: position,
      ),
    );

    setState(() {});
  }

  Header() {
    return Container(
        color: Colors.black87,
        child: Image.asset(
          Asset.logoImage,
          height: 100,
          width: double.infinity,
        ));
  }
}
