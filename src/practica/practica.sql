-- Active: 1694445877949@@127.0.0.1@3306
CREATE TABLE users(
id TEXT PRIMARY KEY UNIQUE NOT NULL, 
name TEXT NOT NULL,
email TEXT NOT NULL,
password TEXT NOT NULL,
type TEXT NOT NULL
);

DROP TABLE users;

SELECT * FROM users;

INSERT INTO users(id , name, email, password, type )
VALUES ("u001",  "Raquel de Solange", "solange@gmail.com", "2DFSAFAS08", "BLACK");

SELECT * FROM users;

SELECT id FROM users
ORDER BY id DESC;

SELECT * FROM users;

CREATE TABLE productos(
id TEXT PRIMARY KEY UNIQUE NOT NULL, 
name TEXT NOT NULL,
categoria TEXT NOT NULL,
preco TEXT,
img TEXT,
descripcao TEXT
);



DROP TABLE productos;


SELECT * FROM productos;

INSERT INTO productos(id , name, categoria, preco, img, descripcao)
VALUES 
("prod001",  "hopi hari","trips-tour" , 700 , "https://i.ibb.co/9TfTtbd/hopi-hari.png", "O Parque Hopi Hari é uma cópia dos parques temáticos normalmente encontrados na Flórida.
Possui atrações para todas as idades, montanhas-russas, realidade virtual e passeios como corredeiras e hotel de terror."),
("prod006",  "kidzania","trips-tour" , 400 ,"https://i.ibb.co/g7PxXg0/kidzania.png", "Na KidZania as marcas parceiras agregam realismo à cidade através de uma oportunidade inovadora de marketing experiencial. Aqui, as crianças de 4 a 14 anos podem brincar e aprender, com o conceito único de “EDUtenimento”"),
("prod008",  "late clube piraju","trips-tour" , 650 ,"https://i.ibb.co/wK0q63m/late-clube-piraju.png", "Com o tempo, as ações para desenvolver as áreas social e esportiva do clube ganharam bom ritmo, com a construção de quadras poliesportivas, quadras de tênis, salas de jogos, salão de festas com mezanino, playground, sauna etc."),
("prod0010",  "looping park","trips-tour" , 500 ,"https://i.ibb.co/xmKcDVL/looping-park-br.png", "Looping Park, local da maior montanha-russa itinerante da América do Sul! E uma casa de outros passeios incríveis"),
("prod0011",  "mercado municipal","trips-tour" , 750 ,"https://i.ibb.co/Rh6mWYN/mercado-municipal.png", "O prédio, que ocupa um espaço de 12,6 mil metros quadrados de área construída às margens do Rio Tamanduateí, abriga mais de 1,5 mil funcionários que, juntos, movimentam cerca de 350 toneladas de alimentos por dia"),
("prod0012",  "therma do vale","trips-tour" , 600 ,"https://i.ibb.co/cJdzS3L/therma-do-vale.png", "O Thermas do Vale fica pertinho da capital São Paulo e é o lugar perfeito pra você curtir um dia de lazer. O lindo Parque Aquático conta com 13 piscinas e diversas atrações em um espaço repleto de natureza preservada. As piscinas funcionam em temperatura ambiente"),
("prod0013",  "tour dia completo","trips-tour" , 1000 ,"https://i.ibb.co/CswckFZ/tour-dia-completo.png", "Florianópolis possui 52% do seu território como área de preservação ambiental, além das 43 praias, o que configura um cenário natural único. São 46 pontos históricos, entre fortalezas, museus e igrejas. Floripa também possui uma riqueza gastronômica de fazer salivar. São quatro vias gastronômicas, que oferecem desde a culinária típica com base nos frutos do mar até a altíssima gastronomia");

/*
prod001 700 * 3 2100
prod006 400 * 2 800
prod008 650 *5 3000
prod0010 500 *2 1000*/

/*
prod0011 5 * 750 3750
prod0012 600 * 4 2400
prod0013 1000 * 2 2000
*/

/*https://i.ibb.co/9TfTtbd/hopi-hari.png
https://i.ibb.co/g7PxXg0/kidzania.png
https://i.ibb.co/wK0q63m/late-clube-piraju.png
https://i.ibb.co/xmKcDVL/looping-park-br.png
https://i.ibb.co/Rh6mWYN/mercado-municipal.png
https://i.ibb.co/cJdzS3L/therma-do-vale.png
https://i.ibb.co/CswckFZ/tour-dia-completo.png*/


/*https://ibb.co/fMyjxDV
https://ibb.co/mq3ZCTr
https://ibb.co/yppkJ2j
https://ibb.co/J5CYP3c
/*--------------------*
https://ibb.co/74yznZf
https://ibb.co/xGbdq5x
https://ibb.co/cC5knbG*/


UPDATE productos
SET preco = 7
WHERE id = "prod001";


SELECT * FROM productos;

SELECT name FROM productos
ORDER BY name DESC;


DELETE FROM productos WHERE id = 1;


SELECT * FROM productos;


INSERT INTO users(id, name, email, password, type)
VALUES
("u002",  "Ramona de Solange", "solange@gmail.com","2DFSAFAS08", "OURO");


INSERT INTO productos (id , name, categoria, preco, img , descripcao)
VALUES
("prod002",  "Magic" ,"trips-tour" , 700 ,"https://i.ibb.co/g9P5jxf/magic.png", "Com 300 mil metros quadrados, há atrações para todas as idades, entre piscinas climatizadas e aquecidas, toboáguas radicais, parque de diversão, fazendinha, e muito mais. "),
("prod003",  "Thermas dos Laranjais","trips-tour" , 800 ,"https://i.ibb.co/yRxWs34/therma-dos-laranjais.png", " fica em Olímpia, a cerca de 430 km de São Paulo, e é o parque aquático mais visitado do Brasil e da América Latina. Ele oferece mais de 55 atrações que vão desde complexos de toboáguas até piscina de surf 180º");
/*700 * 3 2100
 800 *6 4800
*/

DROP TABLE productos;


SELECT * FROM users
INNER JOIN productos 
ON productos.productos.id = users.id;


CREATE TABLE purchase (
    id TEXT PRIMARY KEY NOT NULL,
    productId TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    totalPrice REAL NOT NULL,  
    buyer_id TEXT NOT NULL,
    created_at TEXT NOT NULL DEFAULT (DATETIME('now')),
    FOREiGN KEY (buyer_id) REFERENCES users(id) ON DELETE CASCADE
);

SELECT * FROM purchase;


DROP TABLE purchase;


INSERT INTO users (id, name, email, password, type)
VALUES("u007", "ricardo", "ricardo@gmail.com", "ricardo120",  "PLATINO"),
("u008", "mariana", "mariana@gmail.com", "mariana120", "OURO"),
("u009", "karen", "karen@gmail.com", "karen120", "BLACK"),
( "u0010", "lurdes", "lurdes@gmail.com", "lurdes123", "PLATINO"),
( "u0011", "mateo", "mateo@gmail.com", "mateo123", "BLACK"),
( "u0012", "lidia", "lidia@gmail.com", "lidia123", "PLATINO"),
( "u0013", "fernando", "fernando@gmail.com", "fernando123", "OURO");

SELECT * FROM users;


DROP TABLE users;

UPDATE users 
SET password = "lurdes123"
WHERE id = "u0010" ;


/*
prod0011 5 * 750 3750
prod0012 600 * 4 2400
prod0013 1000 * 2 2000
*/
/*700 * 3 2100
 800 *6 4800
*/


/*
prod001 700 * 3 2100
prod006 400 * 2 800
prod008 650 *5 3000
prod0010 500 *2 1000*/

INSERT INTO purchase (id, productId, quantity, totalPrice, buyer_id)
VALUES
("pur001", "prod001" , 3 , 2100 , "u001"),
("pur002", "prod002" , 3 , 2100 , "u002"),
("pur007", "prod003" , 6 , 4800 , "u007"),
("pur008", "prod006" , 2 , 800 , "u008"),
("pur009", "prod008" , 5 , 3000 , "u009"),
("pur0010","prod0010", 2 , 1000 , "u0010"),
("pur0011","prod0011", 5 , 3750 , "u0011"),
("pur0012","prod0012", 4 , 2400 , "u0012"),
("pur0013","prod0013", 2 , 2000 , "u0013");

DROP TABLE purchase;

SELECT * FROM purchase;




SELECT 
users.id AS usersId,
buyer_id AS  buyer_id,
purchase.totalPrice AS totalPrice
FROM users
INNER JOIN  purchase
ON purchase.buyer_id = users.id;

SELECT 
users.id AS usersId,
buyer_id AS  buyer_id,
purchase.totalPrice AS totalPrice
FROM users
LEFT JOIN  purchase
ON purchase.buyer_id = users.id;


CREATE TABLE purchase_purchaser_producto (
    purchase_id TEXT NOT NULL,
    producto_id TEXT NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchase(id) ON DELETE CASCADE
    FOREIGN KEY (producto_id) REFERENCES productos(id) ON DELETE CASCADE
);


DROP TABLE purchase_purchaser_producto;


INSERT INTO purchase_purchaser_producto (purchase_id , producto_id)
VALUES
("pur001", "prod001"),
("pur002", "prod002"),
("pur007", "prod003"),
("pur008", "prod006"),
("pur009", "prod008"),
("pur0010","prod0010"),
("pur0011","prod0011"),
("pur0012","prod0012"),
("pur0013","prod0013");

 

/*UPDATE purchase 
SET preco = 17
WHERE id = "pur0010";*/


SELECT * FROM purchase_purchaser_producto;

SELECT * FROM productos
INNER JOIN purchase_purchaser_producto
ON purchase_purchaser_producto.purchase_id = productos.id;


SELECT * FROM productos
LEFT JOIN purchase_purchaser_producto
ON purchase_purchaser_producto.purchase_id = productos.id;



SELECT  
productos.name, 
productos.preco,
purchase.quantity,
purchase.totalPrice,
purchase.buyer_id
FROM purchase
INNER JOIN purchase_purchaser_producto ON purchase.id = purchase_purchaser_producto.purchase_id
INNER JOIN productos ON purchase_purchaser_producto.producto_id = productos.id;    

