// extension on String

import 'package:practice_app/Mina_Farid_App/data/mapper/mapper.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Empty;
    } else {
      return this!;
    }
  }
}

// extension on Integer

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Zero;
    } else {
      return this!;
    }
  }
}
