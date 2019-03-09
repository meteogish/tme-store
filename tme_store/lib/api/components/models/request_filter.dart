class RequestFilter {
  final String language;
  final String country;

  RequestFilter({ this.language, this.country});

  @override
    String toString() {
      return 'Language: $language, Country: $country';
    }
}