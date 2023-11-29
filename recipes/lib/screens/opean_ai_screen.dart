import 'package:flutter/material.dart';
import 'package:recipes/screens/search_card.dart';
import 'package:recipes/services/opean_ai.dart';

class OpeanAIScreen extends StatefulWidget {
  const OpeanAIScreen({Key? key}) : super(key: key);

  @override
  State<OpeanAIScreen> createState() => _OpeanAIScreenState();
}

class _OpeanAIScreenState extends State<OpeanAIScreen> {
  String answerUser = "";
  String answerGPT = "";
  bool isLoading = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Recipe Generator',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              flex: 5,
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: [
                          if (answerUser.isNotEmpty)
                            SearchCard(data: answerUser, isUser: true),
                          if (answerGPT.isNotEmpty)
                            SearchCard(data: answerGPT, isUser: false),
                        ],
                      ),
                    ),
            ),
            // const Divider(height: 0),
            Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        hintText: "Enter your Ingredients",
                        contentPadding: const EdgeInsets.all(12),
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                      onPressed: () async {
                        isLoading = true;
                        setState(() {});
                        answerUser = controller.text;
                        final answer = await connect(body: controller.text);
                        answerGPT = answer;
                        controller.clear();
                        isLoading = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.send),
                      color: const Color(0xfffb8a22)),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
