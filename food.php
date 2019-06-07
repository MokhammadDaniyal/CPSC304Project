<h2>FoodOrders</h3>
<?php
    $ser="localhost";
    $user="root";
    $pass="mysql";
    $db="petadoption";
    $con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");
?>

<form method="POST">
    <h3>InvoiceNo</h3>
    <input type="text" name='invoice_number'>
    <h3>Invoice Name</h3>
    <input type="text" name='invoice_name'>
    <h3>Invoice Cost</h3>
    <input type="text" name="invoice_cost">
    <h3>Invoice Type</h3>
    <input type="text" name="invoice_type">
    <h3>Invoice Nutrition</h3>
    <input type="text" name="invoice_nutrition">
    <h3>Admin ID</h3>
    <input type="text" name="admin_id">
    <input type="submit" value="Submit", name="submitform">
</form>

<?php
if(array_key_exists('submitform', $_POST)){
    $invoice_number = $_POST['invoice_number'];
    $invoice_name = $_POST['invoice_name'];
    $invoice_cost = $_POST['invoice_cost'];
    $invoice_type = $_POST['invoice_type'];
    $invoice_nutrition = $_POST['invoice_nutrition'];
    $admin_id = $_POST['admin_id'];

    $sql = "INSERT INTO FoodOrders VALUES ('$invoice_number',
     '$invoice_type','$invoice_name','$invoice_cost',
     '$admin_id','$invoice_nutrition')";

    if ($con->query($sql) === TRUE) {
        header("Refresh:3");
        echo "<p>Thank you, your request has been processed. The page will refresh in 3 seconds.</p>";
    } else {
        try {    
            throw new Exception("MySQL error $con->error <br> Query:<br> $query", $con->errno);    
        } catch(Exception $e ) {
            if($e->getCode() == 1062){ //Duplicate PRMARY KEY Error
                echo "<p>Invoice with this Number and Name already exists</p>";
            }
            if($e->getCode() == 1452){ // Non-existent foreign key Error
                echo "Please enter a valid admin ID";
            }else {
                echo "Error: " . $sql . "<br>" . $con->error;
                echo $con->error->getCode();
            }
        }            
            //echo "<p>There is something wrong, please try and input your data again</p>";
        }
}
?>