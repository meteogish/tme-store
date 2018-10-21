using System.Collections;
using System.Collections.Generic;
using TME.Store.Domain.Components;
using TME.Store.Domain.Models;

namespace TME.Store.Logic
{
    public class SearchProductsResultEnumerator : IEnumerator<SearchProductsResult>
    {
        private int _currentPage;
        private int _pageCount;
        private readonly IProductsProvider _productsProvider;
        private readonly string _searchText;

        public SearchProductsResultEnumerator(
            IProductsProvider productsProvider,
            string searchText)
        {
            if (string.IsNullOrWhiteSpace(searchText))
            {
                _pageCount = 0;
                _currentPage = 1;
            }
            else
            {
                _currentPage = 1;
                _pageCount = 2;
            }

            _productsProvider = productsProvider;
            _searchText = searchText;
        }

        public bool MoveNext()
        {
            if (_currentPage > _pageCount)
            {
                return false;
            }

            Current = _productsProvider.Search(_searchText, _currentPage);

            if(_currentPage == 1)
            {
                _pageCount = Current.PageCount;
            }

            ++_currentPage;
            return true;
        }

        public void Reset()
        {
            _currentPage = 1;
            _pageCount = 2;
            Current = null;
        }

        public SearchProductsResult Current { get; private set; }

        object IEnumerator.Current => Current;

        public void Dispose()
        {
        }
    }
}