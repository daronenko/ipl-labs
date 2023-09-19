const TAB_SIZE = 2;


function DOMTree(node = document.body, depth = 0) {
  if (node.tagName !== undefined) {
    console.log(" ".repeat(TAB_SIZE * depth) + node.tagName)

    p = document.createElement("p");
    p.innerHTML = "&nbsp".repeat(TAB_SIZE * depth) + node.tagName;
    DOMTreeContainer.appendChild(p);

    node.childNodes.forEach((child) => DOMTree(child, depth + 1));
  }
};


var DOMTreeBtn = document.getElementById("dom-tree-btn");
var DOMTreeContainer = document.getElementById("dom-tree-container");

DOMTreeBtn.addEventListener("click", () => {
  DOMTree();
});
