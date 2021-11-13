<?php
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
    if(!empty($id))
    {
        include("../session.php");
        $request = "DELETE FROM salle WHERE N='$id'";
        if (mysqli_query($DBConn,$request)) {
            echo "<h3>La salle $id est supprimée avec succès</h3>";
          } else {
            echo "Error deleting record: " . mysqli_error($DBConn);
          }
          
          mysqli_close($DBConn);
        header("refresh:5;url=salle.php");
    }
}
?>