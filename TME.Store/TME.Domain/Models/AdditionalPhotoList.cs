namespace TME.Domain.Models
{
    public class AdditionalPhotoList
    {
        public string Photo { get; private set; }
        public string Thumbnail { get; private set; }
        public string HighResolutionPhoto { get; private set; }
        public AdditionalPhotoList(string Photo,string Thumbnail, string HighResolutionPhoto)
        {
            this.Photo = Photo;
            this.Thumbnail = Thumbnail;
            this.HighResolutionPhoto = HighResolutionPhoto;
        }
    }
}