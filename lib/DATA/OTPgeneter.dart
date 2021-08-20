import 'package:http/http.dart' as http;

class OtpGen {
  void GetOTP() async {
    var client = http.Client();
    var respones = await client.post(
        'https://apisetu.gov.in/public/marketplace/api/cowin#/User%20Authentication%20APIs/generateOTP');
    if (respones.statusCode == 200) {
      var json = respones.body;
    }
  }
}
