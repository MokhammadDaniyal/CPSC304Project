<h2>My Appointments</h3>

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