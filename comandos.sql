create table Cliente (
	Id serial primary key,
	Nome varchar(100) not null,
	Email varchar(100),
	Genero varchar(1) not null,
	DataDeNascimento date not null
)

insert into Cliente (Nome, Email, Genero, DataDeNascimento)
values ('Ricardo Pick', 'ricardo8pick@gmail.com', 'M', '2008-02-12')

insert into Cliente (Nome, Genero, DataDeNascimento)
values ('Maria Sladoq', 'F', '2009-03-13')

-- seleciona todas as colunas de cliente
select *
from Cliente

-- seleciona somente o nome e emial de cliente
select Nome, Email
from Cliente

-- seleciona todas as colunas onde o Genero do cliente for 'M'
select *
from cliente
where Genero = 'M'

-- seleciona todas as colunas de cliente ordenado por DataDeNascimento
select *
from cliente
order by DataDeNascimento desc

-- atualiza o email de cliente cujo Id é igual a 2
update Cliente
set Email = 'mariasladoq@gmail.com'
where Id = 2

-- remove cliente cujo id seja = 5 
delete from cliente
where Id = 5

-- remove o da tabela valores menor que 100
delete from Pedido
where ValorTotal < 100

-- mostra os pedidos que sao em janeiro
select NomeCliente, DataPedido, ValorTotal
from Pedido
where DataPedido >= '2026-01-01' and DataPedido <= '2026-01-31'

-- mostra os pedidos onde contem urgente na frase em Observacao
select *
from Pedido
where Observacao like '%urgente%'


