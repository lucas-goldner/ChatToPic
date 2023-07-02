import 'package:bloc_test/bloc_test.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_cubit.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';

class MockSharedPrefCubit extends MockCubit<SharedPrefState>
    implements SharedPrefCubit {}
