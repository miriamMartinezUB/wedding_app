enum Diet { regular, vegetarian, vegan }

extension DietsValues on Diet {
  String get title {
    return 'diet_$name';
  }
}

enum Intolerance { gluten, lactose }

extension IntolerancesValues on Intolerance {
  String get title {
    return 'intolerance_$name';
  }
}

enum Allergy { seafood, fish, nuts }

extension AllergyValues on Allergy {
  String get title {
    return 'allergy_$name';
  }
}

enum Menu { adult, infant }

extension MenuValues on Menu {
  String get title {
    return 'menu_$name';
  }
}
