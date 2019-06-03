<!-- Class CSS -->
<link href="css/customer.css" rel="stylesheet">

<p>We are currently in the HTML section.</p>

<?php
include "AnimalDisplay.php";
$ser="localhost";
$user="root";
$pass="";
$db="petadoption";

$con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");
// echo '<script language="javascript">';
// echo 'alert("Database connected!")';
// echo '</script>';

$result = $con->query("SELECT * from animal");
echo '<input type="text" id="searchInput" onkeyup="SearchFunction()" placeholder="Search" title="Search for an animal"></input>';
if ($result->num_rows > 0) {
    // output data of each row
    echo '<div class="animal-table">';
    while($row = $result->fetch_assoc()) {
        $curr_animal = new AnimalDisplay($row['name'], $row['age'], $row['gender'], $row['breed'],"Animals", "Yes");
        $curr_animal->printAnimal();
    }
    echo '</div>';
}
?>

<!-- Javascript/JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="js\customer.js"></script>