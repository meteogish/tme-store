using System;
using System.Collections.Generic;
using System.Text;

namespace TME.Domain.Models
{
   public class File
    {
        public List<string> PhotoList { get; private set; }
        public List<string> ThumbnailList { get; private set; }
        public List<string> HighResolutionPhotoList { get; private set; }
        public List<Object> PresentationList { get;  set; }
        public List<DocumentList> DocumentList { get; private set; }
        public List<AdditionalPhotoList> AdditionalPhotoLists { get; private set; }
        public List<ParametersImages> ParametersImages { get; private set; }
        public File(List<string> PhotoList, List<string> ThumbnailList, List<string> HighResolutionPhotoList, List<Object> PresentationList, List<DocumentList> DocumentList, List<AdditionalPhotoList> AdditionalPhotoLists, List<ParametersImages> ParametersImages)
        {
            this.PhotoList = PhotoList;
            this.ThumbnailList = ThumbnailList;
            this.HighResolutionPhotoList = HighResolutionPhotoList;
            this.PresentationList = PresentationList;
            this.DocumentList = DocumentList;
            this.AdditionalPhotoLists = AdditionalPhotoLists;
            this.ParametersImages = ParametersImages;
           
        }


    }
}
