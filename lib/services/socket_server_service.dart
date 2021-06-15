import 'dart:async';
import 'package:socket_io/socket_io.dart';

class SockerServerService {
  late String port;
  late Server io;
  late Socket client;
  late bool isServerUp;
  late dynamic printData;

  SockerServerService.withoutParameters() {
    this.port = '50000';
    this.isServerUp = false;
    this.printData = null;
  }
  SockerServerService(this.port);
  void createSocketServer(void Function(Socket) client) {
    print("creando el nuevo servidor socket");
    if (this.isServerUp) return;
    this.io = new Server();
    this.io.on('connection', (socket) {
      client(socket);
      print('conectado con un cliente....');
      // socket.on('msg', (data) {
      //   print('data from client =>');
      //   print(data);
      //   socket.emit('msg', "ok lo recibi dog");
      // });
      // socket.on("print", (data) {
      //   print("datos de impresion: ");
      //   print(data);
      //   setPrintData(data);
      //   socket.emit("print", "print desdel el server");
      // });
    });

    print("escuchando ... en el puerto 50000");
    this.io.listen(50000);
    this.isServerUp = true;
  }

  void deleteSocketServer() {
    if (!this.isServerUp) return;
    print("eliminando el servidor socket...");
    this.io.close();
    print("servidor socket eliminado...");
    this.isServerUp = false;
  }

  void setPrintData(data) {
    this.printData = data;
  }

  void getPrintData() {
    return this.printData;
  }
}
