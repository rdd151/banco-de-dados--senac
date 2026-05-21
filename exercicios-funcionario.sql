create table Funcionario (
	Id serial primary key,
	Nome varchar(100) not null,
	Cargo varchar(50) not null,
	Salario decimal(10, 2) not null,
	DataAdmissao date not null
)

insert into Funcionario (Nome, Cargo, Salario, DataAdmissao)
values ('Ricardo Pick', 'administrador', 1800, '2024-02-12' )

insert into Funcionario (Nome, Cargo, Salario, DataAdmissao)
values ('Maria back', 'assistente', 2500, '2025-03-22')

insert into Funcionario (Nome, Cargo, Salario, DataAdmissao)
values ('Mario Armario', 'desenvolvedor', 3000, '2018-09-20')

select *
from Funcionario

select *
from Funcionario
where Salario >= 3000

select *
from Funcionario
WHERE EXTRACT(YEAR FROM DataAdmissao) = 2025
	
SELECT Nome, Cargo 
FROM Funcionario 
WHERE Cargo = 'desenvolvedor'

update Funcionario
set Cargo = 'Gerente'
where Id = 1

delete from Funcionario
where Id = 1

