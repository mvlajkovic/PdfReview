<%@ Page Language="C#" AutoEventWireup="false" CodeBehind="WebForm2.aspx.cs" Inherits="PdfWebApp.View.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PDF UPLOAD</title>
    <link rel="stylesheet" href="../Content/bootstrap.css" />
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>

    <!-- particles.js container -->
    <div id="particles-js"></div>
    <section class="pt-5">
        <div class="container">
            <div class="row">
                <div class="col-auto mx-auto bg-white text-center">
                    <img id="logo-base" src="src/logo-01-1.png" class="img-fluid" />
                    <h1 class="text-danger">PDF COMPARER</h1>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        Upustvo za koristenje
                    </button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal1">
                        Kako algoritam radi?
                    </button>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <form runat="server" method="post" enctype="multipart/form-data" action="WebForm2.aspx" id="form1">
                        <div class="form-group files">
                            <label>Upload Your File </label>
                            <asp:FileUpload runat="server" ID="UploadPDFs" AllowMultiple="true" />
                        </div>
                        <asp:Button class="btn btn-primary" runat="server" ID="uploadedFile" Text="Upload" OnClick="uploadFile_Click" />
                        <asp:Button class="btn btn-warning" runat="server" ID="buttonCalculate" OnClick="calculate_Click" Text="Calculate" />
                        <asp:Button class="btn btn-danger" runat="server" ID="buttonReset" OnClick="btnReset_Click" Text="Reset" />
                        <div>
                            <asp:Label ID="listofuploadedfiles" runat="server" />
                        </div>
                        <div>
                            <asp:Label ID="lblError" class="text-danger" runat="server" />
                        </div>
                    </form>
                </div>
                <div class="col-md-12 pt-3 text-center">
                    <div class="progress">
                        <div runat="server" id="progressBar" class="progress-bar progress-bar-striped" role="progressbar" style="width: 0%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
                    </div>
                    <p runat="server" id="statusBar"></p>
                    <h1 runat="server" class="text-primary" id="result"></h1>
                </div>
            </div>
        </div>
    </section>

    <!-- Button trigger modal -->


    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Upustvo</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Kolikom na upload ili drag and drop postavite dva fajla koja želite da uporedite. Nakon što odaberete fajlove, kliknite <b>Upload</b> i kada napiše da je uploadovano onda kliknite dugme
                    <b>Calculate</b>. Sačekajte rezultat, bit ce ispisan na dnu ekrana u obliku broja koji predstavlja <b>RAZLIKU</b> u procentima između dva dokumenta.
                    <br />
                    Aplikacija nece dozvoliti da više 
                    od dva dokumenta istovremeno uploadujete tako da uploadujte jedan po jedan ili maksimum dva odjednom.
                    <br />
                    Ukoliko ste greškom uploadovali pogrešan fajl, kliknite <b>Reset</b> i fajl ce biti
                    obrisan sa servera.
                    <br />
                    Ukoliko su fajlovi istog naziva potrebno je da unesete jedan fajl prvo pa kliknete <b>UPLOAD</b>
                    pa onda odaberete drugi fajl pa opet kliknete <b>UPLOAD</b>. Zatim sve isto kao i pre, calculate dugme i cekate resenje.
                    <br />
                    <br />
                    <small class="float-right">Verzija: 1.0</small>
                </div>
                <div class="modal-footer">
                    <div class="col">
                        <div class="float-left">
                            <p class="lead">Autor: Viktor Lekic</p>
                        </div>
                        <div class="float-right">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Algoritam</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Prvo se iz PDF dokumenta svake lekcije izdvaja sav tekst i spaja u jedan tekstualni dokument.  
                    Zatim se tekst razdvaja na reči (po razmaku) i uklanjaju se specijalni karakteri (znakovi interpunkcije, crtice).  
                    Sledeći korak je izračunavanje frekvencije svake reči u dokumentu, pa njihovo sortiranje i brisanje određenog broja onih koje se najviše puta pojavljuju 
                    (reči koje ne nose nikakvo značenje, na primer veznici, rečce, tj. generalno nepromenljive reči).  Ovaj postupak se vrši za trenutnu i prošlogodišnju verziju 
                    lekcija predmeta i na taj način se dobijaju dva vektora frekvencija reči. Rastojanje između ta dva vektora se posmatra kao razlika između dva dokumenta.  
                    Zatim se dobijena vrednost rastojanja skalira na interval od 0 do 100, što predstavlja procenat izmene u novoj verziji materijala. 
                    Treba imati u vidu da na ovakav način računanja razlike ne utiču zamene mesta lekcijama u predmetu, kao ni pomeranje objekata, sekcija ili rečenica u okviru lekcije. 
                    U promene se računa samo dodavanje novog sadržaja ili brisanje postojećeg. 
                </div>
                <div class="modal-footer">
                    <div class="col">
                        <div class="float-left">
                            <p class="lead">Autor: Viktor Lekic</p>
                        </div>
                        <div class="float-right">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/umd/popper.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script src="../Scripts/particles.min.js"></script>

    <script>

        //only pdf files by default
        $(document).ready(function () {
            document.getElementById("<%=UploadPDFs.ClientID %>").setAttribute('accept', 'application/pdf');
        })

        particlesJS("particles-js", {
            "particles": {
                "number": {
                    "value": 80,
                    "density": {
                        "enable": true,
                        "value_area": 800
                    }
                },
                "color": {
                    "value": "#000000"
                },
                "shape": {
                    "type": "circle",
                    "stroke": {
                        "width": 0,
                        "color": "#000000"
                    },
                    "polygon": {
                        "nb_sides": 5
                    },
                    "image": {
                        "src": "img/github.svg",
                        "width": 100,
                        "height": 100
                    }
                },
                "opacity": {
                    "value": 0.5,
                    "random": false,
                    "anim": {
                        "enable": false,
                        "speed": 1,
                        "opacity_min": 0.1,
                        "sync": false
                    }
                },
                "size": {
                    "value": 3,
                    "random": true,
                    "anim": {
                        "enable": false,
                        "speed": 40,
                        "size_min": 0.1,
                        "sync": false
                    }
                },
                "line_linked": {
                    "enable": true,
                    "distance": 150,
                    "color": "#000000",
                    "opacity": 0.4,
                    "width": 1
                },
                "move": {
                    "enable": true,
                    "speed": 3,
                    "direction": "none",
                    "random": false,
                    "straight": false,
                    "out_mode": "out",
                    "bounce": false,
                    "attract": {
                        "enable": false,
                        "rotateX": 600,
                        "rotateY": 1200
                    }
                }
            },
            "interactivity": {
                "detect_on": "canvas",
                "events": {
                    "onhover": {
                        "enable": false,
                        "mode": "repulse"
                    },
                    "onclick": {
                        "enable": false,
                        "mode": "push"
                    },
                    "resize": true
                },
                "modes": {
                    "grab": {
                        "distance": 400,
                        "line_linked": {
                            "opacity": 1
                        }
                    },
                    "bubble": {
                        "distance": 400,
                        "size": 40,
                        "duration": 2,
                        "opacity": 8,
                        "speed": 3
                    },
                    "repulse": {
                        "distance": 200,
                        "duration": 0.4
                    },
                    "push": {
                        "particles_nb": 4
                    },
                    "remove": {
                        "particles_nb": 2
                    }
                }
            },
            "retina_detect": true
        });
    </script>

</body>
</html>
