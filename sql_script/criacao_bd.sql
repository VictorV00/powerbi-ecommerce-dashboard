
-- SCRIPT COMPLETO PARA CRIAÇÃO E POPULAÇÃO DO BANCO DE DADOS E-COMMERCE FICTICIO
-- Descrição: Este script cria a estrutura do banco de dados e insere
-- todos os dados de exemplo para o projeto de análise de BI.

DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

-- CRIAÇÃO DAS TABELAS (DDL)

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    data_cadastro DATE NOT NULL,
    estado VARCHAR(2) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) DEFAULT 'Em processamento',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE
);

CREATE TABLE itens_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT,
    id_produto INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido) ON DELETE CASCADE,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto) ON DELETE CASCADE
);

-- INSERÇÃO DOS DADOS (DML)

-- Inserindo todos os 29 Clientes
INSERT INTO clientes (nome, email, data_cadastro, estado) VALUES
('Ana Silva', 'ana.silva@email.com', '2025-01-10', 'SP'),
('Bruno Costa', 'bruno.costa@email.com', '2025-01-15', 'RJ'),
('Carla Dias', 'carla.dias@email.com', '2025-02-05', 'MG'),
('Daniel Farias', 'daniel.farias@email.com', '2025-02-20', 'SP'),
('Eduarda Lima', 'eduarda.lima@email.com', '2025-03-12', 'BA'),
('Fábio Neves', 'fabio.neves@email.com', '2025-04-01', 'RJ'),
('Gabriel Rocha', 'gabriel.rocha@email.com', '2025-05-02', 'PR'),
('Helena Souza', 'helena.souza@email.com', '2025-05-18', 'SC'),
('Igor Martins', 'igor.martins@email.com', '2025-06-11', 'SP'),
('Juliana Alves', 'juliana.alves@email.com', '2025-06-25', 'RS'),
('Lucas Pereira', 'lucas.pereira@email.com', '2025-07-08', 'MG'),
('Mariana Barros', 'mariana.barros@email.com', '2025-08-01', 'BA'),
('Nicolas Fogaça', 'nicolas.fogaca@email.com', '2025-08-15', 'SC'),
('Otávio Mendes', 'otavio.mendes@email.com', '2025-08-22', 'PR'),
('Pietra Cardoso', 'pietra.cardoso@email.com', '2025-09-01', 'SP'),
('Quintino Aires', 'quintino.aires@email.com', '2025-09-05', 'RJ'),
('Raissa Queiroz', 'raissa.queiroz@email.com', '2025-09-11', 'MG'),
('Samuel Viana', 'samuel.viana@email.com', '2025-09-18', 'BA'),
('Tatiana Nogueira', 'tatiana.nogueira@email.com', '2025-10-02', 'SP'),
('Ulisses Brandão', 'ulisses.brandao@email.com', '2025-10-07', 'RJ'),
('Valentina Freire', 'valentina.freire@email.com', '2025-10-15', 'MG'),
('William Tavares', 'william.tavares@email.com', '2025-10-23', 'RS'),
('Xavier Ramalho', 'xavier.ramalho@email.com', '2025-11-04', 'PR'),
('Yasmin Gusmão', 'yasmin.gusmao@email.com', '2025-11-12', 'SC'),
('Zeca Fagundes', 'zeca.fagundes@email.com', '2025-11-20', 'SP'),
('Amanda Furtado', 'amanda.furtado@email.com', '2025-12-01', 'RJ'),
('Bento Rabelo', 'bento.rabelo@email.com', '2025-12-05', 'MG'),
('César Dantas', 'cesar.dantas@email.com', '2025-08-19', 'SP'),
('Débora Mello', 'debora.mello@email.com', '2025-08-25', 'PR');

-- Inserindo todos os 24 Produtos
INSERT INTO produtos (nome_produto, categoria, preco) VALUES
('Notebook Gamer', 'Eletrônicos', 5500.00),
('Smartphone Pro', 'Eletrônicos', 3200.00),
('Cadeira de Escritório', 'Móveis', 800.00),
('Mesa Digitalizadora', 'Eletrônicos', 450.00),
('Livro "SQL para Leigos"', 'Livros', 90.00),
('Cafeteira Elétrica', 'Eletrodomésticos', 250.00),
('Monitor 4K', 'Eletrônicos', 1800.00),
('Teclado Mecânico', 'Eletrônicos', 350.00),
('Luminária de Mesa', 'Móveis', 120.00),
('Livro "Código Limpo"', 'Livros', 110.00),
('Headset Gamer', 'Eletrônicos', 400.00),
('Mousepad XXL', 'Eletrônicos', 150.00),
('Cadeira Gamer Pro', 'Móveis', 1400.00),
('Livro "Arquitetura Limpa"', 'Livros', 130.00),
('Webcam Full HD', 'Eletrônicos', 280.00),
('SSD 1TB NVMe', 'Eletrônicos', 600.00),
('Mochila para Notebook', 'Acessórios', 220.00),
('Garrafa Térmica', 'Acessórios', 80.00),
('Apoio de Pulso Ergonômico', 'Acessórios', 60.00),
('Fragmentadora de Papel', 'Escritório', 450.00),
('Projetor Portátil', 'Eletrônicos', 1200.00),
('Máquina de Waffle', 'Eletrodomésticos', 180.00),
('Fones de Ouvido Bluetooth', 'Eletrônicos', 310.00),
('Agenda Planner 2026', 'Escritório', 75.00);

-- Inserindo todos os 49 Pedidos
INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES
(1, '2025-01-20', 'Entregue'), (2, '2025-01-25', 'Entregue'), (3, '2025-02-10', 'Entregue'),
(1, '2025-02-15', 'Entregue'), (4, '2025-03-01', 'Entregue'), (1, '2025-03-20', 'Entregue'),
(5, '2025-03-22', 'Em processamento'), (2, '2025-04-05', 'Entregue'), (6, '2025-04-10', 'Aguardando pagamento'),
(7, '2025-05-15', 'Entregue'), (3, '2025-05-28', 'Entregue'), (9, '2025-06-05', 'Entregue'),
(8, '2025-06-18', 'Em processamento'), (1, '2025-06-22', 'Entregue'), (11, '2025-07-01', 'Cancelado'),
(10, '2025-07-19', 'Entregue'), (4, '2025-07-25', 'Entregue'), (12, '2025-08-03', 'Entregue'),
(2, '2025-08-12', 'Em processamento'), (7, '2025-08-20', 'Entregue'), (15, '2025-09-02', 'Entregue'),
(16, '2025-09-06', 'Entregue'), (17, '2025-09-10', 'Entregue'), (18, '2025-09-15', 'Cancelado'),
(13, '2025-09-20', 'Entregue'), (1, '2025-09-28', 'Entregue'), (19, '2025-10-03', 'Entregue'),
(20, '2025-10-08', 'Entregue'), (21, '2025-10-12', 'Em processamento'), (22, '2025-10-18', 'Entregue'),
(5, '2025-10-22', 'Entregue'), (8, '2025-10-25', 'Entregue'), (14, '2025-10-30', 'Entregue'),
(23, '2025-11-05', 'Entregue'), (24, '2025-11-10', 'Entregue'), (25, '2025-11-15', 'Aguardando pagamento'),
(9, '2025-11-20', 'Entregue'), (3, '2025-11-25', 'Entregue'), (11, '2025-11-28', 'Entregue'),
(26, '2025-12-02', 'Entregue'), (27, '2025-12-06', 'Entregue'), (2, '2025-12-10', 'Entregue'),
(1, '2025-12-15', 'Em processamento'), (16, '2025-12-20', 'Entregue'), (18, '2025-12-22', 'Entregue'),
(5, '2025-08-05', 'Entregue'), (12, '2025-08-11', 'Entregue'), (28, '2025-08-21', 'Entregue'),
(29, '2025-08-28', 'Em processamento');

-- Inserindo todos os Itens dos Pedidos
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(1, 2, 1, 3200.00), (1, 5, 1, 90.00), (2, 3, 1, 800.00), (3, 6, 1, 250.00), (3, 9, 2, 120.00),
(4, 7, 1, 1800.00), (5, 4, 1, 450.00), (6, 1, 1, 5500.00), (6, 8, 1, 350.00), (7, 5, 2, 90.00),
(8, 7, 1, 1800.00), (8, 8, 1, 350.00), (9, 2, 1, 3200.00), (10, 13, 1, 1400.00), (11, 14, 1, 130.00),
(11, 5, 1, 90.00), (12, 1, 1, 5500.00), (12, 11, 1, 400.00), (12, 12, 1, 150.00), (13, 6, 2, 250.00),
(14, 2, 1, 3200.00), (15, 7, 1, 1800.00), (16, 3, 2, 800.00), (17, 11, 1, 400.00), (17, 8, 1, 350.00),
(18, 14, 2, 130.00), (19, 4, 1, 450.00), (20, 7, 1, 1800.00), (21, 15, 1, 280.00), (21, 19, 1, 60.00),
(22, 16, 1, 600.00), (23, 17, 2, 220.00), (24, 18, 1, 80.00), (25, 23, 1, 310.00), (26, 1, 1, 5500.00),
(27, 22, 1, 180.00), (28, 16, 1, 600.00), (28, 15, 1, 280.00), (29, 3, 1, 800.00), (30, 11, 2, 400.00),
(31, 14, 3, 130.00), (32, 18, 4, 80.00), (33, 23, 2, 310.00), (34, 1, 1, 5500.00), (34, 13, 1, 1400.00),
(35, 2, 1, 3200.00), (36, 6, 1, 250.00), (37, 7, 1, 1800.00), (37, 8, 1, 350.00), (38, 17, 1, 220.00),
(39, 22, 2, 180.00), (40, 16, 1, 600.00), (41, 1, 1, 5500.00), (41, 11, 1, 400.00), (41, 12, 1, 150.00),
(42, 5, 5, 90.00), (42, 14, 5, 130.00), (43, 2, 2, 3200.00), (44, 3, 1, 800.00), (44, 9, 1, 120.00),
(45, 17, 3, 220.00), (46, 21, 1, 1200.00), (47, 17, 1, 220.00), (47, 18, 2, 80.00), (48, 2, 1, 3200.00),
(49, 3, 1, 800.00), (49, 15, 1, 280.00);