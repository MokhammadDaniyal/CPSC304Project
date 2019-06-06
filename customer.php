<!-- Class CSS -->
<link href="css/customer.css" rel="stylesheet">

<?php
include "AnimalDisplay.php";

function printForm($dv, $cn, $title){
    echo '<h3 class="select-title">'. $title.'</h3>';
    echo '<form><select id="'.$cn.'Select"'.'onchange="dropdownSearch('.'&quot;'.$cn.'&quot;'.')" '.'>';
    echo '<option value="selectone">Select One</option>';
    while($row = $dv->fetch_assoc()){
        echo '<option '.'value="'.$row[$cn].'">'.$row[$cn].'</option>';
    }
    echo '</select></form>';
}

$ser="localhost";
$user="root";
$pass="";
$db="petadoption";

$con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");

$result = $con->query("SELECT * from animal");
$gender = $con->query("SELECT DISTINCT gender from animal");
$breed = $con->query("SELECT DISTINCT breed from animal");

echo '<input type="text" id="searchInput" onkeyup="SearchFunction()" placeholder="Search" title="Search for an animal"></input>';
printForm($gender, 'gender', 'Gender');
printForm($breed, 'breed', 'Breed');


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