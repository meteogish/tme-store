namespace TME.Api.Domain.Models
{
    public class ApiDocumentList
    {
        public  string DocumentUrl{ get; private set; }
        public  string DocumentType { get; private set; }
        public  string Filesize { get; private set; }
        public  string Language { get; private set; }
        public ApiDocumentList(string DocumentUrl , string DocumentType , string Filesize, string Language)
        {
            this.DocumentUrl = DocumentUrl;
            this.DocumentType = DocumentType;
            this.Filesize = Filesize;
            this.Language = Language;
        }

    }
}