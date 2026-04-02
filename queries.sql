DROP TABLE IF EXISTS itens_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
    id INT,
    nome VARCHAR(50),
    cidade VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT,
    cliente_id INT,
    data DATE
);

CREATE TABLE itens_pedido (
    id INT,
    pedido_id INT,
    produto VARCHAR(50),
    preco INT,
    quantidade INT
);

INSERT INTO clientes (id, nome, cidade) VALUES
(1, 'João', 'SP'),
(2, 'Maria', 'RJ'),
(3, 'Pedro', 'MG'),
(4, 'Ana', 'SP');

INSERT INTO pedidos (id, cliente_id, data) VALUES
(1, 1, '2024-01-01'),
(2, 2, '2024-01-02'),
(3, 1, '2024-01-03'),
(4, 3, '2024-01-04');

INSERT INTO itens_pedido (id, pedido_id, produto, preco, quantidade) VALUES
(1, 1, 'Notebook', 3000, 1),
(2, 1, 'Mouse', 50, 2),
(3, 2, 'Teclado', 100, 1),
(4, 3, 'Notebook', 3000, 1),
(5, 4, 'Mouse', 50, 3);

--nome de clientes/produtos/quantidades e preços:
SELECT clientes.nome, SUM(itens_pedido.preco * itens_pedido.quantidade) AS faturamento_total
FROM clientes
JOIN pedidos
     ON pedidos.cliente_id = clientes.id
JOIN itens_pedido
     ON itens_pedido.pedido_id = pedidos.id
GROUP BY clientes.nome
ORDER BY faturamento_total DESC;

SELECT produto, SUM(preco * quantidade) AS faturamento
FROM itens_pedido
GROUP BY produto
ORDER BY faturamento DESC;

SELECT produto, SUM(quantidade) AS venda
FROM itens_pedido
GROUP BY produto
ORDER BY venda DESC;