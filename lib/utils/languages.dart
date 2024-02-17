import 'package:get/get.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'today': 'Today',
          'next_days': 'Next Days',
          'comfort_level': 'Comfort Level',
          'humidity': 'Humidity',
          'feels_like ': 'Feels Like',
          'uv_index ': 'UV Index',
          'km/h': 'km/h',
        },
        'ar_ARA': {
          'today': 'اليوم',
          'next_days': 'الايام القادمة',
          'comfort_level': 'مستوى الراحة',
          'humidity': 'رطوبة',
          'feels_like ': 'أحس كأنني',
          'uv_index ': 'مؤشر الأشعة فوق البنفسجية',
          'km/h': 'كم/ساعة',
        }
      };
}
