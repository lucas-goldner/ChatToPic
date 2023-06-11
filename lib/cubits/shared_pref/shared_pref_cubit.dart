import 'package:bloc/bloc.dart';
import 'package:chattopic/cubits/shared_pref/shared_pref_state.dart';
import 'package:chattopic/model/enum/favorite_color.dart';
import 'package:chattopic/model/enum/shared_pref_key.dart';
import 'package:chattopic/providers/shared_pref_provider.dart';

class SharedPrefCubit extends Cubit<SharedPrefState> {
  final SharedPrefProvider sharedPrefProvider;

  SharedPrefCubit(this.sharedPrefProvider) : super(const SharedPrefInitial());

  void getFavoriteColor() {
    print(sharedPrefProvider.getSharedPref(SharedPrefKey.favColor));
  }

  void setFavoriteColor(FavoriteColor color) {
    sharedPrefProvider.setStringInSharedPrefs(
      SharedPrefKey.favColor,
      color.toString(),
    );
    emit(SharedPrefLoaded(color));
  }
}
