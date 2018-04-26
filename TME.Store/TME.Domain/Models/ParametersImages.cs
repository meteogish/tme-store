namespace TME.Domain.Models
{
    public class ParametersImages
    {

        public string Name { get; private set; }
        public string Url { get; private set; }

        public ParametersImages(string Name,string Url)
        {
            this.Name = Name;
            this.Url = Url;
        }
    }
}