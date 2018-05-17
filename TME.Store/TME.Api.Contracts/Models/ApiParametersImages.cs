namespace TME.Store.Api.Models
{
    public class ApiParametersImages
    {

        public string Name { get; private set; }
        public string Url { get; private set; }

        public ApiParametersImages(string Name,string Url)
        {
            this.Name = Name;
            this.Url = Url;
        }
    }
}