using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace PdfWebApp
{
    public class ReviewController : ApiController
    {
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody] string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }

        //GET http://localhost:[port]/api/compare?lessonCode=SE201&lessonNumber=05&yearOld=2023-2024&yearNew=0
        //NULA ZA TEKUĆU ŠK. GODINU

        [HttpGet]
        [Route("api/compare")]
        public IHttpActionResult CompareFromUrls(string lessonCode, string lessonNumber, string yearOld, string yearNew)
        {
            try
            {
                var service = new ComparisonService();
                string serverFolder = System.Web.Hosting.HostingEnvironment.MapPath("~/Files/");

                // If yearNew is "0", replace with empty string
                string yearNewPart = yearNew == "0" ? "" : yearNew + "/";

                string baseUrl = "http://mdita.metropolitan.ac.rs/qdita-temp/";

                // Construct URLs
                string url1 = $"{baseUrl}{yearOld}/{lessonCode}/L{lessonNumber.PadLeft(2, '0')}-PDF/{lessonCode}-L{lessonNumber.PadLeft(2, '0')}.pdf";
                string url2 = $"{baseUrl}{yearNewPart}{lessonCode}/L{lessonNumber.PadLeft(2, '0')}-PDF/{lessonCode}-L{lessonNumber.PadLeft(2, '0')}.pdf";

                string resultJson = service.DownloadAndCompare(url1, url2, serverFolder, lessonCode, lessonNumber, yearOld, yearNew);

                return Ok(Newtonsoft.Json.Linq.JObject.Parse(resultJson));
            }
            catch (System.Exception ex)
            {
                return BadRequest("Error: " + ex.Message);
            }
        }
    }
}