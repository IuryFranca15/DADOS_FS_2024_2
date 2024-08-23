CREATE DATABASE FESTIVAL_DE_MUSICA;
USE FESTIVAL_DE_MUSICA;
DROP DATABASE FESTIVAL_DE_MUSICA;

CREATE TABLE Bandas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    genero VARCHAR(50),
    pais CHAR(2),
    precointeira DECIMAL(10,2) NOT NULL,
    precomeia DECIMAL(10,2) NOT NULL
);

INSERT INTO Bandas (nome, genero, pais, precointeira, precomeia) VALUES 
("Green day", "punk", "US", 600.00, 300.00),
("Strokes", "indie", "US", 600.00, 300.00),
("Depeche Mode", "new wave", "UK", 800.00, 400.00),
("Ana Frango Eletrico", "indie", "BR", 500.00, 250.00),
("New Order", "new wave", "UK", 800.00, 400.00),
("Lauryn Hill", "hip hop", "US", 500.00, 250.00);

CREATE TABLE Funcionarios (
	funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    funcao VARCHAR(100),
    zona INT,
    telefone CHAR(11),
    voluntario BOOL
);

INSERT INTO Funcionarios (nome, funcao, zona, telefone, voluntario) VALUES 
	("João da Burra", "Limpeza", 1, "83987654321", FALSE),
    ("Rafael Felipe", "Atendimento", 2, "83987654322", TRUE),
    ("Nilo Montenegro", "Limpeza", 3, "84987654323", TRUE),
	("Ricardo França", "Coordenação", 1, "83987654324", FALSE),
	("João Paulo Pereira", "Técnico de Som", 4, "11987654325", FALSE),
    ("João Lucas Pereira", "Técnico de Som", 4, "11987654326", FALSE);
    
CREATE TABLE Produtos (
    produto_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL,
    categoria VARCHAR(255) NOT NULL
);

SET SQL_SAFE_UPDATES = 0;

INSERT INTO Produtos (nome, descricao, preco, quantidade_estoque, categoria) VALUES
("Camisa Green Day", "Camisa de algodão com estampa", 79.90, 1500, "Vestuário"),
("Boné do festival", "Boné com logo do festival", 49.90, 2000, "Vestuário"),
("Chaveiro Strokes", "Chaveiro da banda the Strokes", 29.90, 50, "Acessórios"),
("Copo do festival", "Conjunto de 4 copos com tema do festival", 59.90, 6000, "Acessórios"),
("Capa de Chuva", "Capa de chuva descartável com logo do festival", 19.90, 5000, "Acessórios"),
("Setlist Ana Frango Eletrico", "Setlist do artista com artes para fãs", 200.00, 80, "Acessórios"),
("Power Bank", "Carregador portátil com tema do festival", 180.90, 60, "Eletrônicos"),
("Garrafa Térmica", "Garrafa térmica de aço inoxidável com logo do festival", 89.90, 120, "Acessórios"),
("Poster Oficial", "Pôster oficial do festival com as bandas participantes", 39.90, 250, "Decoração"),
("CD Coletânea", "CD com as principais músicas das bandas do festival", 49.90, 100, "Mídia");


CREATE TABLE Pedidos (
    pedido_id INT AUTO_INCREMENT PRIMARY KEY,
    cod_produto INT,
    quantidade INT NOT NULL,
    FOREIGN KEY (cod_produto) REFERENCES Produtos(produto_id)
);

INSERT INTO Pedidos (cod_produto, quantidade) VALUES
(1, 250),  
(3, 49),    
(5, 4600),  
(7, 1),     
(9, 3);   

CREATE TABLE Clientepista(
	clientepista_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100),
	menor18 BOOL,
	email VARCHAR(50),
    pagantemeia BOOL,
	Telefone CHAR(11)
);

INSERT INTO Clientepista (nome, menor18, email, pagantemeia, telefone) VALUES
("Joãozinho", FALSE, "joão.almeida@email.com", TRUE, "11987654321"),
("Fulainho", TRUE, "fulaninho.costa@email.com", TRUE, "83987654322"),
("Mulambinho", FALSE, "mulambinho.souza@email.com", FALSE, "83987654323"),
("Tapioca da Silva", TRUE, "tapioquinha@email.com", TRUE, "11987654324"),
("Adenosvanderson", FALSE, "adeno.pedro@email.com", FALSE, "11987654325");


CREATE TABLE ClienteVIP(
	clienteVIP_id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100),
	menor18 BOOL,
	email VARCHAR(50),
    pagantemeia BOOL,
	Telefone CHAR(11)
);

INSERT INTO ClienteVIP (nome, menor18, email, pagantemeia, telefone) VALUES
("Iury França", FALSE, "Iury.França@email.com", TRUE, "83987654326"),
("Jose Vitor", FALSE, "vitorfa@email.com", TRUE, "11987654327"),
("Jose Vitor", TRUE, "vitinho.fernandes@email.com", TRUE, "11987654328"),
("Maria Eduarda", FALSE, "maria.duarte@email.com", FALSE, "84987654329"),
("Maria Eduarda", TRUE, "maria.almeida@email.com", TRUE, "84987654330");


CREATE TABLE Servicos (
	servico_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    id_responsavel INT,
    custo DECIMAL(10,2),
    FOREIGN KEY (id_responsavel) REFERENCES Funcionarios (funcionario_id)
);

INSERT INTO Servicos (nome, id_responsavel, custo) VALUES
("Limpeza da Área VIP", 1, 1200.00),   
("Atendimento ao Cliente", 2, 800.00), 
("Limpeza Geral", 3, 1500.00),       
("Coordenação Geral", 4, 2500.00),   
("Montagem de Som", 5, 3000.00),    
("Ajuste de Som", 6, 2500.00);


CREATE TABLE Palcos (
    palco_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    banda_id INT,
    hora DATETIME,
    FOREIGN KEY (banda_id) REFERENCES Bandas(id)
);

INSERT INTO Palcos (nome, banda_id, hora) VALUES
("Palco Principal", 1, '2024-10-15 18:00:00'), 
("Palco Alternativo", 2, '2024-10-15 19:30:00'),
("Palco Eletrônico", 3, '2024-10-15 21:00:00'), 
("Palco Indie", 4, '2024-10-16 17:00:00'),
("Palco New Wave", 5, '2024-10-16 19:30:00'),
("Palco Hip Hop", 6, '2024-10-16 21:00:00');

-- selecionando os funcionarios em que o nome do serviço prestado é Atendimento ao cliente
SELECT Funcionarios.nome FROM Funcionarios
INNER JOIN Servicos ON Servicos.id_responsavel = Funcionarios.funcionario_id
WHERE Servicos.nome = "Atendimento ao Cliente";

-- selecionando o palco dos artistas e o id das bandas cujo preco da inteira está entre 400 e 700
SELECT Palcos.nome, Palcos.banda_id FROM Palcos
INNER JOIN Bandas ON Bandas.id = Palcos.banda_id
WHERE Bandas.precointeira BETWEEN 400 AND 700;

-- contando as bandas indie  
SELECT COUNT(*) AS bandas_indie
FROM Bandas
WHERE genero = 'indie';

-- contando os pedidos de acessários entre 10 e 100 reais
SELECT SUM(Pedidos.quantidade) AS TOTAL FROM Pedidos
INNER JOIN Produtos ON Pedidos.cod_produto = Produtos.produto_id
WHERE Produtos.categoria = "Acessórios" AND
Produtos.preco BETWEEN 10 AND 100;

select * from Palcos;
-- atualizando o palco da banda Depeche mode
UPDATE Palcos
SET nome = "Palco New Wave", hora = '2024-10-15 21:30:00'
WHERE Palcos.banda_id = 3;