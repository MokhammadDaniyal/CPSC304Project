<h2>Administrator</h3>
<?php
    $ser="localhost";
    $user="root";
    $pass="mysql";
    $db="petadoption";
    $con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");
?>

<form method="POST">
    <h3>Administrator ID</h3>
    <input type="text" name='id'>
    <h3>Administrator Name</h3>
    <input type="text" name='administrator_name'>
    <h3>Animal ID</h3>
    <input type="text" name="animal_id">
    <input type="submit" value="Submit", name="submitform">
</form>

<?php
if(array_key_exists('submitform', $_POST)){
    $userid = $_POST['id'];
    $userName = $_POST['administrator_name'];
    $animalid = $_POST['animal_id'];
    $sql = "INSERT INTO administrator VALUES ('$userid', '$userName','$animalid')";
    if ($this->con->query($sql) === TRUE) {
        header("Refresh:3");
        echo "<p>Thank you, your request has been processed. The page will refresh in 3 seconds.</p>";
    } else {
            echo "Error: " . $sql . "<br>" . $this->con->error;
        }
}
?>