using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Domain.Models
{
    public class ApiConfiguration
    {
        public string Country { get; private set; }
        public string Language { get; private set; }
        public string Secret { get; private set; }
        public string Token { get; private set; }

        public ApiConfiguration(string secret, string token, string country, string language)
        {
            Secret = secret;
            Token = token;
            Country = country;
            Language = language;
        }
    }
}
