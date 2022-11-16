

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


    Future.delayed(const Duration(milliseconds: 500), () {
    showDialog(
    context: context,
    builder: (context) => successDialogue()//alertdialogue
    );//show dialogue
    });
      //controller!.dispose();
    }
  }

AlertDialog successDialogue(){
    return AlertDialog(
      title: Column
        (
        children: [
          Image.asset('assets/images/success_tick_icon.png'),
          Text("Success",style: TextStyle(color: Colors.green),)
        ],),
      content: SingleChildScrollView(
        child: Text("Roll no  $scannedresult scanned successfully"),
      ),
      actions: <Widget>[Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 8.0,),
          Expanded(
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pop();//todo:navigate to dashboard !it should go to the dashboard!
              reassemble();//todo: remove this reassamble line once dashboard page is linked
                  },
                child: Text("cancel",style: TextStyle(fontWeight: FontWeight.bold),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white30),

              ),
            ),
          ),
          SizedBox(width: 8.0,),
          Expanded(
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
              reassemble();
            },
                child: Text("Scan Next",style:
                TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
                ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
              ),
            ),
          ),
          SizedBox(width: 8.0,),
        ],
      )],
    );
}

  AlertDialog errorDialogue(){
    return AlertDialog(
      title: Column
        (
        children: [
          Icon(Icons.error,color: Colors.red,size: 110.0,),
          Text("Error",style: TextStyle(color: Colors.red),)
        ],),
      content: SingleChildScrollView(
        child: Text("Some Error occured"),
      ),
      actions: <Widget>[Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 8.0,),
          Expanded(
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pop();//todo:navigate to dashboard !it should go to the dashboard!
              reassemble();//todo: remove this reassamble line once dashboard page is linked
            },
              child: Text("cancel",style: TextStyle(fontWeight: FontWeight.bold),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white30),

              ),
            ),
          ),
          SizedBox(width: 8.0,),
          Expanded(
            child: ElevatedButton(onPressed: (){
              Navigator.of(context).pop();
              reassemble();
            },
              child: Text("Try Again",style:
              TextStyle(fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
            ),
          ),
          SizedBox(width: 8.0,),
        ],
      )],
    );
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
                  style: TextStyle(color: Colors.lightBlueAccent,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  controller: search,
                  decoration: InputDecoration(
                    fillColor: Colors.red,
                    labelStyle: TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4.0))
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