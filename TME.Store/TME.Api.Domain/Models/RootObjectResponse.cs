namespace TME.Api.Domain.Models
{
    public class RootObjectResponse
    {
        public string Status { get; set; }
        public object Data { get; set; }
        public string ErrorMessage { get; set; }
        public object Error { get; set; }
    }
}
