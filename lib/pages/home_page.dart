// import 'package:zebra_printer/data/zpl.dart';
// import 'package:zebra_printer/utils/zebra_utility.dart';
// import 'package:zebrautility/ZebraPrinter.dart';
import 'package:flutter/material.dart';
import 'package:socket_io/socket_io.dart';
import 'package:zebra_printer/services/socket_server_service.dart';
import 'package:zebra_printer/services/zebra_printer_service.dart';

class HomePage extends StatefulWidget {
  static final routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ZebraPrinterService _zebraPrinter =
      new ZebraPrinterService.withoutParameters();
  final SockerServerService _sockerServer =
      new SockerServerService.withoutParameters();

  @override
  void initState() {
    super.initState();
    _sockerServer.createSocketServer(this._zebraPrinter.socketEvent);
    // eventsSocker();
  }

  @override
  void dispose() {
    super.dispose();
    _sockerServer.deleteSocketServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zebra printer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomButton(
              title: 'Conectarse',
              onPressed: _zebraPrinter.initialize,
            ),
            CustomButton(
              title: 'Imprimir',
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }

/*   void receiveEvent(Socket socket) {
    print("id del cliente");
    print(socket.id);
    socket.on('print', (data) => _zebraPrinter.printTest());
  } */

  // void _initialize() async {
  //   _zebraPrinter = await ZebraUtility.getPrinterInstance(
  //       onPrinterFound: onPrinterFound,
  //       onPrinterDiscoveryDone: onPrinterDiscoveryDone,
  //       onChangePrinterStatus: onChangePrinterStatus,
  //       onPermissionDenied: onPermissionDenied);
  //   _zebraPrinter.discoveryPrinters();
  //   _zebraPrinter.connectToPrinter("58:93:D8:31:04:C9");
  // }

  // void _printTest() {
  //   _zebraPrinter.print(testZPL);
  // }

  // dynamic onPrinterFound = (name, ipAddress, bool isWifi) {
  //   print("PrinterFound :" + name + ipAddress);
  // };

  // Function onPrinterDiscoveryDone = () {
  //   print("Discovery Done");
  // };

  // dynamic onChangePrinterStatus = (status, color) {
  //   print("change printer status: " + status + color);
  // };

  // Function onPermissionDenied = () {
  //   print("Permission Deny.");
  // };

  // void eventsSocker() {
  //   Socket? client = _sockerServer.client;
  //   if (client != null) client.on('print', _printFactura);
  // }

  // dynamic _printFactura(dynamic data) {
  //   _zebraPrinter.print(data);
  // }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color textColor;
  final VoidCallback? onPressed;
  const CustomButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        color: Theme.of(context).primaryColor,
        onPressed: this.onPressed,
        child: Text(this.title),
        textColor: this.textColor,
      ),
    );
  }
}
