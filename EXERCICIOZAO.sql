create table Usuario (
	Id serial primary key,
	Usuario VARCHAR(100) NOT NULL,
    Email VARCHAR(100) unique,
    Telefone varchar(100) not null,
    Ativo boolean default true
);

CREATE TABLE Pedido (
    Id SERIAL PRIMARY KEY,
    UsuarioId INT NOT NULL,
    DataPedido timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ValorTotal DECIMAL(10,2) NOT NULL,
    StatusId int NOT NULL DEFAULT 2,
    FormaPagamentoId int NOT NULL,
    Observacao VARCHAR(200) NULL,
    FOREIGN KEY (UsuarioId) REFERENCES Usuario(Id),
    foreign key (FormaPagamentoId) references FormaPagamento(Id),
    foreign key (StatusId) references Status(Id)
);

create table Status (
	Id serial primary key,
	StatusNome varchar(100) not null default 'pendente'
);

create table FormaPagamento (
	Id serial primary key,
	FormaPagamentoNome varchar(100) not null
);

insert into Usuario (Usuario, Email, Telefone, Ativo) values
('Carlos Silva', 'carlos.silva@email.com', '333333333', FALSE),
('Ana Sousa', 'ana.sousa@email.com', '222222222', TRUE),
('Bruno Costa', 'bruno.costa@email.com', '111111111', TRUE),
('Mariana Lima', 'mariana.lima@email.com', '444444444', FALSE),
('Ricardo Alves', 'ricardo.alves@email.com', '555555555', TRUE);

INSERT INTO Pedido (UsuarioId, ValorTotal, StatusId, FormaPagamentoId, Observacao)
VALUES
(1, 175.30, 3, 3, 'Envio imediato'),
(2, 450.00, 2, 2, NULL),
(3, 89.90, 1, 1, 'Deixar na portaria'),
(4, 1250.00, 4, 4, 'Cuidado frágil'),
(5, 65.00, 2, 5, 'Troco para R$ 100');

insert into Status (StatusNome) values
('Enviado'),
('Pago'),
('Pendente'),
('Cancelado');

insert into FormaPagamento (FormaPagamentoNome) values
('Cartão de débito'),
('Cartão de crédito'),
('PIX'),
('Boleto'),
('Dinheiro');


 select *
 from pedido p
 inner join Usuario u
 on p.UsuarioId = u.Id
 inner join Status s
 on p.StatusId = s.Id
 inner join formapagamento f
 on p.FormaPagamentoID = f.Id
 
-- 1
select (Usuario, Email, Ativo)
from usuario
where Ativo = true

--2 
select (Id, DataPedido, ValorTotal)
from pedido
where ValorTotal >= 500

--3
 select u.Usuario, p.ValorTotal
 from pedido p
 inner join Usuario u
 on p.UsuarioId = u.Id;
 
 --4 
SELECT COUNT(*) AS TotalUsuarios FROM Usuario;

--5
select *
from pedido
order by ValorTotal desc
limit 1;

--6 
SELECT AVG(ValorTotal) AS MediaPedidos FROM Pedido;

--7
SELECT SUM(ValorTotal) AS SomaTotalPedidos FROM Pedido;

--8
select u.Usuario, p.DataPedido, s.StatusNome
from pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join Status s
on p.StatusId = s.Id
where s.StatusNome = 'Pendente'

--9
select u.Usuario, p.ValorTOtal, f.formapagamentonome, s.StatusNome
from pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join Status s
on p.StatusId = s.Id
inner join FormaPagamento f
on p.FormaPagamentoId = f.Id
where f.formapagamentonome like 'Cartão%'

--10
select u.Usuario, p.DataPedido, p.ValorTOtal
from pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join Status s
on p.StatusId = s.Id
inner join FormaPagamento f
on p.FormaPagamentoId = f.Id
where p.ValorTotal >= 1000

--11
select u.Id, u.Usuario
from pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join Status s
on p.StatusId = s.Id
inner join FormaPagamento f
on p.FormaPagamentoId = f.Id
where u.Ativo = true

--12
select u.Usuario, s.StatusNome, p.Observacao
from pedido p
inner join Usuario u
on p.UsuarioId = u.Id
inner join Status s
on p.StatusId = s.Id
inner join FormaPagamento f
on p.FormaPagamentoId = f.Id
where p.Observacao is not null

--13
insert into Usuario (Usuario, Email, Telefone, Ativo) values
('Maria Oliveira', 'Maria.Oliveira@email.com', '666666666', TRUE)

INSERT INTO Pedido (UsuarioId, ValorTotal, StatusId, FormaPagamentoId, Observacao)
VALUES
(6, 3000, 3, 4, 'Força MAGALU!!')

update Usuario
set Telefone = '666667777'
where Id = 6

update Usuario
set Email = 'MariaOOOOlivera@gmail.com'
where Id = 6

select * from Usuario











create table Cidade(
	Id serial primary key,
	Nome varchar(100) not null,
	Estado varchar(2) not null
);

insert into Cidade (Nome, Estado) values
('São Paulo', 'SP'),
('Rio de Janeiro', 'RJ'),
('Belo Horizonte', 'MG'),
('Curitiba', 'PR'),
('Fortaleza', 'CE');

alter table Usuario
add column CidadeId INT;

update Usuario
set CidadeId = 3
where Id = 1

update Usuario
set CidadeId = 3
where Id = 2

update Usuario
set CidadeId = 2
where Id = 3

update Usuario
set CidadeId = 1
where Id = 4

update Usuario
set CidadeId = 3
where Id = 5


select u.Usuario,
c.Nome
from Usuario u
inner join Cidade c
on u.CidadeId = c.Id

select *
from Usuario




CREATE TABLE Produto (
Id SERIAL PRIMARY KEY,
Nome VARCHAR(150) NOT NULL,
Descricao TEXT,
Preco DECIMAL(10,2) NOT NULL,
Estoque INT DEFAULT 0,
Ativo BOOLEAN DEFAULT TRUE,
CriadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
AtualizadoEm TIMESTAMP DEFAULT CURRENT_TIMESTAMP
); 

INSERT INTO Produto (Nome, Descricao, Preco, Estoque)
VALUES
('Mouse Gamer', 'Mouse RGB 7200 DPI', 150.00, 25),
('Teclado Mecânico', 'Teclado switch blue', 350.00, 15),
('Monitor 24"', 'Monitor Full HD IPS', 899.90, 10),
('Headset Gamer', 'Headset com microfone', 250.75, 20),
('Notebook i5', 'Notebook 16GB RAM SSD 512GB', 4500.00, 5),
('Cadeira Gamer', 'Cadeira ergonômica reclinável', 1200.50, 8),
('Webcam HD', 'Webcam 1080p', 89.90, 30),
('Mousepad XXL', 'Mousepad extra grande', 45.00, 40),
('SSD 1TB', 'SSD NVMe Gen4', 560.00, 12),
('Fonte 650W', 'Fonte modular 80 Plus Bronze', 310.20, 18);

INSERT INTO PedidoProduto (PedidoId, ProdutoId, Quantidade, ValorUnitario, ValorTotal) VALUES
(1, 8, 3, 45.00, 135.00),
(1, 1, 1, 115.75, 115.75),
(2, 7, 1, 89.90, 89.90),
(3, 8, 4, 45.00, 180.00),
(3, 1, 2, 150.00, 300.00),
(3, 7, 1, 80.00, 80.00),
(4, 8, 2, 45.00, 90.00),
(4, 1, 1, 30.50, 30.50),
(5, 3, 1, 899.90, 899.90),
(5, 8, 2, 45.00, 90.00),
(5, 1, 1, 10.09, 10.09),
(6, 8, 1, 45.00, 45.00),
(7, 8, 2, 45.00, 90.00),
(7, 1, 1, 150.00, 150.00),
(7, 7, 2, 35.10, 70.20),
(8, 9, 1, 560.00, 560.00),
(8, 8, 2, 45.00, 90.00),
(8, 1, 1, 130.40, 130.40),
(9, 8, 2, 45.00, 90.00),
(9, 1, 2, 30.00, 60.00),
(10, 8, 1, 45.00, 45.00),
(10, 1, 3, 7.63, 22.89);

INSERT INTO Pedido (UsuarioId, ValorTotal, StatusId, FormaPagamentoId, Observacao)
VALUES
(1, 250.75, 1, 1, 'Entrega expressa'),
(2, 89.90, 2, 3, 'Cliente pediu embalagem presente'),
(3, 560.00, 3, 4, NULL),
(4, 120.50, 4, 2, 'Pagamento não aprovado'),
(2, 999.99, 1, 3, 'Entrega agendada'),
(2, 45.00, 2, 5, NULL),
(1, 310.20, 3, 1, 'Entregar após 18h'),
(3, 780.40, 1, 4, NULL),
(1, 150.00, 2, 3, 'Primeira compra do cliente'),
(5, 67.89, 1, 2, NULL);

select * 
from Pedido

select * 
from Produto

insert into pedido 
(Usuarioid,
datapedido,
valortotal,
statusid,
FormaPagamentoId,
observacao)
values(2, current_timestamp, 100, 2, 1, '');

select ped.Id as PedidoId,
u.Usuario,
ped.Datapedido,
prod.Nome,
pp.Valortotal,
pp.quantidade,
ped.ValorTotal
from pedidoproduto pp
inner join Pedido ped
on ped.id = pp.pedidoid
inner join produto prod
on prod.id = pp.produtoid
inner join usuario u
on ped.usuarioId = u.id
where u.id = 1

------------------------------------EXERCICIOZAO------------------------------------

-- 1
select *
from pedido
where ValorTotal between 100 and 500

--2
select count(id)
from usuario
where email like '%outlook&'

--3
select *
from pedido
order by ValorTotal desc limit 1

--4
select *
from pedido
order by ValorTotal limit 1

--5
select avg(ValorTotal)
from pedido 

--6
select p.Id, u.usuario, p.ValorTotal, f.formapagamentonome
FROM pedido p
INNER JOIN usuario u 
ON p.UsuarioId = u.Id
INNER JOIN formapagamento f 
ON p.FormaPagamentoId = f.Id
INNER JOIN status s 
ON p.StatusId = s.Id
WHERE p.ValorTotal >= 300;

--7
select u.usuario, c.nome, c.estado
from usuario u 
inner join cidade c 
on u.cidadeid = c.id
where u.ativo = false

--8
UPDATE Produto
SET Preco = Preco * 1.15
WHERE Nome IN ('Mouse Gamer', 'Mousepad XXL');

--9 
select 
	u.usuario as Nome_Usuario,
	count(p.Id) as Total_Pedidos
from usuario u
inner join pedido p
on u.Id = p.usuarioid 
GROUP BY u.Id, u.usuario
ORDER BY Total_Pedidos DESC;

--10
SELECT 
    prod.Nome AS Produto,
    SUM(pp.ValorTotal) AS Valor_Total_Vendido
FROM Produto prod
INNER JOIN PedidoProduto pp 
ON prod.Id = pp.ProdutoId
GROUP BY prod.Id, prod.Nome
ORDER BY Valor_Total_Vendido DESC;

--11
SELECT distinct	
	p.Id as Numero_Pedido,	
    u.usuario AS Nome_Usuario,
    P.valortotal as Valor_do_Pedido
FROM usuario u
INNER JOIN pedido p ON u.Id = p.UsuarioId
WHERE p.ValorTotal > (SELECT AVG(ValorTotal) FROM pedido)

--12
select 
	Id,
	Nome,
	Preco,
	Descricao
from produto
where preco > (select avg(preco)from produto)
order by preco