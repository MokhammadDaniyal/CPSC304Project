<?php
class AnimalDisplay {
    private $name;
    private $age;
    private $gender;
    private $breed;
    private $type;
    private $hypoallergenic;

    public function __construct($n, $a, $g, $b, $t, $h) {
        $this->name = $n;
        $this->age = $a;
        $this->gender = $g;
        $this->breed = $b;
        $this->type = $t;
        $this->hypoallergenic = $h;
    }

    public function printAnimal(){
        echo '<div class="animal-card">';
        echo '<div class="animal-image">';
        echo "<h2>Placeholder for image</h2>";
        echo '</div>';
        echo '<div class="animal-content">';
        echo '<h3 class="animal-name">'. "Name: ".$this->name."</h3>";
        echo '<p class="animal-age">'. "Age: ".$this->age."</p>";
        echo '<p class="animal-gender">'. "Gender: ". $this->gender."</p>";
        echo '<p class="animal-breed">'. "Breed: ".$this->breed."</p>";
        echo '<p class="animal-type">'. "Type: ".$this->type."</p>";
        echo '<p class="animal-hypo">'. "Hypoallergenic: ".$this->hypoallergenic."</p>";
        echo "</div>";
        echo "</div>";
    }
}
?>