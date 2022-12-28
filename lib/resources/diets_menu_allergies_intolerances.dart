enum Diet { regular, vegetarian, vegan }

extension DietsValues on Diet {
  String get title {
    return 'diet_$name';
  }
}

enum Intolerance { gluten, lactose, fructose, sucrose, sulfites }

extension IntolerancesValues on Intolerance {
  String get title {
    return 'intolerance_$name';
  }
}

enum Allergy { seafood, fish, anisakis, nuts, pulses }

extension AllergyValues on Allergy {
  String get title {
    return 'allergy_$name';
  }
}

enum Menu { infant, adult }

extension MenuValues on Menu {
  String get title {
    return 'menu_$name';
  }
}
