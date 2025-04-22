import 'dart:ui';

import 'package:hawy_altawsil/prov/langlocal.dart';
import 'package:hive/hive.dart';

LangLocal langLocal = new LangLocal();
late Box languagebox = Hive.box("language");
TextDirection direction = languagebox.get("language") == "ar" ?TextDirection.rtl :TextDirection.ltr;