// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Current location`
  String get Currentlocation {
    return Intl.message(
      'Current location',
      name: 'Currentlocation',
      desc: '',
      args: [],
    );
  }

  /// `Kuala Lumpur`
  String get KualaLumpur {
    return Intl.message(
      'Kuala Lumpur',
      name: 'KualaLumpur',
      desc: '',
      args: [],
    );
  }

  /// `Malaysia`
  String get Malaysia {
    return Intl.message(
      'Malaysia',
      name: 'Malaysia',
      desc: '',
      args: [],
    );
  }

  /// `Only for Today`
  String get OnlyforToday {
    return Intl.message(
      'Only for Today',
      name: 'OnlyforToday',
      desc: '',
      args: [],
    );
  }

  /// `30% Off`
  String get percent {
    return Intl.message(
      '30% Off',
      name: 'percent',
      desc: '',
      args: [],
    );
  }

  /// `All Food & Beverage`
  String get foodBeverage {
    return Intl.message(
      'All Food & Beverage',
      name: 'foodBeverage',
      desc: '',
      args: [],
    );
  }

  /// `By Only book for 1 hour`
  String get ByOnlybookfor1hour {
    return Intl.message(
      'By Only book for 1 hour',
      name: 'ByOnlybookfor1hour',
      desc: '',
      args: [],
    );
  }

  /// `Sponsored by Some random place`
  String get SponsoredbySomerandomplace {
    return Intl.message(
      'Sponsored by Some random place',
      name: 'SponsoredbySomerandomplace',
      desc: '',
      args: [],
    );
  }

  /// `Where do you want to work ?`
  String get Wherework {
    return Intl.message(
      'Where do you want to work ?',
      name: 'Wherework',
      desc: '',
      args: [],
    );
  }

  /// `Booking for:`
  String get Bookingfor {
    return Intl.message(
      'Booking for:',
      name: 'Bookingfor',
      desc: '',
      args: [],
    );
  }

  /// `Filters`
  String get filters {
    return Intl.message(
      'Filters',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `Popular Workspace`
  String get PopularWorkspace {
    return Intl.message(
      'Popular Workspace',
      name: 'PopularWorkspace',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get Seeall {
    return Intl.message(
      'See all',
      name: 'Seeall',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: '',
      args: [],
    );
  }

  /// `Your Name`
  String get yourname {
    return Intl.message(
      'Your Name',
      name: 'yourname',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile Information`
  String get EditProfileInformation {
    return Intl.message(
      'Edit Profile Information',
      name: 'EditProfileInformation',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get Notification {
    return Intl.message(
      'Notification',
      name: 'Notification',
      desc: '',
      args: [],
    );
  }

  /// `ON`
  String get on {
    return Intl.message(
      'ON',
      name: 'on',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: '',
      args: [],
    );
  }

  /// `En`
  String get en {
    return Intl.message(
      'En',
      name: 'en',
      desc: '',
      args: [],
    );
  }

  /// `ar`
  String get ar {
    return Intl.message(
      'ar',
      name: 'ar',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get Security {
    return Intl.message(
      'Security',
      name: 'Security',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get Theme {
    return Intl.message(
      'Theme',
      name: 'Theme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `Help & Support`
  String get help {
    return Intl.message(
      'Help & Support',
      name: 'help',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact {
    return Intl.message(
      'Contact Us',
      name: 'contact',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Select Theme`
  String get SelectTheme {
    return Intl.message(
      'Select Theme',
      name: 'SelectTheme',
      desc: '',
      args: [],
    );
  }

  /// `General Notification`
  String get general {
    return Intl.message(
      'General Notification',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `Sound`
  String get sound {
    return Intl.message(
      'Sound',
      name: 'sound',
      desc: '',
      args: [],
    );
  }

  /// `Vibrate`
  String get vib {
    return Intl.message(
      'Vibrate',
      name: 'vib',
      desc: '',
      args: [],
    );
  }

  /// `App Update`
  String get update {
    return Intl.message(
      'App Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Bill Reminder`
  String get reminder {
    return Intl.message(
      'Bill Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Promotion`
  String get promotion {
    return Intl.message(
      'Promotion',
      name: 'promotion',
      desc: '',
      args: [],
    );
  }

  /// `Discount Available`
  String get discount {
    return Intl.message(
      'Discount Available',
      name: 'discount',
      desc: '',
      args: [],
    );
  }

  /// `Payment Request`
  String get payment {
    return Intl.message(
      'Payment Request',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `New Service Available`
  String get newservice {
    return Intl.message(
      'New Service Available',
      name: 'newservice',
      desc: '',
      args: [],
    );
  }

  /// `New Tips Available`
  String get newtips {
    return Intl.message(
      'New Tips Available',
      name: 'newtips',
      desc: '',
      args: [],
    );
  }

  /// `Common`
  String get common {
    return Intl.message(
      'Common',
      name: 'common',
      desc: '',
      args: [],
    );
  }

  /// `System & Services Update`
  String get system {
    return Intl.message(
      'System & Services Update',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Others`
  String get others {
    return Intl.message(
      'Others',
      name: 'others',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
