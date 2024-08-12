import 'package:flutter/material.dart';
import 'package:practices/extensions/context_extension.dart';
import 'package:practices/l10n/l10n.dart';
import 'package:practices/streams/general_stream.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.selectedLocal});

  final Locale selectedLocal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.homePage),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(context.localizations.helloWorld, style: const TextStyle(fontSize: 20)),
            Text(context.localizations.twoLanguages, style: const TextStyle(fontSize: 20)),

            const SizedBox(height: 50),

            ElevatedButton(
              onPressed: () {
                GeneralStream.languageStream.add(
                  L10n.locals.firstWhere((element) => element != selectedLocal),
                );
              },
              child: Text(context.localizations.changeLanguages),
            ),

          ],
        ),
      ),
    );
  }
}
