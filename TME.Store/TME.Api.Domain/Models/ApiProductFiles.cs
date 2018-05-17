namespace TME.Api.Domain.Models
{
    public  class ApiProductFiles
    {
        public  string Symbol { get; private set; }
        public ApiFile Files { get; private set; }
        public ApiProductFiles(string Symbol,ApiFile Files)
        {
            this.Symbol = Symbol;
            this.Files = Files;
        }
    }
}
