import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;

void main() {
  var handler = const shelf.Pipeline().addMiddleware(shelf.logRequests())
      .addHandler(_echoRequest);

  io.serve(handler, 'localhost', 8080).then((server) {
    print('Serving at http://${server.address.host}:${server.port}');
  });
}

shelf.Response _echoRequest(shelf.Request request) {
  return new shelf.Response.ok('Request for "${request.url}"');
}


void main() {
  var myRouter = router()
    ..get('/', (_) => new Response.ok("Hello World"));

  io.serve(myRouter.handler, 'localhost', 8080);
}
shelf.Response _echoRequest(shelf.Request request) {
  return new shelf.Response.ok('Request for "${request.url}"');
}


import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_route/shelf_route.dart';

void main() {
  var myRouter = router()
    ..get('/', responseRoot)
    ..get('/stu', (_) => new Response.ok("Hello Stu"));
  io.serve(myRouter.handler, 'localhost', 8080);
}
responseRoot(_){
  return new Response.ok("Hello World");
}
