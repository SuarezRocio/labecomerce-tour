-- Active: 1694226536996@@127.0.0.1@3306
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
VALUES ("u001",  "Mariana del Sol", "solange@gmail.com", "2DFSAFAS08", "BLACK");

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
("prod001",  "hopi hari","trips-tour" , 700 , "https://ibb.co/fMyjxDV", "O Parque Hopi Hari é uma cópia dos parques temáticos normalmente encontrados na Flórida.
Possui atrações para todas as idades, montanhas-russas, realidade virtual e passeios como corredeiras e hotel de terror."),
("prod006",  "kidzania","trips-tour" , 400 ,"https://ibb.co/mq3ZCTr", "Na KidZania as marcas parceiras agregam realismo à cidade através de uma oportunidade inovadora de marketing experiencial. Aqui, as crianças de 4 a 14 anos podem brincar e aprender, com o conceito único de “EDUtenimento”"),
("prod008",  "late clube piraju","trips-tour" , 650 ,"https://ibb.co/yppkJ2j", "Com o tempo, as ações para desenvolver as áreas social e esportiva do clube ganharam bom ritmo, com a construção de quadras poliesportivas, quadras de tênis, salas de jogos, salão de festas com mezanino, playground, sauna etc."),
("prod0010",  "looping park","trips-tour" , 500 ,"https://ibb.co/J5CYP3c", "Looping Park, local da maior montanha-russa itinerante da América do Sul! E uma casa de outros passeios incríveis"),
("prod0011",  "mercado municipal","trips-tour" , 750 ,"https://ibb.co/74yznZf", "O prédio, que ocupa um espaço de 12,6 mil metros quadrados de área construída às margens do Rio Tamanduateí, abriga mais de 1,5 mil funcionários que, juntos, movimentam cerca de 350 toneladas de alimentos por dia");


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
("u002",  "Mariana Esposito", "mariana@gmail.com","2DFSAFAS08", "OURO");


INSERT INTO productos (id , name, categoria, preco, img , descripcao)
VALUES
("prod002",  "therma do vale","trips-tour" , 600 ,"https://ibb.co/xGbdq5x", "O Thermas do Vale fica pertinho da capital São Paulo e é o lugar perfeito pra você curtir um dia de lazer. O lindo Parque Aquático conta com 13 piscinas e diversas atrações em um espaço repleto de natureza preservada. As piscinas funcionam em temperatura ambiente"),
("prod003",  "tour dia completo","trips-tour" , 1000 ,"https://ibb.co/cC5knbG", "Florianópolis possui 52% do seu território como área de preservação ambiental, além das 43 praias, o que configura um cenário natural único. São 46 pontos históricos, entre fortalezas, museus e igrejas. Floripa também possui uma riqueza gastronômica de fazer salivar. São quatro vias gastronômicas, que oferecem desde a culinária típica com base nos frutos do mar até a altíssima gastronomia");

DROP TABLE productos;


SELECT * FROM users
INNER JOIN purchase
ON buyer_id = users.id;


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
VALUES("u007", "roberta", "roberta@gmail.com", "roberta120",  "PLATINO"),
("u008", "sofia", "sofia@gmail.com", "sofia120", "OURO"),
("u009", "ana", "ana@gmail.com", "ana120", "BLACK"),
( "u0010", "lurdes", "lurdes@gmail.com", "lurdes123", "PLATINO"),
( "u0011", "martina", "martina@gmail.com", "martina123", "OURO");

SELECT * FROM users;


DROP TABLE users;

UPDATE users 
SET password = "lurdes123"
WHERE id = "u0010" ;


INSERT INTO purchase (id, productId, quantity, totalPrice, buyer_id)
VALUES
("pur001", "prod001" , 5 , 3500 , "u001"),
("pur002", "prod002" , 2 , 1200 , "u002"),
("pur007", "prod003" , 4 , 4000 , "u007"),
("pur008", "prod006" , 4 , 1600 , "u008"),
("pur009", "prod008" , 7 , 4550 , "u009"),
("pur0010","prod0010", 2 , 1000 , "u0010"),
("pur0011","prod0011", 1 , 750 , "u0011");

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
("pur0011","prod0011");

 
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

