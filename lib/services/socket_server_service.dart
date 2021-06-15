import 'dart:async';
import 'package:socket_io/socket_io.dart';

class SockerServerService {
  late String port;
  late Server io;
  late Socket client;
  late bool isServerUp;

  SockerServerService.withoutParameters() {
    this.port = '50000';
    this.isServerUp = false;
  }

  void createSocketServer() {
    print("creando el nuevo servidor socket");
    if (this.isServerUp) return;
    this.io = new Server();
    this.io.on('connection', (socket) {
      client = socket;
      print('conectado con un cliente....');
      socket.on('msg', (data) {
        print('data from client =>');
        print(data);
        socket.emit('msg', "ok lo recibi dog");
      });
      socket.on("print", (data) {
        print("datos de impresion: ");
        print(data);
        socket.emit("print", "print desdel el server");
      });
    });

    print("escuchando ... en el puerto 50000");
    this.io.listen(50000);
    this.isServerUp = true;
  }

  void deleteSocketServer() {
    if (!this.isServerUp) return;
    print("eliminando el socket...");
    this.io.close();
    print("socket eliminado...");
    this.isServerUp = false;
  }

  FutureOr caca() {
    return null;
  }
}