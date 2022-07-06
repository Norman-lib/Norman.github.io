import 'package:http/http.dart' as http;
import 'dart:convert';

/// MailJS credential
const String serviceId = 'service_r37w571';
const String templateId = 'template_0tizb3c';
const String publicKey = 'jtiiw7Z24gz6pL_uU';

Future sendEmail() async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  await http.post(
    url,
    headers: {'Origin': 'http://localhost', 'Content-Type': 'application/json'},
    body: jsonEncode(
      {
        'service_id': serviceId,
        'user_id': publicKey,
        'template_id': templateId,
        'template_params': {
          'user_name': "name",
          'user_email': "email",
          'user_message': "mailText",
        }
      },
    ),
  );
}
