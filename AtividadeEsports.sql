create table Arena (
	Id serial primary key,
	ArenaNome varchar(100) not null,
	Capacidade int not null,
	Modalidade varchar(100) not null
);

create table Player (
	Id serial primary key,
	PlayerNome varchar(100) not null,
	Nickname varchar(100) not null,
	DataDeNascimento date not null,
	Salario decimal(10,2) not null,
	OrgId int not null,
	constraint fk_player_org foreign key (OrgId) references Org(Id)
);

create table Org (
	Id serial primary key,
	OrgNome varchar(100) not null
);

create table Partidas (
	Id serial primary key,
	ArenaId int not null,
	Org1Id int not null,
	Org2Id int not null,
	DataDaPartida date not null,
    Horario time not null,
    constraint fk_partida_arena foreign key (ArenaId) references Arena(Id),
    constraint fk_partida_org1 foreign key (Org1Id) references Org(Id),
    constraint fk_partida_org2 foreign key (Org2Id) references Org(Id),
    constraint chk_times_diferentes check (Org1Id <> Org2Id)
);

create table Patrocinadores (
	Id serial primary key,
	PatrocinadorNome varchar(100) not null,
	Categoria varchar(100) not null,
	ValorInvestido decimal(10,2) not null
)

create table Usuario (
	Id serial primary key,
	UsuarioNome varchar(100)
)

create table Ingresso (
	Id serial primary key,
	UsuarioId int not null,
	TipoIngressoId int not null,
	ArenaId int not null,
	foreign key (UsuarioId) references Usuario(Id),
	foreign key (TipoIngressoId) references TipoIngresso(Id),
	foreign key (ArenaId) references Arena(Id)
)

create table TipoIngresso (
	Id serial primary key,
	Tipo varchar(100),
	Preco decimal(10,2)
)

insert into TipoIngresso (Tipo,Preco) values
('Diário', 49),
('Premium', 70),
('BackStage', 199)

create table Plataformas (
	Id serial primary key,
	Nome varchar(100)
)

insert into Plataformas (Nome) values
('Kick'),
('Youtube'),
('Twitch')

create table Streamers (
	Id serial primary key,
	NomeStreamer varchar(100) not null,
	PlataformasId int not null,
	Seguidores int not null,
	foreign key (PlataformasId) references Plataformas(Id)
);

create table Lotacao (
	Id serial primary key,
	IngressosVendidos int not null,
	ArenaId int not null,
	foreign key (ArenaId) references Arena(Id)
)

insert into Arena (ArenaNome, Capacidade, Modalidade) values
('Jeunesse Arena (Rio)', 15000, 'Esports - CS2'),
('Lanxess Arena (Colônia)', 18000, 'Esports - CS2'),
('Spodek Arena (Katowice)', 11000, 'Esports - CS2');

insert into Org (OrgNome) values
('FURIA Esports'),
('Imperial Esports'),
('Natus Vincere (NAVI)'),
('FaZe Clan');

insert into Player (PlayerNome, Nickname, DataDeNascimento, Salario, OrgId) values
-- ==========================================
-- FURIA Esports (OrgId: 1)
-- ==========================================
('Gabriel Toledo', 'FalleN', '1991-05-30', 35000.00, 1),
('Yuri Santos', 'yuurih', '1999-12-22', 25000.00, 1),
('Kaike Cerato', 'KSCERATO', '1999-09-12', 30000.00, 1),
('Marcelo Cespedes', 'chelo', '1998-05-13', 18000.00, 1),
('Felipe Medeiros', 'skullz', '2002-05-02', 15000.00, 1),

-- ==========================================
-- Imperial Esports (OrgId: 2)
-- ==========================================
('Vinicius Figueiredo', 'VINI', '1999-05-16', 18000.00, 2),
('Henrique Teles', 'HEN1', '1995-07-14', 15000.00, 2),
('João Vasconcellos', 'felps', '1996-12-16', 16000.00, 2),
('Kaiky Santos', 'noway', '2005-01-10', 10000.00, 2),
('Lucas de Oliveira', 'decenty', '2004-03-22', 10000.00, 2),

-- ==========================================
-- Natus Vincere (OrgId: 3)
-- ==========================================
('Aleksandr Kostyliev', 's1mple', '1997-10-02', 50000.00, 3),
('Valerij Vakhovsjkyj', 'b1t', '2003-01-05', 35000.00, 3),
('Aleksi Virolainen', 'Aleksib', '1997-03-24', 30000.00, 3),
('Justinas Lekavicius', 'jL', '1999-09-29', 28000.00, 3),
('Ihor Zhdanov', 'w0nderful', '2004-12-14', 22000.00, 3),

-- ==========================================
-- FaZe Clan (OrgId: 4)
-- ==========================================
('Finn Andersen', 'karrigan', '1990-04-14', 40000.00, 4),
('Håvard Nygaard', 'rain', '1994-08-27', 35000.00, 4),
('Robin Kool', 'ropz', '1999-12-22', 45000.00, 4),
('Helvijs Saukants', 'broky', '2001-02-14', 38000.00, 4),
('David Čerňanský', 'frozen', '2002-07-18', 35000.00, 4);

insert into Partidas (ArenaId, Org1Id, Org2Id, DataDaPartida, Horario) values
(1, 1, 2, '2026-07-15', '18:00:00'), -- FURIA vs Imperial na Jeunesse Arena
(2, 3, 4, '2026-08-20', '15:30:00'), -- NAVI vs FaZe na Lanxess Arena
(1, 1, 4, '2026-07-16', '21:00:00'); -- FURIA vs FaZe na Jeunesse Arena

insert into Patrocinadores (PatrocinadorNome, Categoria, ValorInvestido) values
('Red Bull', 'Bebidas Energéticas', 500000.00),
('Intel', 'Hardware / Processadores', 1200000.00),
('BetBoom', 'Casas de Apostas', 850000.00);

insert into Streamers (NomeStreamer, PlataformasId, Seguidores) values
('Gaules', 3, 4200000),      -- Twitch
('Alexandre Borba', 1, 150000), -- Kick
('MCH_TV', 2, 350000);        -- Youtube 

insert into Usuario (UsuarioNome) values
('Lucas Almeida Santos'),
('Beatriz Costa Rodrigues'),
('Thiago Silva Pereira'),
('Larissa Oliveira Carvalho'),
('Gabriel Martins Gomes'),
('Fernanda Ribeiro Sousa'),
('Rafael Alves Melo'),
('Camila Rocha Fernandes'),
('Felipe Dias Barbosa'),
('Aline Castro Lima'),
('Rodrigo Kunz'),
('Juliana Schons'),
('Gustavo Mueller'),
('Patricia Werlang'),
('Leonardo Schmidt'),
('Sofia Kist'),
('Matheus Reis'),
('Isabela Glesse'),
('Daniel Friedrich'),
('Caroline Jaeger');

-- Ingressos para a Jeunesse Arena (Buscando por Nome para evitar erro de ID)
insert into Ingresso (UsuarioId, TipoIngressoId, ArenaId) values
((select Id from Usuario where UsuarioNome = 'Lucas Almeida Santos' limit 1), 1, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Beatriz Costa Rodrigues' limit 1), 2, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Thiago Silva Pereira' limit 1), 2, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Larissa Oliveira Carvalho' limit 1), 3, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Gabriel Martins Gomes' limit 1), 1, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Fernanda Ribeiro Sousa' limit 1), 1, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Rafael Alves Melo' limit 1), 2, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Camila Rocha Fernandes' limit 1), 3, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Lucas Almeida Santos' limit 1), 2, (select Id from Arena where ArenaNome like '%Jeunesse%' limit 1)),

-- Ingressos para a Lanxess Arena
((select Id from Usuario where UsuarioNome = 'Felipe Dias Barbosa' limit 1), 3, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Aline Castro Lima' limit 1), 3, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Rodrigo Kunz' limit 1), 1, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Juliana Schons' limit 1), 2, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Gustavo Mueller' limit 1), 2, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Patricia Werlang' limit 1), 1, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Leonardo Schmidt' limit 1), 1, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Felipe Dias Barbosa' limit 1), 2, (select Id from Arena where ArenaNome like '%Lanxess%' limit 1)),

-- Ingressos para a Spodek Arena
((select Id from Usuario where UsuarioNome = 'Sofia Kist' limit 1), 1, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Matheus Reis' limit 1), 1, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Isabela Glesse' limit 1), 1, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Daniel Friedrich' limit 1), 2, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Caroline Jaeger' limit 1), 3, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Sofia Kist' limit 1), 2, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Matheus Reis' limit 1), 3, (select Id from Arena where ArenaNome like '%Spodek%' limit 1)),
((select Id from Usuario where UsuarioNome = 'Thiago Silva Pereira' limit 1), 1, (select Id from Arena where ArenaNome like '%Spodek%' limit 1));

insert into lotacao (IngressosVendidos, ArenaId) values
(9, 1),
(8, 2),
(8, 3)

select count(*)
from ingresso
where ArenaId = 3

