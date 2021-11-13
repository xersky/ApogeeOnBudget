<?php
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
    if(!empty($id) && is_numeric($id))
    {
        include("../session.php");
        $request = "DELETE FROM professeur WHERE ID=$id";
        if(mysqli_query($DBConn,$request)){
            echo "<h3>Professeur supprimé avec succès</h3>";
        } else {
            echo "Error deleting record: " . mysqli_error($DBConn);
        }
    
        header("refresh:5;url=prof.php");
    }
}
?>