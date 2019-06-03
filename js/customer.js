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
