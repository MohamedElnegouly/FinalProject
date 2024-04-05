part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppSettingsChangeTheme extends AppState {}

class AppSettingsChangeLanguage extends AppState{}

class AppSettingsChangeNotification extends AppState{}