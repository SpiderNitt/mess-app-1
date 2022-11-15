

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'dart:io';

class ScanQrPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  Barcode? result;
  QRViewController? controller;
  TextEditingController? search;
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  String mealtime='Lunch';
  String scannedresult='';

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);

    });
  }
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();

      setState(() {
        scannedresult=result!.code.toString();
      });

      print(scannedresult);
      //Show an alert box here ,alert box had issues so Using snackbar temporarily

      showDialog(context: context, builder: (BuildContext context) {
        return alertDialog('Nitin sucks');
      });
/*
       final snackBar = SnackBar(
        content:  Text('$scannedresult'),
        action: SnackBarAction(
          label: 'Scan next',
          onPressed: () {
            // Some code to undo the change.
            reassemble();
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

*/
      controller!.dispose();



    }
  }


  @override
  Widget build(BuildContext context) {
    readQr();
    return Scaffold(
      body:
      Stack(
        alignment: Alignment.center,
        children: <Widget>[
          //this is the qr scanner view...with camera background
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.orange,
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 250,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30.0,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: search,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                    ),
                    labelText: 'Rollno',
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text('Scan the QR-code',
                style: TextStyle(fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white60
                ),
              ),
              SizedBox(height: 20.0,),



            ],
          ),
          Positioned(
            bottom: 70,
            child: Column(children: [
              SizedBox(height: 20.0,),
              Text("Scanning for",style: TextStyle(color: Colors.white54),),
              SizedBox(height: 15.0,),
              Text("$mealtime",
                style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                    color:  Colors.white54
                ),
              ),
              SizedBox(height: 25.0,),
              IconButton(onPressed: (){
                reassemble();
              }, icon: Icon(Icons.update_rounded,
                color: Colors.white70,
                size: 40.0,),),
              SizedBox(height: 35.0,),
            ],),
          ),
        ],
      ),



    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


/*
showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Sucess\n$scannedresult',
              style: TextStyle(
                  color: Colors.black
              ),),
          );
        },
      );
      */

Widget alertDialog(String text){
  return AlertDialog(
    content: Text(text,
      style: TextStyle(
          color: Colors.black
      ),),
  );
}