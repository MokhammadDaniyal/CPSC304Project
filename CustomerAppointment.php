<?php 
class Appointment {
    private $viewing_id;
    private $animal_id;
    private $customer_id;
    private $animal_name;
    private $date;
    private $con;

    public function __construct($a, $c, $d) {
        $ser="localhost";
        $user="root";
        $pass="";
        $db="petadoption";
        $this->con=mysqli_connect($ser, $user, $pass, $db) or die("Connection Failed...");
        $last = $this->con->query("SELECT ViewingID FROM viewing_sets ORDER BY ViewingID DESC LIMIT 1");
        $last_id = $last->fetch_assoc()['ViewingID'];
        $this->viewing_id = strval(intval($last_id) + 1);
        $this->animal_id = $a;
        $this->customer_id = $c;
        $counter = $this->con->query('SELECT name FROM animal WHERE animal_id='.'"'.$this->animal_id.'"');
        if ($counter == TRUE){
            $counter->fetch_assoc()['name'];
        } else {
            $this->animal_name = NULL;
        }
         
        $this->date = $d;
    }
    
    public function insertData() {
        $sql = "INSERT INTO viewing_sets VALUES (".'"'.$this->viewing_id.'"'.','.'"'.$this->animal_id.'"'.','.'"'.$this->customer_id.'",'.'"'.$this->date.'")';
        if ($this->con->query($sql) === TRUE) {
            echo "<p>Thank you, your request has been processed</p>";
        } else {
            if(strpos($this->con->error, "FOREIGN KEY (`AnimalID`)") == TRUE){
                echo "Please enter a valid pet ID";
            } else {
                echo "Error: " . $sql . "<br>" . $this->con->error;
            }         
            //echo "<p>There is something wrong, please try and input your data again</p>";
        }
    }
}
?>