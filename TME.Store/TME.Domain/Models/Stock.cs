namespace TME.Domain.Models
{
    public class Stock
    {
        public string Symbol { get; private set; }
        public int Amount { get; private  set; }
        public string Unit { get; private  set; }

        public Stock(string Symbol, int Amount , string Unit)
        {
           this.Symbol = Symbol;
           this.Amount = Amount;
           this.Unit = Unit;
    }
    }
}
