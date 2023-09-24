const GOODS = [
    {name: "Авокадо", price: 230},
    {name: "Голубика", price: 220},
    {name: "Манго", price: 400},
    {name: "Огурцы", price: 140},
    {name: "Томаты", price: 190},
    {name: "Яблоки", price: 90},
]

function construct_good(name, price) {
    const name_cell = document.createElement("div");
    name_cell.className = "div-table-cell";
    name_cell.innerText = name;

    const price_cell = document.createElement("div");
    price_cell.className = "div-table-cell";
    price_cell.innerText = price;

    const table_row = document.createElement("div");
    table_row.className = "div-table-row optional-row";
    table_row.appendChild(name_cell);
    table_row.appendChild(price_cell);

    return table_row;
}

function add_good(name = "", price = "") {
    console.log(name, price);
    if (name == "" || price == "") {
        name_item = document.getElementById("name");
        price_item = document.getElementById("price");

        name = name_item.value;
        price = price_item.value;

        name_item.value = "";
        price_item.value = "";
    }

    if (!name.length) {
        alert("Наименование должно быть заполнено!");
        return;
    }

    if (parseInt(price) <= 0) {
        alert("Недопустимое значение цены!");
        return;
    }

    let goods_list = document.getElementById("goods-list");
    const new_good = construct_good(name, price);
    goods_list.appendChild(new_good);
}

function refresh_total() {
    const goods_list = document.getElementById("goods-list");
    const children = goods_list.children;

    let total = 0;
    for (let i = 1; i < children.length; i++) {
        const child = children[i];
        total += Number(child.children[1].innerText);
    }

    document.getElementById("result-price").innerText = total + " ₽";
}

function clear_goods() {
    let goods = document.getElementsByClassName("optional-row");
    while (goods.length > 0) {
        goods[0].parentNode.removeChild(goods[0]);
    }
}

function construct_card(name, price) {
    let card = document.createElement("div");
    card.className = "good";
    
    let image = document.createElement("img");
    image.src = "../res/" + name + ".jpg";
    image.alt = name;
    image.className = "good-img";

    let text = document.createElement("div");
    text.className = "good-text";
    text.innerText = name + ", " + price + " ₽";

    card.appendChild(image);
    card.appendChild(text);

    card.onclick = () => {
        add_good(name, price);
    }

    return card;
}

function load_showcase() {
    showcase = document.getElementById("showcase");
    for (const good of GOODS) {
        const new_card = construct_card(good.name, good.price);
        showcase.appendChild(new_card);
    }
}

load_showcase();
