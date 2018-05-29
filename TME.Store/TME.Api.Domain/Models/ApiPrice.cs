namespace TME.Api.Domain.Models
{
    public class ApiPrice
    {
        public int Amount { get; set; }
        public float PriceValue { get; set; }
        public bool Special { get; set; }

        public ApiPrice(int amount, float priceValue, bool special)
        {
            this.Amount = amount;
            this.PriceValue = priceValue;
            this.Special = special;
        }
    }
}

