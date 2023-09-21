part of '../constants.dart';

class AppRoutes {
  static const splashPage = '/splashPage';
  static const authenticationPage = '/authPage';
  static const onboardingPage = '/onboardingPage';
  static const mainPage = '/mainPage';
  static const editProfilePage = '/editProfilePage';
  static const notificationPage = '/notificationPage';
  static const permissionPage = '/permissionPage';
  static const permissionDialog = '/permissionDialog';
  static const selectLanguagePage = '/selectLanguagePage';
  static const settingPage = '/settingPage';
  static const feedbackPage = '/feedbackPage';
  static const diagnosisPage = '/diagnosisPage';
  static const diagnosisResultPage = '/diagnosisResultPage';
  static const diagnosisHistoryPage = '/diagnosisHistoryPage';
  static const doctorAvaiblePage = '/doctorAvaibleScreen';
  static const informationPage = '/informationPage';
  static const userVerificationPage = '/userVerificationPage';
  static const attributionPage = '/attributionPage';
  static const changePasswordPage = '/changePasswordPage';
  static const themePage = '/themePage';
  static const legalNote = '/legalNotePage';
  static const aboutPage = '/aboutPage';
  static const creditPage = '/creditPage';
  static const introduceTutorialPage = '/introduceTutorialPage';

  static final getPages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.authenticationPage,
      page: () => const AuthenticationPage(),
      binding: AuthenticationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(name: AppRoutes.onboardingPage, page: () => const OnboardingPage(), binding: OnboardingBinding(), transition: Transition.fadeIn),
    GetPage(
      name: AppRoutes.mainPage,
      page: () => const HomePage(),
      binding: MainPageBinding(),
      transition: Transition.cupertinoDialog,
      transitionDuration: const Duration(milliseconds: 125),
    ),
    GetPage(name: AppRoutes.editProfilePage, page: () => const EditProfilePage(), transition: Transition.fadeIn, binding: EditProfileBinding()),

    GetPage(name: AppRoutes.permissionPage, page: () => const PermissionPage(), binding: PermissionBinding()),
    GetPage(
        name: AppRoutes.diagnosisHistoryPage,
        page: () => const DiagnosisHistoryPage(),
        binding: DiagnosticReportBinding(),
        transition: Transition.downToUp,
        transitionDuration: 500.milliseconds),

    GetPage(
        name: AppRoutes.diagnosisResultPage,
        binding: DiagnosisBinding(),
        page: () => const DiagnosisResultPage(),
        transition: Transition.downToUp,
        transitionDuration: 400.milliseconds),
    // GetPage(
    //   name: AppRoutes.pinCodeScreen,
    //   page: () => PinCodeScreen(),
    // ),
    GetPage(
      name: AppRoutes.selectLanguagePage,
      page: () => const ChangeLanguagePage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.settingPage,
      page: () => const SettingPage(),
      transition: Transition.fadeIn,
      showCupertinoParallax: false,
      preventDuplicates: false,
      // curve: Curves.decelerate,
      opaque: false,
    ),
    // GetPage(
    //   name: AppRoutes.imageUploadScreen,
    //   page: () => const ImageUploadScreen(),
    // ),
    GetPage(name: AppRoutes.feedbackPage, page: () => const FeedbackPage(), binding: FeedbackBinding(), transition: Transition.noTransition),
    GetPage(name: AppRoutes.diagnosisPage, page: () => const DiagnosisPage(), binding: DiagnosisBinding()),
    GetPage(
      name: AppRoutes.informationPage,
      page: () => const InformationPage(),
      binding: InformationBinding(),
      transition: Transition.fadeIn,
    ),

    GetPage(
      name: AppRoutes.doctorAvaiblePage,
      // parameters: data,
      page: () => const DoctorAvailablePage(),
      binding: MessageBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.userVerificationPage,
      page: () => const VerificationPage(),
      binding: VerificationBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.attributionPage,
      page: () => const AttributionPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.changePasswordPage,
      page: () => const ChangePasswordPage(),
      binding: ChangePasswordBinding(),
      transition: Transition.fadeIn,
      // binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.themePage,
      page: () => const ThemePage(),
      transition: Transition.fadeIn,
      binding: ThemeBinding(),
    ),

    GetPage(
      name: AppRoutes.legalNote,
      page: () => const LegalNotePage(),
      binding: LegalNoteBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.aboutPage,
      page: () => const AboutPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.creditPage,
      page: () => const CreditPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: AppRoutes.permissionDialog,
      page: () => const LegalNoteDialog(),
    ),
    GetPage(
      name: AppRoutes.introduceTutorialPage,
      page: () => const IntroduceTutorialPage(),
      transition: Transition.noTransition,
    ),
  ];
}
