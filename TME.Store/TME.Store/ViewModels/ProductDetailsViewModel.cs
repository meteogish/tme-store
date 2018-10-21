using TME.Store.Domain.Models;
using GalaSoft.MvvmLight;

namespace TME.Store.ViewModels
{
    public class ProductDetailsViewModel : ViewModelBase
    {
        private Product product;
        public ProductDetailsViewModel()
        {
            product = null;
        }

        public Product Productt
        {
            get
            {
                return product;
            }
            set
            {
                product = value;
                RaisePropertyChanged();
            }
        }
        public void SetProductDetails(Product item)
        {
            product = item;
        }
    }
}
