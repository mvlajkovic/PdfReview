using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace PDFReader
{
    class Program
    {
        static void Main(string[] args)
        {

            Reader test = new Reader();
            string lokacijaStari = @"C:\Users\Viktor\Desktop\Viktor\pdfovi\stara godina\stari.pdf";
            string lokacijaNovi = @"C:\Users\Viktor\Desktop\Viktor\pdfovi\ova godina\novi.pdf";
            //string stariPDF = test.ReadPDF(lokacijaStari);
            //string noviPDF = test.ReadPDF(lokacijaNovi);

            //var stariParts = stariPDF.SplitInParts(10737);
            //var noviParts = noviPDF.SplitInParts(10737);
            //List<double> calculator = new List<double>();

            //for (int i = 0; i < stariParts.Count(); i++)
            //{
            //    Console.WriteLine("Currently at " + i + "/" + stariParts.Count());
            //    string list1 = stariParts.ToList()[i];
            //    string list2 = noviParts.ToList()[i];
            //    int leven = Fastenshtein.Levenshtein.Distance(list1, list2);
            //    double ratio = ((double)leven) / (Math.Max(list1.Length, list2.Length)) * 100;
            //    calculator.Add(ratio);
            //    Console.Clear();
            //}

            //Console.WriteLine(Math.Round(calculator.Average(), 2));

            //foreach (var a in test.uniqueWords(lokacijaNovi))
            //{
            //    Console.WriteLine(a.Key + " " + a.Value);
            //}


            //MRKELA OVDE
            //var watch = System.Diagnostics.Stopwatch.StartNew();
            // the code that you want to measure comes here



            var nova = test.uniqueWords(lokacijaNovi);
            Console.WriteLine("Ucitana nova...");


            //za testiranje
            //Console.ReadLine(); return;


            var stara = test.uniqueWords(lokacijaStari);
            Console.WriteLine("Ucitana stara...");

            //brise prvih 10 reci koje se najvie ponavljaju, a da su krace od 5 slova
            nova = Reader.removeTopN(nova, 10, 15);
            stara = Reader.removeTopN(stara, 10, 15);
            Console.WriteLine("Brisanje prvih reci...");

            //TESTIRATI VIKTOR
            //1 - cosine
            //2 - manhattan
            var distance = LevenshteinDistance.distanceMeasure(nova, stara, 2);
            Console.WriteLine((1 - distance) * 100);
            distance = ((1 - distance) * 100);
            //watch.Stop();
            //var elapsedMs = watch.ElapsedMilliseconds;
            //Console.WriteLine("Time: " + elapsedMs / 1000.0);
            //Debug.WriteLine((1 - distance) * 100);
            //Console.ReadLine();
        }

        
    }
}
