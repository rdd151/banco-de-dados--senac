CREATE TABLE Usuario (
    Id SERIAL PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Telefone VARCHAR(20),
    DataCadastro TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Ativo BOOLEAN DEFAULT TRUE
);

create TABLE Pedido (
	Id serial primary key,
	UsuarioId int not null,
	DataPedido timestamp not null default CURRENT_TIMESTAMP,
	ValorTotal DECIMAL(10, 2) not null,
	Status VARCHAR(20) not null default 'Pendente', 
	FormaPagamento VARCHAR(30) null,
	Observacao VARCHAR(200) null,
	foreign key (UsuarioId) references Usuario(Id)
);

INSERT INTO Usuario (Nome, CPF, Email, Telefone, Ativo)
VALUES
('João Silva', '12345678901', 'joao.silva@gmail.com', '(11) 99876-1234', TRUE),
('Maria Oliveira', '23456789012', 'maria.oliveira@yahoo.com', '(21) 99765-4321', TRUE),
('Carlos Souza', '34567890123', 'carlos.souza@hotmail.com', '(31) 99654-3210', FALSE),
('Ana Pereira', '45678901234', 'ana.pereira@gmail.com', '(41) 99543-2109', TRUE),
('Fernanda Lima', '56789012345', 'fernanda.lima@outlook.com', '(51) 99432-1098', FALSE),
('Ricardo Gomes', '67890123456', 'ricardo.gomes@gmail.com', '(61) 99321-0987', TRUE),
('Patricia Alves', '78901234567', 'patricia.alves@yahoo.com', '(71) 99210-9876', TRUE),
('Lucas Martins', '89012345678', 'lucas.martins@hotmail.com', '(81) 99109-8765', FALSE),
('Juliana Rocha', '90123456789', 'juliana.rocha@gmail.com', '(91) 99098-7654', TRUE),
('Bruno Carvalho', '01234567890', 'bruno.carvalho@outlook.com', '(92) 98987-6543', TRUE);
INSERT INTO Pedido (UsuarioId, ValorTotal, Status, FormaPagamento, Observacao)
VALUES
(1, 250.75, 'Pago', 'Cartão de Crédito', 'Entrega expressa'),
(2, 89.90, 'Pendente', 'PIX', 'Cliente pediu embalagem presente'),
(3, 560.00, 'Enviado', 'Boleto', NULL),
(4, 120.50, 'Cancelado', 'Cartão de Débito', 'Pagamento não aprovado'),
(2, 999.99, 'Pago', 'PIX', 'Entrega agendada'),
(2, 45.00, 'Pendente', 'Dinheiro', NULL),
(1, 310.20, 'Enviado', 'Cartão de Crédito', 'Entregar após 18h'),
(3, 780.40, 'Pago', 'Boleto', NULL),
(1, 150.00, 'Pendente', 'PIX', 'Primeira compra do cliente'),
(5, 67.89, 'Pago', 'Cartão de Débito', NULL);

select *
from Pedido p
inner join Usiario u
on p.UsuarioId = u.Id

select id
from Pedido


