import SimpleMDE from "simplemde";

window.onload = function () {
  const simplemde = new SimpleMDE({
    element: document.getElementById("editor"),
    spellChecker: false,
    toolbar: ["bold", "horizontal-rule", "heading","|",
              "quote", "unordered-list", "ordered-list","|",
              "code", "link", "table", "|",
              "preview", "side-by-side", "fullscreen", "|",
              "guide"]
  });
};