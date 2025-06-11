
/// A class to access localized API error messages.
class ApiErrors {
  static String badRequestError(String lang) =>
      lang == 'ar'
          ? 'طلب غير صالح. يرجى التحقق من البيانات.'
          : 'Invalid request. Please check your inputs.';

  static String noContent(String lang) =>
      lang == 'ar' ? 'لا توجد بيانات متاحة.' : 'No content available.';

  static String forbiddenError(String lang) =>
      lang == 'ar'
          ? 'الوصول مرفوض. تحقق من صلاحياتك.'
          : 'Access forbidden. Please check your permissions.';

  static String unauthorizedError(String lang) =>
      lang == 'ar'
          ? 'الدخول غير مصرح به. يرجى تسجيل الدخول مجددًا.'
          : 'Unauthorized access. Please login again.';

  static String notFoundError(String lang) =>
      lang == 'ar'
          ? 'العنصر المطلوب غير موجود.'
          : 'Requested resource not found.';

  static String internalServerError(String lang) =>
      lang == 'ar'
          ? 'حدث خطأ في الخادم. حاول مرة أخرى لاحقًا.'
          : 'Server encountered an error. Please try again later.';

  static String timeoutError(String lang) =>
      lang == 'ar'
          ? 'انتهت مهلة الطلب. تحقق من الاتصال بالإنترنت.'
          : 'Request timed out. Please check your internet connection.';

  static String defaultError(String lang) =>
      lang == 'ar'
          ? 'حدث خطأ ما. حاول مرة أخرى لاحقًا.'
          : 'Something went wrong. Please try again later.';

  static String cacheError(String lang) =>
      lang == 'ar'
          ? 'تعذر تحميل البيانات المؤقتة.'
          : 'Unable to load cached data.';

  static String noInternetError(String lang) =>
      lang == 'ar'
          ? 'لا يوجد اتصال بالإنترنت. تحقق من الشبكة.'
          : 'No internet connection. Check your network.';
}
