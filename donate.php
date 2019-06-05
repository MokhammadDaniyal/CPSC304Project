<form method="POST">
    <p>Name:</p>
    <input type="text" name="name"></input>
    <p>Age:</p>
    <input type="number" name="age"></input>
    <p>Gender:</p>
    <select name="gender">
        <option value="Male">Male</option>
        <option value="Female">Female</option>
    </select>
    <p>Breed:</p>
    <input type="text" name="breed"></input>
    <p>Account ID: </p>
    <input type="number" name="id"></input><br>
    <input type="submit" value="Submit", name="submitform">
</form>

<?php
$ser="localhost";
$user="root";
$pass="";
$db="petadoption";

$con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");
if(array_key_exists('submitform', $_POST)){
    $last = $con->query("SELECT animal_id FROM animal ORDER BY animal_id DESC LIMIT 1");
    $last_id = $last->fetch_assoc()['animal_id'];
    $var1 = strval(intval($last_id) + 1);
    $var2 = $_POST['name'];
    $var3 = $_POST['age'];
    $var4 = $_POST['gender'];
    $var5 = $_POST['breed'];
    $var6 = date("F j, Y");
    $var7 = $_POST['id'];

    $check_breed = $con->query("SELECT breed FROM animal_R2");
    $item_found = FALSE;
    while($row = $check_breed->fetch_assoc()){
        if($row['breed'] == $var5){
            $item_found = TRUE;
            break;
        }
    }

    if($item_found == FALSE){
        $sql = "INSERT INTO animal_R2 (breed) VALUES (".'"'.$var5.'")';
        $con->query($sql);
    }

    $sql = "INSERT INTO animal VALUES (".$var1.",".'"'.$var2.'"'.",".$var3.",".'"'.$var4.'"'.",".'"'.$var5.'"'.",".'"'.$var6.'"'.",".$var7.")";

    if ($con->query($sql) === TRUE) {
        echo "Record has been added";
    } else {
        echo "Error: " . $sql . "<br>" . $con->error;
    }
}
?>

<!-- Javascript/JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="js\customer.js"></script>