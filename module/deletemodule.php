<?php
if(isset($_GET["id"]))
{
    $id = $_GET["id"];
    if(!empty($id) && is_numeric($id))
    {
        include("../session.php");
        $request = "DELETE FROM module WHERE ID=$id";
        if (mysqli_query($DBConn,$request)) {
            echo "<h3>Module supprimé avec succès</h3>";
          } else {
            echo "Error deleting record: " . mysqli_error($DBConn);
          }
          
          mysqli_close($DBConn);
        header("refresh:5;url=module.php");
    }
}
?>