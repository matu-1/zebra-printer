import 'package:socket_io/socket_io.dart';
import 'package:zebra_printer/data/zpl.dart';
import 'package:zebra_printer/utils/zebra_utility.dart';
import 'package:zebrautility/ZebraPrinter.dart';

class ZebraPrinterService {
  late ZebraPrinter _zebraPrinter;
  late String macAddress;
  ZebraPrinterService.withParameters(this.macAddress);
  ZebraPrinterService.withoutParameters() {
    this.macAddress = "58:93:D8:31:04:C9";
  }
  void initialize() async {
    _zebraPrinter = await ZebraUtility.getPrinterInstance(
        onPrinterFound: onPrinterFound,
        onPrinterDiscoveryDone: onPrinterDiscoveryDone,
        onChangePrinterStatus: onChangePrinterStatus,
        onPermissionDenied: onPermissionDenied);
    _zebraPrinter.discoveryPrinters();
    _zebraPrinter.connectToPrinter(this.macAddress);
  }

  void printTest(data) {
    print("se llamo printtest");
    _zebraPrinter.print(testZPL);
  }

  dynamic socketEvent(Socket socket) {
    print("id del cliente");
    print(socket.id);
    socket.on('print', (data) => printTest(data));
  }

  dynamic onPrinterFound = (name, ipAddress, bool isWifi) {
    print("PrinterFound :" + name + ipAddress);
  };
  dynamic onPrinterDiscoveryDone = () {
    print("Discovery Done");
  };
  dynamic onChangePrinterStatus = (status, color) {
    print("change printer status: " + status + color);
  };
  dynamic onPermissionDenied = () {
    print("Permission Deny.");
  };
}
