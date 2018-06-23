using System.IO;
using Foundation;
using TME.Api.Domain.Models;
using TME.Api.Domain.Components;

namespace TME.Store.iOS.iOS
{
    public class AppConfigurationProvider : IApiConfigurationProvider
    {
        public ApiConfiguration ApiConfiguration { get; private set; }

        public AppConfigurationProvider()
        {
            string fullSecret;

            var fileInfos = NSBundle.GetPathsForResources(".txt", "");
            var filePath = NSBundle.MainBundle.PathForResource("Secret", ".txt");
            var fileInfo = new FileInfo(filePath);

            using (StreamReader sr = new StreamReader(new FileStream(fileInfo.FullName, FileMode.Open, FileAccess.Read)))
            {
                fullSecret = sr.ReadToEnd();
            }
            string[] parts = fullSecret.Split('|');
            ApiConfiguration = new ApiConfiguration(parts[0], parts[1], "PL", "PLN", "EN");
        }
    }
}