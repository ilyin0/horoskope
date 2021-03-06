
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'horoskope_localizations_en.dart';

/// Callers can lookup localized strings with an instance of HoroskopeLocalizations returned
/// by `HoroskopeLocalizations.of(context)`.
///
/// Applications need to include `HoroskopeLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/horoskope_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HoroskopeLocalizations.localizationsDelegates,
///   supportedLocales: HoroskopeLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
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
/// be consistent with the languages listed in the HoroskopeLocalizations.supportedLocales
/// property.
abstract class HoroskopeLocalizations {
  HoroskopeLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HoroskopeLocalizations? of(BuildContext context) {
    return Localizations.of<HoroskopeLocalizations>(context, HoroskopeLocalizations);
  }

  static const LocalizationsDelegate<HoroskopeLocalizations> delegate = _HoroskopeLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @horoskope.
  ///
  /// In en, this message translates to:
  /// **'Horoskope'**
  String get horoskope;

  /// No description provided for @homePage.
  ///
  /// In en, this message translates to:
  /// **'Home Page'**
  String get homePage;

  /// No description provided for @compatibility.
  ///
  /// In en, this message translates to:
  /// **'Compatibility'**
  String get compatibility;

  /// No description provided for @aboutYou.
  ///
  /// In en, this message translates to:
  /// **'About You'**
  String get aboutYou;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @stillDontHaveAnAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Still don\'t have an account?'**
  String get stillDontHaveAnAccountQuestion;

  /// No description provided for @alreadyHaveAnAccountQuestion.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccountQuestion;

  /// No description provided for @whatIsYourNameQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is your name?'**
  String get whatIsYourNameQuestion;

  /// No description provided for @whenWereYouBornQuestion.
  ///
  /// In en, this message translates to:
  /// **'When were you born?'**
  String get whenWereYouBornQuestion;

  /// No description provided for @whereWereYouBornQuestion.
  ///
  /// In en, this message translates to:
  /// **'Where were you born?'**
  String get whereWereYouBornQuestion;

  /// No description provided for @theTimeYouWereBorn.
  ///
  /// In en, this message translates to:
  /// **'The time you were born'**
  String get theTimeYouWereBorn;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @addFriend.
  ///
  /// In en, this message translates to:
  /// **'Add Friend'**
  String get addFriend;

  /// No description provided for @checkOutTheCompatibility.
  ///
  /// In en, this message translates to:
  /// **'Check out the compatibility!'**
  String get checkOutTheCompatibility;

  /// No description provided for @checkOutTheCompatibilityDescription.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam porta porttitor tortor, eget efficitur nibh pharetra eget. Maecenas ultrices sagittis risus, vitae venenatis elit volutpat quis. In id feugiat nisl'**
  String get checkOutTheCompatibilityDescription;

  /// No description provided for @whatIsYourFriendNameQuestion.
  ///
  /// In en, this message translates to:
  /// **'What is your friends name?'**
  String get whatIsYourFriendNameQuestion;

  /// No description provided for @whenWasYourFriendBornQuestion.
  ///
  /// In en, this message translates to:
  /// **'When was your friend born?'**
  String get whenWasYourFriendBornQuestion;

  /// No description provided for @whereWasYourFriendBornQuestion.
  ///
  /// In en, this message translates to:
  /// **'Where was your friend born?'**
  String get whereWasYourFriendBornQuestion;

  /// No description provided for @theTimeYourFriendWasBorn.
  ///
  /// In en, this message translates to:
  /// **'The time your friend was born'**
  String get theTimeYourFriendWasBorn;
}

class _HoroskopeLocalizationsDelegate extends LocalizationsDelegate<HoroskopeLocalizations> {
  const _HoroskopeLocalizationsDelegate();

  @override
  Future<HoroskopeLocalizations> load(Locale locale) {
    return SynchronousFuture<HoroskopeLocalizations>(lookupHoroskopeLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_HoroskopeLocalizationsDelegate old) => false;
}

HoroskopeLocalizations lookupHoroskopeLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return HoroskopeLocalizationsEn();
  }

  throw FlutterError(
    'HoroskopeLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
