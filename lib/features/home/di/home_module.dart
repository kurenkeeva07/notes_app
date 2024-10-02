import '../../../core/di/dependency_injection.dart';
import '../presentation/cubit/home_cubit.dart';

void initHomeModule() {
  getIt.registerFactory(() => HomeCubit());
}
