import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> sendEmail({
  required String name, 
  required String email, 
  required String subject, 
  required String message,
  required String toName,

  }) async {

    //https://api.emailjs.com/api/v1.0/email/send

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final serviceId = 'service_77sqq16';
    final templateId = 'template_u00dn4c';
    final userId = 'sDO3cDf8d8sZVsrX5';


    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json' 
      },
      body: jsonEncode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
          'to_name': toName
        }
      })
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
} 