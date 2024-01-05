import 'package:bloc_auth/app/app.dart';
import 'package:bloc_auth/app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    App.new,
  );
}
