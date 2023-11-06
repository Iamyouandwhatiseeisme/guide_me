class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.languageCode, this.name);

  static List<Language> languageList() {
    return <Language>[
      Language(1, "US", "English", "en"),
      Language(2, "GE", "ქართული", "ge"),
    ];
  }
}
