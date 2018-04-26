namespace TME.Domain.Models
{
    public class Guarantee
    {
        public string Type { get; set; }
        public int Period { get; set; }

        public Guarantee(string Type, int Period)
        {
            this.Type = Type;
            this.Period = Period;
        }
    }
}
