import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  void themeChanged(){
    emit(AppSettingsChangeTheme());
  }
  void languageChanged(){
    emit(AppSettingsChangeLanguage());
  }
  void notificationChanged(){
    emit(AppSettingsChangeNotification());
  }
}