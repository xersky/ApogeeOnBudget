<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.ico"/>
    <title>Modification Des Professeurs</title>
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
    
    $sqlselect = "SELECT * FROM professeur WHERE ID=$id";
    $result = mysqli_query($DBConn,$sqlselect);
    while($row = mysqli_fetch_row($result)){  
        $id=$row[0];
        $nom=$row[1];
        $prenom=$row[2];
        $email=$row[3];
        $departement=$row[4];
        echo "<h1>Modification du professeur $nom $prenom</h1>";
            echo "<div><h4>ID : <font color='blue'>$id</font></br> Nom : <font color='blue'>$nom</font></br> Prénom : <font color='blue'>$prenom</font></br> Email : <font color='blue'>$email</font></br> Département : <font color='blue'>$departement</font></div></h4>";

    }
}
?>

<form action="" method="POST">
<h3><font color='red'>Laisser une option vide va conduire à garder la valeur précédente de cette option</font></h3>
<br>
        <input value="<?php echo "$nom";?>" type="text" style="width:300 px;" placeholder="Entrez le nom du professeur" name="NOM" >
        <input value="<?php echo "$prenom";?>" type="text" style="width:300 px;" placeholder="Entrez le prénom du professeur" name="PRENOM" >
        <input value="<?php echo "$email";?>" type="email" style="width:300 px;" placeholder="Entrez l'email du professeur" name="EMAIL" >
        <select name="DEPARTEMENT">
				<option value="<?php echo "$departement";?>" selected>Gardez le departement precedent</option>
                <?php 
						$sql = "SELECT DISTINCT DEPARTEMENT FROM professeur";
						$result1 = mysqli_query($DBConn, $sql);

					if (mysqli_num_rows($result1) > 0) {
						while($row = mysqli_fetch_assoc($result1)) {
							echo "<option>".$row["DEPARTEMENT"]. "</option>";
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
            if(!empty($_POST["PRENOM"])) $prenom = $_POST["PRENOM"];
            if(!empty($_POST["EMAIL"])) $email = $_POST["EMAIL"];
            $departement = $_POST["DEPARTEMENT"];
        
        $request = "UPDATE professeur SET NOM='$nom',PRENOM='$prenom', EMAIL='$email', DEPARTEMENT='$departement' WHERE ID=$id";
        if (mysqli_query($DBConn,$request)) {
            echo "<h3>Le professeur $nom $prenom est modifié avec succès</h3>";
          } else {
            echo "Error modification record: " . mysqli_error($DBConn);
          }
          header("refresh:5;url=prof.php");
        }
          mysqli_close($DBConn);
        


    }  



?>



