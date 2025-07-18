<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="PdfWebApp.View.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Content/bootstrap.css" />
    <link rel="stylesheet" href="StyleSheet.css" />
</head>
<body>
    <section id="logo">
        <div class="container">
            <div class="row">
                <div class="col-auto mx-auto text-center">
                    <img id="logo-base" src="src/logo-01-1.png" class="img-fluid" />
                    <h1 class="text-danger">PDF COMPARER</h1>
                </div>
            </div>
        </div>
    </section>
    <section id="form" class="mt-5">
        <div class="container">
            <div class="row">
                <div class="col-6 px-5 py-3">
                    <form>
                        <h3>Prvi PDF</h3>
                        <div class="form-group">
                            <label for="yearBox1">Godina predavanja</label>
                            <select class="form-control">
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>
                            </select>
                            <small class="form-text text-muted">Odaberite godinu predavanja lekcije</small>
                        </div>
                        <div class="form-group">
                            <label for="predmet1">Odaberite predmet</label>
                            <select class="form-control">
                                <option>CS101</option>
                                <option>MA101</option>
                                <option>IS310</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="predmet1">Odaberite broj lekcije</label>
                            <select class="form-control">
                                <option>L01</option>
                                <option>L02</option>
                                <option>L03</option>
                                <option>L04</option>
                                <option>L05</option>
                                <option>L06</option>
                                <option>L07</option>
                                <option>L08</option>
                                <option>L09</option>
                                <option>L10</option>
                                <option>L11</option>
                                <option>L12</option>
                                <option>L13</option>
                                <option>L14</option>
                                <option>L15</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="col-6 px-5 py-3">
                    <form>
                        <h3>Drugi PDF</h3>
                        <div class="form-group">
                            <label for="yearBox2">Godina predavanja</label>
                            <select class="form-control">
                                <option>2019</option>
                                <option>2020</option>
                                <option>2021</option>
                            </select>
                            <small class="form-text text-muted">Odaberite godinu predavanja lekcije</small>
                        </div>
                        <div class="form-group">
                            <label for="predmet2">Odaberite predmet</label>
                            <select class="form-control">
                                <option>CS101</option>
                                <option>MA101</option>
                                <option>IS310</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="predmet2">Odaberite broj lekcije</label>
                            <select class="form-control">
                                <option>L01</option>
                                <option>L02</option>
                                <option>L03</option>
                                <option>L04</option>
                                <option>L05</option>
                                <option>L06</option>
                                <option>L07</option>
                                <option>L08</option>
                                <option>L09</option>
                                <option>L10</option>
                                <option>L11</option>
                                <option>L12</option>
                                <option>L13</option>
                                <option>L14</option>
                                <option>L15</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="col-12 text-center py-3">
                    <form>
                        <div class="form-check mb-3">
                            <input type="checkbox" class="form-check-input" id="compareAll"/>
                            <label class="form-check-label" for="compareAll">Poredi sve lekcije</label>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <section id="result">
        <div class="container">
            <div class="row">
            </div>
        </div>
    </section>

    <script src="../Scripts/jquery-3.0.0.min.js"></script>
    <script src="../Scripts/umd/popper.min.js"></script>
    <script src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Scripts/particles.min.js"></script>
</body>
</html>
