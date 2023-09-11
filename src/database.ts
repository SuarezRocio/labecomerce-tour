import { Tproductos} from "./types"
import { Tuser} from "./types"
import { ROLE } from "./types"
import {Tpurchase} from "./types"
import {ACCOUNT_TYPE} from "./types"


export const productos: Tproductos[] = [
    {   id:"1",
        name:"hopi hari", 
        preco: 700,
        categoria: ROLE.TRIPSTOUR,
 },
    {
        name:"kidzania",
        id:"6",
        preco: 400,
        categoria: ROLE.TRIPSTOUR
    },
    {
        name:"late clube piraju",
        id:"8",
        preco: 650,
        categoria: ROLE.TRIPSTOUR
     },
    {
        name:"looping park" ,
        id:"10",
        preco: 500,
        categoria: ROLE.TRIPSTOUR
    },
    {
        name:"mercado municipal" ,
        id:"11",
        preco: 750,
        categoria: ROLE.TRIPSTOUR    
    },
    {
        name:"therma do vale" ,
        id:"12",
        preco: 600,
        categoria: ROLE.TRIPSTOUR    
    },
    {
        name:"tour dia completo" ,
        id:"13",
        preco: 1000,
        categoria: ROLE.TRIPSTOUR    
    }
    ]


export const users: Tuser[] = [
    {
    name: "maria",
    id: "1", 
    email: "maria@gmail.com" ,
    password: "5465465",
    type: ACCOUNT_TYPE.GOLD
},
{   name: "diogo", 
    id: "2", 
    email: "diogo@gmail.com" ,
    password: "5465465",
    type: ACCOUNT_TYPE.PLATINUM
},
{   name: "roberta",
    id: "3", 
    email: "roberta@gmail.com" ,
    password: "5465465",
    type: ACCOUNT_TYPE.GOLD
},
{   name: "miranda",
    id: "4", 
    email: "miranda@gmail.com" ,
    password: "5465465",
    type: ACCOUNT_TYPE.BLACK
},
{   name: "mariana",
    id: "5", 
    email: "mariana@gmail.com" ,
    password: "5465465",
    type: ACCOUNT_TYPE.BLACK
},
{   name: "martina", 
    id: "6", 
    email: "martina@gmail.com" ,
    password: "5465465",
    type: ACCOUNT_TYPE.PLATINUM
}
]
export const purchase: Tpurchase[] = [
    {
        userId: users[0].id, 
        productId: productos[0].id, 
        quantity: 8,
        totalPrice: 8 * productos[0].preco
    },
    {
        userId: users[4].id, 
        productId: productos[4].id, 
        quantity: 2,
        totalPrice: 2 * productos[4].preco
    }
]


const getAllUsers = (): Tuser[] =>{
    return users
}
console.log(getAllUsers())

const getAllProductos = (): Tproductos[] =>{
    return productos
}
console.log(getAllProductos())

const createUserParams = (name: string, id : string, email: string, password: string, type: ACCOUNT_TYPE) : string => {
    users.push({name, id, email, password , type});
    return 'Se cargaron exitosamente';
  }
console.log(createUserParams)


const queryProductsByName = (q: string) => {
    if (!q) {
      console.log("Digite sua busca e tente novamente.");
      return;
    }
    const result = productos.filter((producto) =>
      producto.name.toLowerCase().includes(q.toLowerCase())
    );
    if (result.length > 0) {
      console.log(result.map((producto) => producto.name));
    } else {
      console.log("Nenhum produto foi achado!");
    }
  };
  console.log(queryProductsByName)


const queryProductosById = (id : string) => {
    const result = productos.filter( (productos) =>  productos.id === id)
        return result 
    }  
console.log(queryProductosById)


const getAllPurchasesFromIdUser = (id: string): Tpurchase[] => {
    return purchase.filter((purchase) => purchase.userId == id);
  };
      