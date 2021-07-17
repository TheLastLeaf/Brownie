var span = document.querySelector("span");

span.addEventListener("input", function () {
    var text = this.innerText;
    this.setAttribute("data-heading", text);
    this.parentElement.setAttribute("data-heading", text);
});