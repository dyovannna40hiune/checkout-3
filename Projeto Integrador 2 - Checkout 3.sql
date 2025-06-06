CREATE DATABASE cafeteria;
USE cafeteria;

CREATE TABLE produtos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    desc_prod VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT DEFAULT 0,
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE pedidos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100),
    data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) DEFAULT 'pendente',
    valor_total DECIMAL(10, 2) DEFAULT 0.00,
    observacoes TEXT
);

CREATE TABLE itens_pedido(
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT,
    produto_id INT,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id),
    FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO Produtos (nome, descricao, preco, estoque) VALUES
('Café Expresso', 5.00, 200),
('Cappuccino', 8.50, 150),
('Pão de Queijo', 4.00, 100);

INSERT INTO Pedidos (cliente, status, valor_total) VALUES
('Ana', 'pago', 19.50),
('Paulo', 'pendente', 12.50);

INSERT INTO ItensPedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 5.00),
(1, 3, 2, 4.00),
(1, 2, 1, 6.50);