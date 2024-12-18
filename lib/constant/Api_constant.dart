class ApiConstant {
  static final String baseUrl = 'https://seekforms-backend-copy.onrender.com';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();
}
class _AuthEndPoints{
  final String changePassword = '/mobileApi/change-password';
  final String getProfile = '/mobileApi/profile';
  final String updateProfile = '/mobileApi/profile';
  final String fetchPrivateJobs = '/admin/jobpost/private-job-list';
  final String fetchGovernmentCategory = '/admin/jobpost/government-category';
  final String fetchGovernmentJobs = '/admin/jobpost/government-job-list';
  final String applyJob = '/mobileApi/post-applicant';
  final String fetchAppliedJobs = '/mobileApi/get-applicant';
  final String getIgnouDetails = '/admin/ignou/get-forms';
  final String getEntranceExamDetails = '/admin/exam/get-exams';
  final String saveLater = '/mobileApi/draft-applicant';
  final String removeSaveLater = '/mobileApi/delete-draft-applicant';
  final String applySaveLaterJob = '/mobileApi/update-draft-applicant';
  final String getHomepageData = '/mobileApi/home';
  final String getCounsellingData = '/admin/counsellor/get-counsellors';
  final String getSubscriptionDetails = '/admin/paid-services/get-paid-services';
  final String filterData = '/admin/jobpost/filter-data';
  final String mockTestCategory = '/admin/mock-test/get-test-list';
  final String mockQuestions='/admin/mock-test/get-questions';
  final String submitAnswer = '/mobileApi/test/submit-answer';
}