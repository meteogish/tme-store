class SearchFilter {
  String _text;
  String _categoryId;
  String _currency;

  String get searchText => _text;
  String get searchCategoryID => _categoryId;
  String get searchInCurrency => _currency;

  SearchFilter(this._text, this._currency, { categoryId }) {
    _categoryId = categoryId;
  }

  bool operator==(dynamic other) {
    if(other == null) {
      return false;
    }

    if(this.runtimeType != other.runtimeType) {
      return false;
    }

    SearchFilter that = other as SearchFilter;
    
    return this.searchCategoryID == that.searchCategoryID 
      && this.searchInCurrency == that.searchInCurrency
      && this.searchText == that.searchText;
    
  }

  @override
  String toString() {
    return 'Filter: test: $_text, category: $_categoryId, currency: $_currency';
  }
}