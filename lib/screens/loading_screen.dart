import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
           bool isGranted =  await Permission.location.isGranted;
           if(isGranted){
            //Get the current location
            getLocation();}
            else{
          PermissionStatus status = await Permission.location.request();
          if(status.isGranted){
              //Get the current location
            getLocation();
          }
          else{
            print('Get Location Manually');
          }
            }
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
