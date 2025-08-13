import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'ITI Graduation Project'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @questions.
  ///
  /// In en, this message translates to:
  /// **'Questions'**
  String get questions;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @itiFayoum.
  ///
  /// In en, this message translates to:
  /// **'ITI Fayoum'**
  String get itiFayoum;

  /// No description provided for @learningTracks.
  ///
  /// In en, this message translates to:
  /// **'Learning Tracks'**
  String get learningTracks;

  /// No description provided for @searchTracks.
  ///
  /// In en, this message translates to:
  /// **'Search Tracks'**
  String get searchTracks;

  /// No description provided for @itiLearningResources.
  ///
  /// In en, this message translates to:
  /// **'ITI Learning Resources'**
  String get itiLearningResources;

  /// No description provided for @searchLearningMaterials.
  ///
  /// In en, this message translates to:
  /// **'Search learning materials'**
  String get searchLearningMaterials;

  /// No description provided for @commonQuestions.
  ///
  /// In en, this message translates to:
  /// **'Common Questions'**
  String get commonQuestions;

  /// No description provided for @searchForQuestions.
  ///
  /// In en, this message translates to:
  /// **'Search for questions'**
  String get searchForQuestions;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'Change Language'**
  String get changeLanguage;

  /// No description provided for @themeSetting.
  ///
  /// In en, this message translates to:
  /// **'Theme Setting'**
  String get themeSetting;

  /// No description provided for @starredQuestions.
  ///
  /// In en, this message translates to:
  /// **'Starred Questions'**
  String get starredQuestions;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @welcomeToItiFayoum.
  ///
  /// In en, this message translates to:
  /// **'Welcome to ITI Fayoum'**
  String get welcomeToItiFayoum;

  /// No description provided for @pleaseSelectYourAccountType.
  ///
  /// In en, this message translates to:
  /// **'Please select your account type'**
  String get pleaseSelectYourAccountType;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin;

  /// No description provided for @superAdmin.
  ///
  /// In en, this message translates to:
  /// **'Super Admin'**
  String get superAdmin;

  /// No description provided for @selectYourRoleToProceedToLogin.
  ///
  /// In en, this message translates to:
  /// **'Select your role to proceed to login'**
  String get selectYourRoleToProceedToLogin;

  /// No description provided for @studentsAndCourseParticipants.
  ///
  /// In en, this message translates to:
  /// **'Students and course participants'**
  String get studentsAndCourseParticipants;

  /// No description provided for @courseInstructorsAndStaffMembers.
  ///
  /// In en, this message translates to:
  /// **'Course instructors and staff members'**
  String get courseInstructorsAndStaffMembers;

  /// No description provided for @systemAdministratorsAndManagers.
  ///
  /// In en, this message translates to:
  /// **'System administrators and managers'**
  String get systemAdministratorsAndManagers;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
