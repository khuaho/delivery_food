import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';
import 'app/providers/app_dir_provider.dart';
import 'flavors.dart';
import 'global/utils/constants.dart';

void buildFlavor(Flavor flavor) async {
  FlavorConfig.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
  );
  Directory appDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter();
  await Hive.openBox<String>(Constants.hiveDataBox);

  runApp(
    ProviderScope(
      overrides: [
        appDirProvider.overrideWithValue(appDir),
      ],
      child: const MyApp(),
    ),
  );
}
