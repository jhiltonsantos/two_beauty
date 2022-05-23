import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:two_beauty/core/injection/injection.config.dart';

// https://blog.logrocket.com/dependency-injection-flutter-using-getit-injectable/
// flutter pub run build_runner build --delete-conflicting-outputs

final getIt = GetIt.instance;

@InjectableInit()
void configureDependencies() => $initGetIt(getIt);
