namespace TME.Api.Domain.Models
{
    public class ApiGuarantee
    {
        public string Type { get; set; }
        public int Period { get; set; }

        public ApiGuarantee(string Type, int Period)
        {
            this.Type = Type;
            this.Period = Period;
        }
    }
}
