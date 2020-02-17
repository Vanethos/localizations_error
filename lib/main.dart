import 'package:flutter/material.dart';
import 'package:localizations_error/localization/other/other_localizations.dart';

import 'localization/app/app_localizations.dart';
import 'localization/app/app_localizations_delegate.dart';
import 'localization/other/other_localizations_delegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
        localizationsDelegates: [
          const AppLocalizationsDelegate(),
        ],
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('it', 'IT'),
        ]);
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppLocalizations.of(context).textIntroFirstPageTitle,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => OtherLocalized())),
        child: Icon(Icons.add),
      ),
    );
  }
}

class OtherLocalized extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Localizations.override(
      context: context,
      locale: Locale("it"),
      delegates: [
        OtherLocalizationsDelegate(),
      ],
      child: Center(
        child: Text(
          OtherLocalizations.of(context).textIntroFirstPageTitle,
        ),
      ),
    );
  }
}
