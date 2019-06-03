function SearchFunction() {
    var input, filter, tr, data, i, txtValue;
    input = document.getElementById("searchInput");
    filter = input.value.toLowerCase();
    cards = document.getElementsByClassName("animal-card");
    row = document.getElementsByClassName("animal-content");
    for (i = 0; i < row.length; i++) {
        for (j = 0; j < row[i].children.length; j++) {
            txtValue = row[i].children[j].innerText.toLowerCase();
            if (txtValue.includes(filter)) {
                cards[i].style.display = "";
                break;
            } else {
                cards[i].style.display = "none";
            }
        }
    }
}

function dropdownSearch(filterby, value) {
    // TODO: Debug, check the following link for resource: 
    // https://www.w3schools.com/jsref/event_onchange.asp
    var filter, i, txtValue;
    filter = filterby.value.toLowerCase();
    cards = document.getElementsByClassName("animal-card");
    var counter = "animal-"
    var classname = counter.concat(filterby.toLowerCase());
    row = document.getElementsByClassName("animal-content").getElementsByClassName(classname);
    for (i = 0; i < row.length; i++) {
        txtValue = row[i].innerText.toLowerCase();
        if (txtValue.includes(value.toLowerCase())) {
            cards[i].style.display = "";
        } else {
            cards[i].style.display = "none";
        }
    }
}
