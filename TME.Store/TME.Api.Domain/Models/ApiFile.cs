using System;
using System.Collections.Generic;

namespace TME.Api.Domain.Models
{
    public class ApiFile
    {
        public List<string> PhotoList { get; private set; }
        public List<string> ThumbnailList { get; private set; }
        public List<string> HighResolutionPhotoList { get; private set; }
        public List<Object> PresentationList { get;  set; }
        public List<ApiDocumentList> DocumentList { get; private set; }
        public List<ApiAdditionalPhotoList> AdditionalPhotoLists { get; private set; }
        public List<ApiParametersImages> ParametersImages { get; private set; }
        public ApiFile(List<string> PhotoList, List<string> ThumbnailList, List<string> HighResolutionPhotoList, List<Object> PresentationList,
            List<ApiDocumentList> DocumentList, List<ApiAdditionalPhotoList> AdditionalPhotoLists, List<ApiParametersImages> ParametersImages)
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
