<%-- 
    Document   : ventes
    Created on : 24 mars 2023, 15 h 16 min 10 s
    Author     : stanley
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" ></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Liste des ventes</title>
    </head>
    <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" data-bs-theme="dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">Navbar</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
        <div class="navbar-nav">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
          <a class="nav-link" href="ventes.jsp">enregistrer une vente</a>
          <a class="nav-link" href="venteliste.jsp">Afficher les vente</a>
          
        </div>
      </div>
    </div>
    </nav>
    
    
    
     <form method="post" action="ventecontroller.jsp" >
            <div class="mb-3">
                <label for="station" class="form-label">station</label>
                <input type="text"  class="form-control" name="station" required><br><br>
            </div>
         
            <div class="mb-3">
                <label for="qtgaz" class="form-label">qte gasoline</label>
                <input type="number"  class="form-control" name="qtgaz" required><br><br>
            </div>
         
            <div class="mb-3">
                <label for="qtd" class="form-label">qte diesel</label>
                <input type="number"  class="form-control" name="qtd" required><br><br>
            </div>
            
            <div class="mb-3">
                <label for="date" class="form-label">Date de vente:</label>
                <input type="date"  class="form-control" name="date" ><br><br>
            </div>
            

            



            <input type="submit" value="envoyer" class="btn btn-primary">
         </form>
</html>
