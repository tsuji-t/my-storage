import 'simplemde/dist/simplemde.min.css'
import SimpleMDE from 'simplemde'

function mde() {
  const simplemde = new SimpleMDE({ 
    element: document.getElementById("editor")
  });
};


window.addEventListener('DOMContentLoaded',mde)