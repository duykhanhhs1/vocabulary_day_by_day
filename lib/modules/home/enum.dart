enum VocabularyType {
  noun,
  verb,
  adj,
  adv;

  String get getName {
    switch (this) {
      case VocabularyType.noun:
        return "(n)";
      case VocabularyType.verb:
        return "(v)";

      case VocabularyType.adj:
        return "(adj)";

      case VocabularyType.adv:
        return "(adv)";
    }
  }
}
