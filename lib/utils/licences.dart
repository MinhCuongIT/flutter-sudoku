import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///Add licenses
void addLicences() {
  LicenseRegistry.addLicense(() async* {
    //Font Orbitron
    final licenseOrbitron =
        await rootBundle.loadString('fonts/google_fonts/OFL.txt');

    yield LicenseEntryWithLineBreaks(['google_fonts'], licenseOrbitron);
  });
}
