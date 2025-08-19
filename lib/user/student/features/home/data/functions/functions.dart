import 'package:final_project_iti/core/routing/route_export.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openYoutubeVideo(String url) async {
  final Uri youtubeAppUrl = Uri.parse(url);
  final Uri youtubeWebUrl = Uri.parse(url);

  try {
    // حاول تفتح بتطبيق يوتيوب (لو موجود)
    if (await canLaunchUrl(youtubeAppUrl)) {
      await launchUrl(youtubeAppUrl, mode: LaunchMode.externalApplication);
    }
    // لو مش موجود افتح المتصفح (شغال في الإيموليتر كمان)
    else {
      await launchUrl(youtubeWebUrl, mode: LaunchMode.externalApplication);
    }
  } catch (e) {
    debugPrint("Error: $e");
  }
}
Future<void> openAnyLink(String url) async {
  final Uri uri = Uri.parse(url);

  try {
    // الأول: حاول افتح بالرابط في أي أب خارجي (لو فيه تطبيق مناسب)
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
    } 
    // fallback: لو معندوش تطبيق يفتح اللينك (مثلاً YouTube app أو Browser)
    else {
      await launchUrl(
        uri,
        mode: LaunchMode.inAppWebView, // يفتح جوة الأب نفسه
      );
    }
  } catch (e) {
    debugPrint("❌ Error while opening link: $e");
  }
}