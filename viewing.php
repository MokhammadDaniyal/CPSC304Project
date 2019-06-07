<h2>My Appointments</h3>
<?php
    $ser="localhost";
    $user="root";
    $pass="";
    $db="petadoption";
    $con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");
    $con->query("ALTER TABLE viewing_sets CHANGE AnimalID animal_id char(10)");
    $result = $con->query("SELECT animal_id, name, ViewingID, Date_view FROM viewing_sets NATURAL JOIN animal WHERE CustomerID='1' AND Date_view >= CURDATE() ORDER BY Date_view ASC");
    if ($result->num_rows > 0) {
        // output data of each row
        echo '<table>';
        echo '<tr><th>Animal ID</th><th>Name</th><th>Viewing ID</th><th>Appointment Date</th></tr>';
        while($row = $result->fetch_assoc()) {
            echo '<tr>';
            echo '<td>'.$row['animal_id'].'</td><td>'.$row['name'].'</td><td>'.$row['ViewingID'].'</td><td>'.$row['Date_view'].'</td>';
            echo '</tr>';
        }
        echo '</table>';
    } else {
        echo "No Future Appointments in the Database";
    }
?>
<h2>Make an Appointment</h3>
<form method="POST">
    <h3>Account ID</h3>
    <input type="text" name='id'>
    <h3>Animal ID</h3>
    <input type="text" name="animal_id">
    <h3>Requested Date</h3>
    <input type="text" id='datepicker' autocomplete="off" name="date">
    <input type="submit" value="Submit", name="submitform">
</form>

<?php
include "CustomerAppointment.php";
if(array_key_exists('submitform', $_POST)){
    $userid = $_POST['id'];
    $animalid = $_POST['animal_id'];
    $date = $_POST['date'];
    $curr_viewing = new Appointment($animalid, $userid, $date);
    $curr_viewing->insertData();   
}
?>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $( function() {
        $( "#datepicker" ).datepicker();
        $( "#datepicker" ).datepicker("option", "dateFormat","yy-mm-dd");
    } );
</script>