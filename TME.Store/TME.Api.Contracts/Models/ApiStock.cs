namespace TME.Store.Api.Models
{
    public class ApiStock
    {
        public string Symbol { get; private set; }
        public int Amount { get; private  set; }
        public string Unit { get; private  set; }

        public ApiStock(string Symbol, int Amount , string Unit)
        {
           this.Symbol = Symbol;
           this.Amount = Amount;
           this.Unit = Unit;
    }
    }
}
