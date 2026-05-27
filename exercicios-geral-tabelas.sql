create table Usuario (
	Id serial primary key,
	Usuario VARCHAR(100) NOT NULL,
    Email VARCHAR(100) unique,
    Telefone varchar(100) not null,
    Ativo boolean default true
);

create table Pedido (
	Id serial primary key,
	UsuarioId int not null,
	StatusId int not null,
	FormaPagamentoId int not null,
	DataPedido timestamp not null default CURRENT_TIMESTAMP,
	ValorTotal DECIMAL(10, 2) not null,
	Observacao varchar(200) null,
	foreign key (UsuarioId) references Usuario(Id),
	foreign key (StatusId) references Status(Id),
	foreign key (FormaPagamentoId) references FormaPagamento(Id)
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


select u.Nome,
c.Nome
from Usuario u
inner join Cidade c
on u.CidadeId = c.Id

select *
from Usuario
