import 'dart:convert';

import 'package:http/http.dart';

Future<String> connect({required String body}) async {
  final url = Uri.parse("https://api.openai.com/v1/chat/completions");
  try {
    final response = await post(url,
        headers: {
          "Content-Type": "application/json",
          "Authorization":
              "Bearer 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",
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "role": "system",
              "content":
                  "You will be provided with a Ingredients and seed words, and your task is to generate recipes"
            },
            {"role": "user", "content": body},
          ],
          "temperature": 0,
          "max_tokens": 256,
          "top_p": 1,
          "frequency_penalty": 0,
          "presence_penalty": 0,
        }));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data["choices"][0]["message"]["content"]);
      return data["choices"][0]["message"]["content"];
    } else {
      return "no date";
    }
  } catch (e) {
    throw FormatException(e.toString());
  }
}
