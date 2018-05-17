namespace TME.Api.Domain.Models
{
    public class ApiConfiguration
    {
        public string Country { get; private set; }
        public string Currency { get; private set; }
        public string Language { get; private set; }
        public string Secret { get; private set; }
        public string Token { get; private set; }

        public ApiConfiguration(string secret, string token, string country, string currency, string language)
        {
            Secret = secret;
            Token = token;
            Country = country;
            Currency = currency;
            Language = language;
        }
    }
}
