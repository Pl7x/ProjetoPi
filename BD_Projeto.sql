CREATE TABLE tb_Funcionario (
    id_Fun SERIAL PRIMARY KEY,
    no_Fun VARCHAR(50) NOT NULL,
    cpf_Fun VARCHAR(14) UNIQUE NOT NULL,
    cargo_Fun VARCHAR(20),
    nasc_Fun DATE NOT NULL,
    tel_Fun VARCHAR(15),
    end_Fun VARCHAR(100) NOT NULL,
    sexo_Fun CHAR(1) NOT NULL CHECK (sexo_Fun IN ('F','M')),
    senha_Fun VARCHAR(8) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    dt_CF TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Status BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE tb_Combustivel (
    id_Combustivel SERIAL PRIMARY KEY,
    no_Combustivel VARCHAR(50) NOT NULL,
    cap_max DECIMAL(10,2) NOT NULL,
    estoque_atual DECIMAL(10,2) NOT NULL,
    preco_litro DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_Compra (
    id_Compra SERIAL PRIMARY KEY,
    id_Fun INTEGER NOT NULL,
    id_Combustivel INTEGER NOT NULL,
    qntd_Litros DECIMAL(10,2) NOT NULL,
    valor_Pago DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(10) NOT NULL CHECK (forma_pagamento IN ('dinheiro', 'pix', 'cartao')),
    dt_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_Fun) REFERENCES tb_Funcionario(id_Fun),
    FOREIGN KEY (id_Combustivel) REFERENCES tb_Combustivel(id_Combustivel)
);

select c.qntd_litros,co.preco_litro,(qntd_litros *   preco_litro) total  from tb_compra c
join tb_funcionario p on c.id_fun = p.id_fun
join tb_combustivel co  on c.id_combustivel = co.id_combustivel


INSERT INTO tb_Compra (id_Fun, id_Combustivel, qntd_Litros, valor_Pago, forma_pagamento) VALUES
(1, 1, 50.00, 274.50, 'pix'),
(2, 3, 100.00, 489.00, 'cartao'),
(3, 2, 30.00, 173.70, 'dinheiro');

--FAZER!!
--ALTER TABLE tb_Funcionario
--ALTER COLUMN senha_Fun TYPE VARCHAR(8);

select *from tb_Combustivel;
