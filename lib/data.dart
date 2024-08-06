import 'package:bi/featurs/favorite/presentaion/pages/favorite.dart';
import 'package:bi/featurs/search/presentaion/pages/search_screen.dart';
import 'package:bi/generated/locale_keys.g.dart';
import 'package:bi/localization/change_language.dart';
import 'featurs/homeScreen/presentaion/pages/home_screen.dart';
import 'featurs/top/presentaion/pages/top_rated.dart';
import 'generated/assets.dart';

final List bodyScreens = [
  const HomeScreen(),
  const SearchScreen(),
  const FavoriteScreen(),
  const TopRatedScreen(),
];
List bottomNavBarData = [
  {'icon': Assets.iconsHome, 'label': LocaleKeys.home.tre, 'active':Assets.iconsHome,},
  {'icon': Assets.iconsSearch, 'label': LocaleKeys.search.tre, 'active': Assets.iconsSearch,},
  {'icon':  Assets.iconsOffera,'label': LocaleKeys.favorite.tre, 'active':  Assets.iconsOffera,},
  {
    'icon': Assets.iconsHelp,
    'label': LocaleKeys.top_rated.tre,
    'active': Assets.iconsHelp,

  },
];

const String apiKey='3062138b73f3537d2f7dad556ee542e5';