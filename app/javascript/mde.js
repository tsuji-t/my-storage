import 'simplemde/dist/simplemde.min.css'
import SimpleMDE from "simplemde";

window.onload = function () {
  const simplemde = new SimpleMDE({
    element: document.getElementById("editor"),
  });
};