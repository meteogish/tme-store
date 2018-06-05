using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Api.Domain.Models
{
    public class ApiSearchProduct : ApiProduct
    {   public string CustomerSymbol { get; private set; }

        public ApiSearchProduct(string Symbol, string OriginalSymbol, string Producer, string Description, int? OfferId,
            string CategoryId, string Category, string Photo, string Thumbnail, float Weight, int SuppliedAmount,
            int MinAmount, int Multiples, string Unit, string ProductInformationPage, ApiGuarantee Guarantee,
            string[] ProductStatusList)
            : base(Symbol, OriginalSymbol, Producer, Description, OfferId, CategoryId, Category, Photo, Thumbnail, Weight, SuppliedAmount, MinAmount, Multiples, Unit, ProductInformationPage, Guarantee, ProductStatusList)
        {
            this.CustomerSymbol = CustomerSymbol;
        }
    }
}
