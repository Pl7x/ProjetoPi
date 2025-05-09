CREATE TABLE tb_Cliente (
    id_Cliente serial PRIMARY KEY,
    no_Cliente VARCHAR(50) NOT NULL,
    cpf_Cliente VARCHAR(14) UNIQUE NOT NULL,
    email_Cliente VARCHAR(50) UNIQUE NOT NULL,
    nasc_Cliente DATE NOT NULL,
    tel_Cliente VARCHAR(15),
    end_Cliente VARCHAR(100) NOT NULL,
    sexo_Cliente VARCHAR(1) NOT NULL,
    dt_CC TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_Funcionario (
    id_Fun serial PRIMARY KEY,
    no_Fun VARCHAR(50) NOT NULL,
    cpf_Fun VARCHAR(14) unique NOT NULL,
    email_Fun VARCHAR(50) NOT NULL,
    nasc_Fun DATE NOT NULL,
    tel_Fun VARCHAR(15),
    end_Fun VARCHAR(100),
    sexo_Fun VARCHAR(1),
    senha_Fun VARCHAR(12),
    salario DECIMAL(10,2),
    dt_CF TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tb_Combustivel (
    id_Combustivel serial PRIMARY KEY,
    no_Combustivel VARCHAR(50) NOT NULL,
    estoque_litros DECIMAL(10,2) NOT NULL,
    estoque_atual DECIMAL(10,2),
    preco_litro DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_Compra (
    id_Compra serial PRIMARY KEY,
    id_Cliente INTEGER REFERENCES tb_Cliente(id_Cliente),
    id_Fun INTEGER REFERENCES tb_Funcionario(id_Fun),
    id_Combustivel INTEGER REFERENCES tb_Combustivel(id_Combustivel),
    qntd_Litros DECIMAL(10,2) NOT NULL,
    valor_Pago DECIMAL(10,2) NOT NULL,
    dt_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
