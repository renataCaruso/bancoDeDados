
CREATE TABLE "cad_funcionarios" (
  "cod_func" serial,
  "nome_func" varchar(30),
  "cpf_func" varchar(50),
  "sal_func" integer,
  PRIMARY KEY ("cod_func")
);

select c.nome_cliente, c.tel_cliente  from clientes c  ;

CREATE TABLE "categorias" (
  "cod_categ" serial,
  "nome_categ" varchar(30),
  PRIMARY KEY ("cod_categ")
);

CREATE TABLE "produtos" (
  "cod_prodt" serial,
  "nome_prodt" varchar(100),
  "quant_estoque" integer,
  "data_fab" date,
  "valor_un" Integer,
  "data_cad_prodt" date,
  "cod_func_cad" serial,
  "cod_categ" serial,
  PRIMARY KEY ("cod_prodt"),
  CONSTRAINT "FK_produtos.cod_prodt"
    FOREIGN KEY ("cod_prodt")
      REFERENCES "categorias"("cod_categ"),
  CONSTRAINT "FK_produtos.cod_func_cad"
    FOREIGN KEY ("cod_func_cad")
      REFERENCES "cad_funcionarios"("cod_func")
);

CREATE TABLE "clientes" (
  "cod_cliente" serial, -- serial 
  "nome_cliente" varchar(50),
  "login_cliente" varchar(50),
  "senha_cliente" varchar(50),
  "email_cliente" varchar(50),
  "cpf_cliente" varchar(20), -- varchar(tamanho)
  "dt_nasc_cliente" date, -- varchar(tamanho)
  "tel_cliente" varchar(20), -- varchar(tamanho)
  "end_cliente" varchar(100),
  PRIMARY KEY ("cod_cliente")
);

CREATE TABLE "pedidos" (
  "cod_ped" serial,
  "cod_cliente" serial,
  "cod_prodt" serial,
  "data" date,
  "cod_func" serial,
  PRIMARY KEY ("cod_ped"),
  CONSTRAINT "FK_pedidos.cod_cliente"
    FOREIGN KEY ("cod_cliente")
      REFERENCES "clientes"("cod_cliente"),
  CONSTRAINT "FK_pedidos.cod_prodt"
    FOREIGN KEY ("cod_prodt")
      REFERENCES "produtos"("cod_prodt")
);

select * from cad_funcionarios cf ;
insert into  cad_funcionarios (
  cod_func,
  nome_func,
  cpf_func,
  sal_func ) values ( 1, 'Renata Caruso Pinheiro', '254.316.469-45', 3420.00),
 ( 2, 'Lirrone Gonçalves Farias', '615.464.715-40', 3420.00),
( 3,  'Adriana da Silva', '135.454.464-31', 3420.00);  

insert into categorias (cod_categ,nome_categ) values ( 1, 'CD'), ( 2, 'DVD'), ( 3, 'Acessórios');

insert into produtos (
  cod_prodt,
  nome_prodt,
  quant_estoque,
  data_fab,
  valor_un,
  data_cad_prodt,
  cod_func_cad,
  cod_categ) values ( 1 , 'CD - FORFUN TEORIA DINAMICA GASTATIVA', 100, '2011-05-10', 19.99, '29-04-2022', 1, 1 ),
 ( 2 , 'DVD - FORFUN AO VIVO CIRCO VOADOR', 50, '2019-12-22', 49.99, '29-04-2022', 1 , 2 ),
( 3 , 'CAMISA INFINITAS POSSIBILIDADES - TAM P', 100, '2014-04-16', 69.99, '29-04-2022', 1 , 3 );

insert into clientes (cod_cliente,
  nome_cliente,
  login_cliente,
  senha_cliente,
  email_cliente,
  cpf_cliente,
  dt_nasc_cliente,
  tel_cliente,
  end_cliente) values ( 1 , 'Danilo Cutrim' , 'Danilo', 'cutrim', 'cutrimdanilo@gmail.com', '126.648.459-15', '14-04-1982', '21 98461-4546', 'Rua da Alegria - Ipanema/RJ'),
 ( 2 , 'Rodrigo Costa' , 'rodrigo', 'costa', 'costarodrigo@gmail.com', '234.481.458-15', '20-01-1979', '21 96491-4945', 'Rua da Alegria - Ipanema/RJ'),
 ( 3 , 'Nicolas Fassan' , 'nicolas', 'fassan', 'fassannicolas@gmail.com', '394.494.758-56', '03-10-1980', '21 93496-6495', 'Rua da Alegria - Ipanema/RJ');

 insert into pedidos ( cod_ped,
  cod_cliente,
  cod_prodt,
  cod_func) values (1, 3, 2, 1),
 (2, 2, 1, 1),
(3, 1, 3, 1);
