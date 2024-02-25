(function () {
    const texts = {
        default: "This is the second paragraph.",
        alternative: "Hello, world!"
    };

    const hwElement = document.getElementById("hw");
    if (hwElement) {
        function toggleText() {
            hwElement.textContent = (hwElement.textContent === texts.default) ? texts.alternative : texts.default;
        }

        hwElement.textContent = texts.default;
        document.addEventListener("click", function (event) {
            if (event.target.matches("#btn_hw")) {
                toggleText();
            }
        });
    }
})();
