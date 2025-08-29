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
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
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
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ITI Graduation Project`
  String get appTitle {
    return Intl.message(
      'ITI Graduation Project',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Resources`
  String get resources {
    return Intl.message('Resources', name: 'resources', desc: '', args: []);
  }

  /// `Questions`
  String get questions {
    return Intl.message('Questions', name: 'questions', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `ITI Fayoum`
  String get itiFayoum {
    return Intl.message('ITI Fayoum', name: 'itiFayoum', desc: '', args: []);
  }

  /// `Learning Tracks`
  String get learningTracks {
    return Intl.message(
      'Learning Tracks',
      name: 'learningTracks',
      desc: '',
      args: [],
    );
  }

  /// `Search Tracks`
  String get searchTracks {
    return Intl.message(
      'Search Tracks',
      name: 'searchTracks',
      desc: '',
      args: [],
    );
  }

  /// `ITI Learning Resources`
  String get itiLearningResources {
    return Intl.message(
      'ITI Learning Resources',
      name: 'itiLearningResources',
      desc: '',
      args: [],
    );
  }

  /// `Search learning materials`
  String get searchLearningMaterials {
    return Intl.message(
      'Search learning materials',
      name: 'searchLearningMaterials',
      desc: '',
      args: [],
    );
  }

  /// `Common Questions`
  String get commonQuestions {
    return Intl.message(
      'Common Questions',
      name: 'commonQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Search for questions`
  String get searchForQuestions {
    return Intl.message(
      'Search for questions',
      name: 'searchForQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Theme Setting`
  String get themeSetting {
    return Intl.message(
      'Theme Setting',
      name: 'themeSetting',
      desc: '',
      args: [],
    );
  }

  /// `Starred Questions`
  String get starredQuestions {
    return Intl.message(
      'Starred Questions',
      name: 'starredQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Welcome to ITI Fayoum`
  String get welcomeToItiFayoum {
    return Intl.message(
      'Welcome to ITI Fayoum',
      name: 'welcomeToItiFayoum',
      desc: '',
      args: [],
    );
  }

  /// `Please select your account type`
  String get pleaseSelectYourAccountType {
    return Intl.message(
      'Please select your account type',
      name: 'pleaseSelectYourAccountType',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user {
    return Intl.message('User', name: 'user', desc: '', args: []);
  }

  /// `Admin`
  String get admin {
    return Intl.message('Admin', name: 'admin', desc: '', args: []);
  }

  /// `Super Admin`
  String get superAdmin {
    return Intl.message('Super Admin', name: 'superAdmin', desc: '', args: []);
  }

  /// `Select your role to proceed to login`
  String get selectYourRoleToProceedToLogin {
    return Intl.message(
      'Select your role to proceed to login',
      name: 'selectYourRoleToProceedToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Students and course participants`
  String get studentsAndCourseParticipants {
    return Intl.message(
      'Students and course participants',
      name: 'studentsAndCourseParticipants',
      desc: '',
      args: [],
    );
  }

  /// `Course instructors and staff members`
  String get courseInstructorsAndStaffMembers {
    return Intl.message(
      'Course instructors and staff members',
      name: 'courseInstructorsAndStaffMembers',
      desc: '',
      args: [],
    );
  }

  /// `System administrators and managers`
  String get systemAdministratorsAndManagers {
    return Intl.message(
      'System administrators and managers',
      name: 'systemAdministratorsAndManagers',
      desc: '',
      args: [],
    );
  }

  /// `Add Question`
  String get addQuestion {
    return Intl.message(
      'Add Question',
      name: 'addQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Question submitted successfully`
  String get questionSubmittedSuccessfully {
    return Intl.message(
      'Question submitted successfully',
      name: 'questionSubmittedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error submitting question`
  String get errorSubmittingQuestion {
    return Intl.message(
      'Error submitting question',
      name: 'errorSubmittingQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get questionTitle {
    return Intl.message('Title', name: 'questionTitle', desc: '', args: []);
  }

  /// `Enter question title`
  String get questionTitleHint {
    return Intl.message(
      'Enter question title',
      name: 'questionTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get questionDescription {
    return Intl.message(
      'Description',
      name: 'questionDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter question description`
  String get questionDescriptionHint {
    return Intl.message(
      'Enter question description',
      name: 'questionDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `This field is required`
  String get requiredField {
    return Intl.message(
      'This field is required',
      name: 'requiredField',
      desc: '',
      args: [],
    );
  }

  /// `Send Question`
  String get save {
    return Intl.message('Send Question', name: 'save', desc: '', args: []);
  }

  /// `Admin Dashboard`
  String get adminDashboard {
    return Intl.message(
      'Admin Dashboard',
      name: 'adminDashboard',
      desc: '',
      args: [],
    );
  }

  /// `Add New Question`
  String get addNewQuestion {
    return Intl.message(
      'Add New Question',
      name: 'addNewQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Manage User Questions`
  String get manageUserQuestions {
    return Intl.message(
      'Manage User Questions',
      name: 'manageUserQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Pending Questions`
  String get pendingQuestions {
    return Intl.message(
      'Pending Questions',
      name: 'pendingQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Answered Questions`
  String get answeredQuestions {
    return Intl.message(
      'Answered Questions',
      name: 'answeredQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Answer submitted successfully`
  String get answerSubmittedSuccessfully {
    return Intl.message(
      'Answer submitted successfully',
      name: 'answerSubmittedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Answer Question`
  String get answerQuestion {
    return Intl.message(
      'Answer Question',
      name: 'answerQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Enter your answer`
  String get answerHint {
    return Intl.message(
      'Enter your answer',
      name: 'answerHint',
      desc: '',
      args: [],
    );
  }

  /// `Submit Answer`
  String get submitAnswer {
    return Intl.message(
      'Submit Answer',
      name: 'submitAnswer',
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
