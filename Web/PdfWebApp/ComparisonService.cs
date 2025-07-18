using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using Newtonsoft.Json;
using PDFReader;

namespace PdfWebApp
{
    public class ComparisonService
    {

        public string DownloadAndCompare(string url1, string url2, string serverFolder, string lessonCode, string lessonNumber, string yearOld, string yearNew)
        {
            string filePath1 = Path.Combine(serverFolder, "old.pdf");
            string filePath2 = Path.Combine(serverFolder, "new.pdf");

            if (!Directory.Exists(serverFolder))
                Directory.CreateDirectory(serverFolder);

            // DELETE OLD FILES BEFORE DOWNLOADING
            if (File.Exists(filePath1))
            {
                try
                {
                    File.Delete(filePath1);
                }
                catch (Exception ex)
                {
                    // Optional: log error, but continue
                    System.Diagnostics.Debug.WriteLine($"Warning: Could not delete {filePath1}: {ex.Message}");
                }
            }

            if (File.Exists(filePath2))
            {
                try
                {
                    File.Delete(filePath2);
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine($"Warning: Could not delete {filePath2}: {ex.Message}");
                }
            }
            System.Diagnostics.Debug.WriteLine("Downloading: " + url1);
            System.Diagnostics.Debug.WriteLine("Downloading: " + url2); 
            try
            {
                using (var client = new WebClient())
                {
                    client.DownloadFile(url1, filePath1);
                    client.DownloadFile(url2, filePath2);
                }
            }
            catch (Exception ex)
            {
                // Log and rethrow or wrap error with context
                throw new Exception("Download failed: " + ex.Message, ex);
            }

            Reader reader = new Reader();

            var first = reader.uniqueWordsForApi(filePath1);
            var second = reader.uniqueWordsForApi(filePath2);

           
            first = Reader.removeTopN(first, 10, 15);
            second = Reader.removeTopN(second, 10, 15);

            var distance = LevenshteinDistance.distanceMeasure(first, second, 2);
            distance = ((1 - distance) * 100);

            var jsonPayload = new
            {
                lessonCode,
                lessonNumber,
                yearOld,
                yearNew,
                difference = distance.ToString()
            };

            return JsonConvert.SerializeObject(jsonPayload);
        }

    }
}