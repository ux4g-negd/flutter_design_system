import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ux4g_flutter_components/ux4g_flutter_components.dart';
import 'package:widgetbook/widgetbook.dart';
import 'theme_notifier.dart';

import 'stories/avatar_stories.dart';
import 'stories/badge_stories.dart';
import 'stories/button_stories.dart';
import 'stories/utils_stories.dart';
import 'stories/welcome_page.dart';
import 'stories/data_stories.dart';
import 'stories/display_stories.dart';
import 'stories/feedback_stories.dart';
import 'stories/form_stories.dart';
import 'stories/identity_stories.dart';
import 'stories/layout_stories.dart';
import 'stories/navigation_stories.dart';
import 'stories/overlay_stories.dart';
import 'stories/biometric_stories.dart';
import 'stories/progress_stories.dart';
import 'stories/pattern_stories.dart';
import 'stories/notif_prefs_stories.dart';
import 'stories/notification/proactive_status_update_stories.dart';
import 'stories/consent_stories.dart';
import 'stories/declaration_before_submission/declaration_stories.dart';
import 'stories/application_and_submission/eligibility_check_wizard/eligibility_check_wizard_stories.dart';
import 'stories/application_and_submission/journey_progress_indicator/journey_progress_indicator_stories.dart';
import 'stories/application_and_submission/journey_progress_indicator/resume_journey_stories.dart';
import 'stories/application_and_submission/journey_progress_indicator/validation_error_stories.dart';
import 'stories/application_and_submission/government_form_with_validation/government_form_stories.dart';
import 'stories/application_and_submission/government_form_with_validation/government_form_errors_stories.dart';
import 'stories/application_and_submission/government_form_with_validation/government_form_multiple_errors_stories.dart';
import 'stories/application_and_submission/application_sent_stories.dart';
import 'stories/application_and_submission/document_scan_upload_stories.dart';
import 'stories/application_and_submission/document_upload_progress_stories.dart';
import 'stories/application_and_submission/document_upload_review_stories.dart';
import 'stories/application_and_submission/document_upload_success_stories.dart';
import 'stories/application_and_submission/save_and_resume_stories.dart';
import 'stories/application_and_submission/save_and_resume/continue_application_stories.dart';
import 'stories/application_and_submission/save_and_resume/resume_application_missing_info_stories.dart';
import 'stories/application_and_submission/save_and_resume/auto_save_form_stories.dart';
import 'stories/application_and_submission/save_and_resume/draft_expiry_form_stories.dart';
import 'stories/application_and_submission/save_and_resume/unsaved_changes_dialog_stories.dart';
import 'stories/application_and_submission/save_and_resume/discard_draft_dialog_stories.dart';
import 'stories/application_and_submission/submission_acknowledgement/application_submitted_stories.dart';
import 'stories/application_and_submission/submission_acknowledgement/application_queued_stories.dart';
import 'stories/application_and_submission/submission_acknowledgement/could_not_submit_stories.dart';
import 'stories/dashboard_and_my_application/my_applications/my_applications_stories.dart';
import 'stories/dashboard_and_my_application/my_applications/no_applications_stories.dart';
import 'stories/dashboard_and_my_application/my_applications/search_applications_stories.dart';
import 'stories/dashboard_and_my_application/my_applications/bulk_actions_stories.dart';
import 'stories/dashboard_and_my_application/pending_tasks/pending_tasks_stories.dart';
import 'stories/dashboard_and_my_application/pending_tasks/no_pending_tasks_stories.dart';
import 'stories/dashboard_and_my_application/citizen_profile_and_preferences/citizen_profile_stories.dart';
import 'stories/dashboard_and_my_application/citizen_profile_and_preferences/edit_profile_stories.dart';
import 'stories/dashboard_and_my_application/citizen_profile_and_preferences/delete_account_dialog_stories.dart';
import 'stories/search_and_discovery/search_and_browse/search_and_browse_stories.dart';
import 'stories/search_and_discovery/search_and_browse/search_with_results_stories.dart';
import 'stories/search_and_discovery/search_and_browse/search_results_list_stories.dart';
import 'stories/search_and_discovery/search_and_browse/no_results_stories.dart';
import 'stories/search_and_discovery/global_service_discovery/global_service_discovery_stories.dart';
import 'stories/search_and_discovery/global_service_discovery/category_service_list_stories.dart';
import 'stories/search_and_discovery/global_service_discovery/service_detail_stories.dart';
import 'stories/search_and_discovery/consultation_slot_booking/select_advocate_stories.dart';
import 'stories/search_and_discovery/consultation_slot_booking/select_appointment_time_stories.dart';
import 'stories/search_and_discovery/consultation_slot_booking/confirm_appointment_v2_stories.dart';
import 'stories/search_and_discovery/consultation_slot_booking/appointment_confirmed_stories.dart';
import 'stories/feedback_and_communication/inline_feedback_and_status_communication/inline_feedback_stories.dart';
import 'stories/feedback_and_communication/inline_feedback_and_status_communication/inline_feedback_error_stories.dart';
import 'stories/feedback_and_communication/inline_feedback_and_status_communication/inline_feedback_hint_stories.dart';
import 'stories/feedback_and_communication/inline_feedback_and_status_communication/inline_feedback_guidance_stories.dart';
import 'stories/feedback_and_communication/inline_feedback_and_status_communication/inline_feedback_verification_stories.dart';
import 'stories/feedback_and_communication/inline_feedback_and_status_communication/inline_feedback_note_stories.dart';
import 'stories/feedback_and_communication/service_completion_and_feedback/service_completion_stories.dart';
import 'stories/feedback_and_communication/service_completion_and_feedback/feedback_rating_stories.dart';
import 'stories/feedback_and_communication/service_completion_and_feedback/rate_experience_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/help_centre_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/faq_detail_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/contact_support_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/live_chat_support_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/file_complaint_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/find_service_centre_stories.dart';
import 'stories/feedback_and_communication/contact_and_support/was_this_helpful_stories.dart';
import 'stories/feedback_and_communication/language_switcher/language_switcher_stories.dart';
import 'stories/feedback_and_communication/language_switcher/inline_language_toggle_stories.dart';
import 'stories/feedback_and_communication/language_switcher/translation_unavailable_stories.dart';
import 'stories/feedback_and_communication/language_switcher/all_scheduled_languages_stories.dart';

void main() {
  runApp(const UX4GWidgetbook());
}

class UX4GWidgetbook extends StatelessWidget {
  const UX4GWidgetbook({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: widgetbookThemeNotifier,
      builder: (context, themeMode, _) {
        return Widgetbook.material(
          initialRoute: '?path=introduction/welcome',
          themeMode: themeMode,
          // ── No wrapper needed here as MaterialThemeAddon handles the theme ─────
          appBuilder: (context, child) => child,

          home: const Ux4gWelcomePage(),
          header: const _SidebarLogo(),

          directories: [
            overviewComponent,
            quickGuideComponent,

            // ── Token ─────────────────────────────────────────────────────────────
            WidgetbookCategory(
              name: 'Token',
              isInitiallyExpanded: false,
              children: [
                themeColorComponent,
                themeTypographyComponent,
                themeElevationComponent,
                WidgetbookFolder(
                  name: 'Dimensions',
                  isInitiallyExpanded: false,
                  children: [
                    dimensionsSpacingComponent,
                    dimensionsRadiusComponent,
                    dimensionsBorderComponent,
                  ],
                ),
              ],
            ),

            // ── Components ────────────────────────────────────────────────────────
            WidgetbookCategory(
              name: 'Components',
              isInitiallyExpanded: false,
              children: [
                WidgetbookFolder(
                  name: 'Accordion',
                  isInitiallyExpanded: false,
                  children: [accordionComponent, accordionGroupComponent],
                ),
                appHeaderComponent,
                WidgetbookFolder(
                  name: 'Avatar',
                  isInitiallyExpanded: false,
                  children: [
                    avatarComponent,
                    avatarGroupComponent,
                    profileAvatarComponent,
                    statusAvatarComponent,
                  ],
                ),
                badgeComponent,
                biometricComponent,
                buttonComponent,
                cardComponent,
                carouselComponent,
                checkboxComponent,
                WidgetbookFolder(
                  name: 'Chips',
                  isInitiallyExpanded: false,
                  children: [
                    choiceChipComponent,
                    filterChipComponent,
                    inputChipComponent,
                    inputChipFieldComponent,
                    chipGroupComponent,
                  ],
                ),
                datePickerComponent,
                dividerComponent,
                WidgetbookFolder(
                  name: 'Draft Status',
                  isInitiallyExpanded: false,
                  children: [statusBannerComponent],
                ),
                WidgetbookFolder(
                  name: 'Dropdown',
                  isInitiallyExpanded: false,
                  children: [
                    actionDropdownComponent,
                    selectionDropdownComponent,
                  ],
                ),
                emptyStateComponent,
                WidgetbookFolder(
                  name: 'Feedback',
                  isInitiallyExpanded: false,
                  children: [
                    feedbackFormStarComponent,
                    feedbackFormCsatComponent,
                    feedbackFormNpsComponent,
                  ],
                ),
                fileUploadComponent,
                WidgetbookFolder(
                  name: 'Input',
                  isInitiallyExpanded: false,
                  children: [inputFieldComponent],
                ),
                aadhaarInputFieldComponent,
                panInputFieldComponent,
                otpInputComponent,
                journeyTimelineComponent,
                modalComponent,
                paginationDottedComponent,
                WidgetbookFolder(
                  name: 'Progress Indicator',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'Circular Progress',
                      isInitiallyExpanded: false,
                      children: [
                        circularProgressComponent,
                        animatedCircularProgressComponent,
                        halfCircleProgressComponent,
                        animatedHalfCircleProgressComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Linear Progress Bar',
                      isInitiallyExpanded: false,
                      children: [
                        linearProgressBarComponent,
                        animatedLinearProgressBarComponent,
                      ],
                    ),
                  ],
                ),
                progressSlaIndicatorComponent,
                radioButtonComponent,
                resultListComponent, // Result List
                searchFieldComponent,
                sliderComponent,
                WidgetbookFolder(
                  name: 'Social Link',
                  isInitiallyExpanded: false,
                  children: [
                    socialLinkComponent,
                    socialLinkGroupComponent,
                    socialLinkListComponent,
                  ],
                ),
                spinnerComponent, // ux4gSpinner
                WidgetbookFolder(
                  name: 'Status Pipeline',
                  isInitiallyExpanded: false,
                  children: [statusPipelineComponent],
                ),
                WidgetbookFolder(
                  name: 'Stepper',
                  isInitiallyExpanded: false,
                  children: [stepperComponent, compactStepperComponent],
                ),
                toggleComponent, // Switch
                tagComponent,
                textAreaComponent,
                timePickerComponent,
                toastComponent,
                timeSlotComponent, // TimeSlot
                tooltipComponent,
              ],
            ),

            // ── Patterns ───────────────────────────────────────────────────────
            WidgetbookCategory(
              name: 'Patterns',
              isInitiallyExpanded: false,
              children: [
                WidgetbookFolder(
                  name: 'Identity and Access',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'SignIn',
                      isInitiallyExpanded: false,
                      children: [
                        signInDefaultComponent,
                        signInWithMobileComponent,
                        signInEnterOtpComponent,
                        signInAadhaarComponent,
                        signInSuccessComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'OTP Verification',
                      isInitiallyExpanded: false,
                      children: [
                        otpVerifyMobileComponent,
                        otpVerifyVoiceComponent,
                        otpVerifyAttemptWarningComponent,
                        otpVerifyLastAttemptComponent,
                        otpVerifyAccountLockedComponent,
                        otpVerifiedSuccessComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Session Time-out Dialog',
                      isInitiallyExpanded: false,
                      children: [sessionExpiringDialogComponent],
                    ),
                    WidgetbookFolder(
                      name: 'Auth errors & lockout',
                      isInitiallyExpanded: false,
                      children: [
                        authIncorrectOtpComponent,
                        authOtpAttemptWarningComponent,
                        authOtpLastAttemptComponent,
                        authOtpAccountLockedComponent,
                        authOtpRetryUnlockedComponent,
                        authOtpSuspiciousActivityComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Aadhaar Authentication Gate',
                      isInitiallyExpanded: false,
                      children: [
                        aadhaarVerifyMethodComponent,
                        aadhaarOtpEnterComponent,
                        aadhaarFaceAuthPermissionComponent,
                        aadhaarVerifiedSuccessComponent,
                        aadhaarVerificationFailedComponent,
                        aadhaarAccountLockedComponent,
                        operatorAssistedAuthComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'SignUp',
                      isInitiallyExpanded: false,
                      children: [
                        signUpStep1Component,
                        signUpStep2Component,
                        signUpStep3Component,
                        signUpStep4Component,
                        signUpStep5Component,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Forgot Password & Account Recovery',
                      children: [
                        fpStep1Component,
                        fpStep2Component,
                        fpStep3Component,
                        fpStep4Component,
                        fpStep5Component,
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'Notification',
                  isInitiallyExpanded: false,
                  children: [
                    notificationComponent,
                    reminderAlertsComponent,
                    WidgetbookFolder(
                      name: 'Notification Preferences',
                      isInitiallyExpanded: false,
                      children: [
                        notificationChannelsComponent,
                        updateFrequencyComponent,
                        perServiceComponent,
                        lockedNotificationsComponent,
                        whatsAppConsentComponent,
                        manageAllComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Proactive Status Update',
                      isInitiallyExpanded: false,
                      children: [
                        proactiveStatusBannerComponent,
                        proactiveStatusLiveComponent,
                        proactiveStatusReconnectingComponent,
                        proactiveStatusManualRefreshComponent,
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'Payment and Confirmation',
                  isInitiallyExpanded: false,
                  children: [
                    paymentSummaryComponent,
                    paymentMethodComponent,
                    paymentProcessingComponent,
                    paymentSuccessComponent,
                    paymentFailedComponent,
                    feeWaivedComponent,
                  ],
                ),
                WidgetbookFolder(
                  name: 'Status and Tracking',
                  isInitiallyExpanded: false,
                  children: [
                    appStatusTrackerComponent,
                    grievanceStatusTrackerComponent,
                  ],
                ),
                WidgetbookFolder(
                  name: 'Consent and Declaration',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'Consent Capture',
                      isInitiallyExpanded: false,
                      children: [
                        consentCaptureComponent,
                        consentCaptureWithWarningComponent,
                        consentManagementComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Data Sharing Consent',
                      isInitiallyExpanded: false,
                      children: [
                        dataSharingConsentComponent,
                        dataSharingConsentManagementComponent,
                        withdrawConsentDialogComponent,
                        consentHistoryComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Declaration Before Submission',
                      isInitiallyExpanded: false,
                      children: [
                        declarationBeforeSubmissionComponent,
                        declarationWithDigitalSignComponent,
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'Application and Submission',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'Save and Resume',
                      isInitiallyExpanded: false,
                      children: [
                        saveAndResumeComponent,
                        continueApplicationComponent,
                        resumeApplicationMissingInfoComponent,
                        autoSaveFormComponent,
                        draftExpiryFormComponent,
                        unsavedChangesDialogComponent,
                        discardDraftDialogComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Submission Acknowledgement',
                      isInitiallyExpanded: false,
                      children: [
                        applicationSubmittedComponent,
                        applicationQueuedComponent,
                        couldNotSubmitComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Document scan & upload',
                      isInitiallyExpanded: false,
                      children: [
                        documentScanUploadComponent,
                        documentUploadProgressComponent,
                        documentUploadReviewComponent,
                        documentUploadSuccessComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Eligibility Check Wizard',
                      isInitiallyExpanded: false,
                      children: [
                        eligibilityCheckWizardComponent,
                        eligibilityQuestionStepComponent,
                        eligibilityFinalQuestionStepComponent,
                        eligibilitySuccessStepComponent,
                        eligibilityFailureStepComponent,
                        eligibilityWarningStepComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Journey Progress Indicator',
                      isInitiallyExpanded: false,
                      children: [
                        journeyProgressIndicatorComponent,
                        resumeJourneyComponent,
                        validationErrorComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Government form with validation',
                      isInitiallyExpanded: false,
                      children: [
                        governmentFormWithValidationComponent,
                        governmentFormWithErrorsComponent,
                        governmentFormWithMultipleErrorsComponent,
                        applicationSentComponent,
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'Dashboard and My Application',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'My Applications',
                      isInitiallyExpanded: false,
                      children: [
                        myApplicationsComponent,
                        noApplicationsComponent,
                        searchApplicationsComponent,
                        bulkActionsComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Pending Tasks',
                      isInitiallyExpanded: false,
                      children: [
                        pendingTasksComponent,
                        noPendingTasksComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Citizen Profile and Preferences',
                      isInitiallyExpanded: false,
                      children: [
                        citizenProfileComponent,
                        editProfileComponent,
                        deleteAccountDialogComponent,
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'Search and Discovery',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'Search and Browse',
                      isInitiallyExpanded: false,
                      children: [
                        searchAndBrowseComponent,
                        searchWithResultsComponent,
                        searchResultsListComponent,
                        noResultsComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Global Service Discovery',
                      isInitiallyExpanded: false,
                      children: [
                        globalServiceDiscoveryComponent,
                        categoryServiceListComponent,
                        serviceDetailComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Consultation Slot Booking',
                      isInitiallyExpanded: false,
                      children: [
                        selectAdvocateComponent,
                        selectAppointmentTimeComponent,
                        confirmAppointmentV2Component,
                        appointmentConfirmedComponent,
                      ],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'Feedback and Communication',
                  isInitiallyExpanded: false,
                  children: [
                    WidgetbookFolder(
                      name: 'Inline Feedback and Status Communication',
                      isInitiallyExpanded: false,
                      children: [
                        inlineFeedbackComponent,
                        inlineFeedbackErrorComponent,
                        inlineFeedbackHintComponent,
                        inlineFeedbackGuidanceComponent,
                        inlineFeedbackVerificationComponent,
                        inlineFeedbackNoteComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Service Completion and Feedback',
                      isInitiallyExpanded: false,
                      children: [
                        serviceCompletionComponent,
                        feedbackRatingComponent,
                        rateExperienceComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Contact and Support',
                      isInitiallyExpanded: false,
                      children: [
                        helpCentreComponent,
                        faqDetailComponent,
                        contactSupportComponent,
                        liveChatSupportComponent,
                        fileComplaintComponent,
                        findServiceCentreComponent,
                        wasThisHelpfulComponent,
                      ],
                    ),
                    WidgetbookFolder(
                      name: 'Language Switcher',
                      isInitiallyExpanded: false,
                      children: [
                        languageSwitcherComponent,
                        inlineLanguageToggleComponent,
                        translationUnavailableComponent,
                        allScheduledLanguagesComponent,
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],

          addons: [
            // Device viewport sizes
            ViewportAddon([
              Viewports.none,
              IosViewports.iPhone13,
              IosViewports.iPhoneSE,
              AndroidViewports.samsungGalaxyS20,
              IosViewports.iPad,
            ]),
            // Light / Dark theme
            MaterialThemeAddon(
              themes: [
                WidgetbookTheme(
                  name: 'Light',
                  data: Ux4gTheme.themeData(isDark: false),
                ),
                WidgetbookTheme(
                  name: 'Dark',
                  data: Ux4gTheme.themeData(isDark: true),
                ),
              ],
            ),
            // Text scale accessibility
            TextScaleAddon(min: 0.75, max: 2.0),
            // Alignment helper
            AlignmentAddon(),
          ],
        );
      },
    );
  }
}

// ── Sidebar Logo ──────────────────────────────────────────────────────────

class _SidebarLogo extends StatelessWidget {
  const _SidebarLogo();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                // ignore: invalid_use_of_internal_member
                final state = WidgetbookState.of(context);
                state.updatePath('introduction/welcome');
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'assets/ux4g_logo.svg',
                      height: 34,
                      width: 34,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            final targetMode = isDark ? ThemeMode.light : ThemeMode.dark;
            widgetbookThemeNotifier.value = targetMode;
          },
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            size: 20,
            color: isDark ? Colors.amber : const Color(0xFF5A5A7A),
          ),
          tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
        ),
      ],
    );
  }
}
