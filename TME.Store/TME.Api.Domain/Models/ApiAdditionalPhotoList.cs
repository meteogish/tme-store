namespace TME.Api.Domain.Models
{
    public class ApiAdditionalPhotoList
    {
        public string Photo { get; private set; }
        public string Thumbnail { get; private set; }
        public string HighResolutionPhoto { get; private set; }

        public ApiAdditionalPhotoList(string Photo,string Thumbnail, string HighResolutionPhoto)
        {
            this.Photo = Photo;
            this.Thumbnail = Thumbnail;
            this.HighResolutionPhoto = HighResolutionPhoto;
        }
    }
}