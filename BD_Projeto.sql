CREATE TABLE tb_Funcionario (
    id_Fun serial PRIMARY KEY,
    no_Fun VARCHAR(50) NOT NULL,
    cpf_Fun VARCHAR(14) UNIQUE NOT NULL,
    email_Fun VARCHAR(50),
    nasc_Fun DATE NOT NULL,
    tel_Fun VARCHAR(15),
    end_Fun VARCHAR(100) NOT NULL,
    sexo_Fun VARCHAR(1) NOT NULL CHECK (sexo_Fun IN ('F','M')),
    senha_Fun VARCHAR(12) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    dt_CF TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    Status BOOLEAN NOT NULL DEFAULT TRUE -- TRUE = Ativo, FALSE = Inativo
);

CREATE TABLE tb_Combustivel (
    id_Combustivel serial PRIMARY KEY,
    no_Combustivel VARCHAR(50) NOT NULL,
    cap_max DECIMAL(10,2) NOT NULL,
    estoque_atual DECIMAL(10,2) NOT NULL,
    preco_litro DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_Compra (
    id_Compra SERIAL PRIMARY KEY,
    id_Fun INTEGER,
    id_Combustivel INTEGER,
    qntd_Litros DECIMAL(10,2) NOT NULL,
    valor_Pago DECIMAL(10,2) NOT NULL,
    forma_pagamento VARCHAR(10) NOT NULL CHECK (forma_pagamento IN ('dinheiro', 'pix', 'cartao')),
    dt_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_Fun) REFERENCES tb_Funcionario(id_Fun),
    FOREIGN KEY (id_Combustivel) REFERENCES tb_Combustivel(id_Combustivel)
);
