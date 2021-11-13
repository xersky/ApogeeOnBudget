<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Modification Des Modules</title>
</head>
<body>
<div style="background-color: #ff9800;">
      <center><img src="../images/logo-ensa.png" alt=""></center>
    </div>
<?php
        include("../session.php");
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
    
    $sqlselect = "SELECT * FROM module WHERE ID=$id";
    $result = mysqli_query($DBConn,$sqlselect);
    while($row = mysqli_fetch_row($result)){  
        $id=$row[0];
        $nom=$row[1];
        $idfiliere=$row[2];
        echo "<h1>Modification du module $nom | $id filiere</h1>";
            echo "<div><h4>ID : <font color='blue'>$id</font></br> Nom du module : <font color='blue'>$nom</font></br> Code Filière : <font color='blue'>$idfiliere</font></h4></div>";

    }
}
?>

<form action="" method="POST">
<h3><font color='red'>Laisser une option vide va conduire à garder la valeur précédente de cette option</font></h3>
<br>
        <input value="<?php echo "$nom";?>" type="text" style="width:300 px;" placeholder="Entrez le nom du module" name="NOM">
        <select name="ID_FILIERE">
         <option value="<?php echo "$idfiliere";?>" selected>Gardez l'année et la filière precedentes</option>
            <?php 
                $sqlselect1 = "SELECT ID,NOM FROM filiere";
                $result1 = mysqli_query($DBConn, $sqlselect1);
                if (mysqli_num_rows($result1) > 0) {
                    while($row = mysqli_fetch_assoc($result1)){
                        echo "<option value=".$row["ID"].">".$row["ID"]." | ".$row["NOM"]."</option>";
                    }
                }
            ?>
        </select>
			<input type="submit" name="submit">
		</form>
        </body>
        <style>     
                body {
                    background-color: #D5C37C;
                }
      </style>
    </html>

<?php
    if(!empty($id))
    {
        if(isset($_POST["submit"])){
            if(!empty($_POST["NOM"])) $nom= $_POST["NOM"];
            $idfiliere = $_POST["ID_FILIERE"];
        
        $request = "UPDATE module SET NOM='$nom' , ID_FILIERE='$idfiliere' WHERE ID=$id";
        if (mysqli_query($DBConn,$request)) {
            echo "<h3>Le module $nom $idfiliere est modifié avec succès</h3>";
          } else {
            echo "Error modification record: " . mysqli_error($DBConn);
          }
          header("refresh:5;url=module.php");
        }
          mysqli_close($DBConn);
    }  

?>