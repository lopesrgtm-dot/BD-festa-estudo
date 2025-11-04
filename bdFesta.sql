create database bdFesta;

use bdFesta;

create table clientes
(
idCliente int auto_increment primary key,
nomeRazao varchar(255) not null,
tipoPessoa varchar(255) not null,
telefone int, # este campo deveria ser varchar pois o telefone vai superar 10 digitos
email varchar(255) not null,
logradouro varchar(255) not null,
numero int,
bairro varchar(255) not null,
UF varchar(255) not null,
CEP int,
ciade varchar(255) not null,
observacoes varchar(255) not null
);

DROP TABLE clientes;

select * from clientes;


create table eventos
(
idEvento int auto_increment primary key,
nomeEvento varchar(255) not null,
tipoEvento varchar(255) not null,
dataHoraInicio datetime not null,
dataHoraFim datetime not null,
contatoNoLocal varchar(255) not null,
enderecoEvento varchar(255) not null,
observacoes varchar(255) not null
);

select * from clientes;
select * from locacoes;

create table locacoes
(
idLocacao int auto_increment primary key,
idCliente int,
idEvento int,
constraint fk_idCliente_locacao foreign key (idCliente)
references clientes(idcliente),
constraint fk_idEvento_locacao foreign key (idEvento)
references eventos(idEvento),

valorCaucao decimal not null,
formaRetirada varchar(255) not null,
dataInicioPrev date not null,
dataFimPrev date not null,
status varchar(255) not null,
valorPrevisto decimal not null,
valorFinal decimal not null
);


select * from pagamentos;

create table pagamentos
(
idPagamento int auto_increment primary key,
idLocacao int,
constraint fk_idLocacao_pagamento foreign key (idLocacao)
references Locacoes(idlocacao),
referenciaTransacao varchar(255) not null,
valor decimal not null,
data date,
status varchar(255) not null,
forma ENUM('dinheiro', 'cartao_credito', 'cartao_debito', 'pix', 'boleto', 'transferencia') not null
);

create table categorias
(
idCategoria int auto_increment primary key,
nome varchar(255) not null,
descricao varchar(255) not null
); 

create table unidade_estoque
(
idUnidade int auto_increment primary key,
idArtigo int,
constraint fk_idArtigoo_unidade foreign key (idunidade)
references artigos(idartigo),
patrimonioCodigoInterno varchar(255) not null,
estadoConservacao varchar(255) not null,
dataAquisicao date not null,
custoAquisicao decimal,
observacoes varchar(255) not null
);

create table artigos
(
idArtigo int auto_increment primary key,
idCategoria int,
constraint fk_idCategoria_artigo foreign key (idCategoria)
references categorias(idcategoria),
nome varchar(255) not null,
tipoItem varchar(255) not null,
valorDiaria decimal,
caucaoSugerida decimal,
ativo varchar(255) not null
);

select * from ocorrencias; 

create table ocorrencias
(
idOcorrencia int auto_increment primary key,
idUnidade int,
constraint fk_idUnidade_ocorrencia foreign key (idUnidade)
references unidade_estoque(idUnidade),
idLocacao int,
constraint fk_idLocacao_ocorrencia foreign key (idLocacao)
references Locacoes(idlocacao),
tipo varchar(255) not null,
descricao varchar(255) not null,
valorCobrado decimal,
status varchar(255) not null
);

select * from entregas_devolucao;
create table entregas_devolucao
(
idMovimentacao int auto_increment primary key,
idLocacao int,
constraint fk_idLocacao_movimentacao foreign key (idLocacao)
references Locacoes(idlocacao),
observacoes varchar(255) not null,
tipo varchar(255) not null,
dataHoraPrevista datetime,
dataHoraReal datetime,
endereco varchar(255) not null,
taxaEntrega decimal,
conferenteResponsavel varchar(255) not null
);

create table kits
(
idKit int auto_increment primary key,
nomeKit varchar(255) not null,
descricaoKit varchar(255) not null,
precoDiariaKit decimal
);

select * from kit_itens;

create table kit_itens
(
idKit_Item int auto_increment primary key,
idKit int,
idArtigo int,
quantidade decimal,
constraint fk_idArtigo_kitItens foreign key (idArtigo)
references artigos(idArtigo),
constraint fk_idKit_kitItens foreign key (idKit)
references Kits(idKit)
);

create table Alocacao_Unidades
(
idLocacao int auto_increment primary key,
idLocacaoItem int,
constraint fk_idLocacaoItem_locacao foreign key (idLocacaoItem)
references Locacao_Itens(idLocacaoItem),
idUnidade int,
constraint fk_idUnidade_locacao foreign key (idUnidade)
references unidade_estoque(idUnidade),
dtInicio date,
dtFim date,
status varchar(255) not null
);

create table Locacao_Itens
(
idLocacaoItem int auto_increment primary key,
idLocacao int,
constraint fk_idLocacao_idLocacaoItem foreign key (idLocacao)
references Locacoes(idLocacao),
idArtigo int,
constraint fk_idArtigo_idLocacaoItem foreign key (idArtigo)
references artigos(idArtigo),
idKit int,
tipo varchar(255) not null,
quantidade decimal,
precoDiaria decimal,
descontoPrecentual decimal
);

select * from alocacao_unidades;
select * from artigos ;
select * from categorias;
select * from clientes;
select * from entregas_devolucao;
select * from eventos;
select * from kit_itens;
select * from kits;
select * from locacao_itens;
select * from locacoes;
select * from ocorrencias;
select * from pagamentos;
select * from unidade_estoque;


ALTER TABLE clientes
CHANGE logradouro lougradouro VARCHAR(150);


ALTER TABLE clientes
MODIFY telefone VARCHAR(20);

ALTER TABLE eventos
CHANGE nomeEvento nome VARCHAR(150);

ALTER TABLE eventos
CHANGE tipoEvento tipo VARCHAR(150);

ALTER TABLE unidade_estoque
CHANGE patrimonioCodigoInterno codigoInterno VARCHAR(255);

ALTER TABLE Kits
CHANGE nomeKit nome VARCHAR(255);

ALTER TABLE Kits
CHANGE descricaoKit descricao VARCHAR(255);

ALTER TABLE Kit_itens
CHANGE idKit idKit int auto_increment;

insert into clientes (cidade,uf,tipoPessoa,cep,nomeRazao,observacoes,telefone,email,lougradouro,numero,bairro) values
("Sao Paulo","SP","PF","12345678","Carlos Silva","Cliente pontual","11987654321","carlos.silva@gmail.com","Rua das Flores","45","Centro"),
("Campinas","SP","PJ","13045678","Festas Alegria LTDA","Cliente corporativo","1932456789","contato@festasalegria.com.br","Av. Brasil","1000","Jardim America"),
("Rio de Janeiro","RJ","PF","22045678","Maria Oliveira","Cliente nova","21999998888","maria.oliveira@gmail.com","Rua Copacabana","210","Copacabana"),
("Curitiba","PR","PJ","80000000","Eventos Premium Ltda","Cliente frequente","41999887766","vendas@premium.com.br","Av. Sete de Setembro","250","Centro"),
("Belo Horizonte","MG","PF","30100000","João Pereira","Cliente atrasou pagamento","31988887777","joaop@gmail.com","Rua Amazonas","90","Savassi");

insert into eventos (nome,tipo,dataHoraInicio,dataHoraFim,contatoNoLocal,enderecoEvento,observacoes) values
("Aniversário Carlos","Aniversario","2025-11-10 18:00","2025-11-11 02:00", "Carlos Silva","Rua das Flores 45 - São Paulo","Festa com 50 convidados"),
("Confraternização Alegria LTDA","Corporativo","2025-12-15 19:00", "2025-12-16 01:00","Joana Costa","Av. Brasil, 1000 - Campinas","Festa de fim de ano"),
("Casamento Maria e João","Casamento","2026-01-20 17:00","2026-01-21 02:00","Maria Oliveira","Rua Copacabana, 210 - Rio de Janeiro","Buffet completo"),
("Feira Premium","Feira","2025-09-01 09:00","2025-09-05 18:00","Pedro Lima","Expo Curitiba","Evento de 5 dias"),
("Aniversário João","Aniversário","2025-07-10 19:00","2025-07-11 01:00","João Pereira","Rua Amazonas, 90 - BH","Festa simples");

insert into categorias (nome,descricao) values
("Mesas e Cadeiras","Itens para acomodação dos convidados"),
("Decoração","Itens decorativos para festas"),
("Iluminação","Equipamentos de luz e efeitos"),
("Som","Equipamentos de áudio");

insert into Artigos (nome,idCategoria,tipoItem,valorDiaria,caucaoSugerida,ativo) values
("Mesa Redonda 8 lugares","1","Movel","80.00","150.00","true"),
("Cadeira Branca","1","Movel","10.00","20.00","true"),
("Painel de LED","3","Equipamento","250.00","500.00","true"),
("Caixa de Som JBL 1000W","4","Equipamento","180.00","300.00","true"),
("Arranjo Floral","2","Decorativo","60.00","100.00","true"),
("Mesa Bistrô",	"1","Movel","50.00","80.00","true");


INSERT INTO Unidade_Estoque (idArtigo, codigoInterno, estadoConservacao, dataAquisicao, custoAquisicao, observacoes) VALUES
(1, 1001, "Ótimo", "2024-01-15", 500.00, "Sem avarias"),
(2, 2001, "Bom", "2024-03-10", 80.00, "Pintura nova"),
(3, 3001, "Excelente", "2024-05-05", 2500.00, "LED novo"),
(4, 4001, "Ótimo", "2024-02-20", 1000.00, "Bateria substituída"),
(5, 5001, "Bom", "2024-04-25", 150.00, "Flores trocadas"),
(6, 6001, "Regular", "2023-12-01", 90.00, "Pequenos riscos");


INSERT INTO Kits (nome, descricao, precoDiariaKit) VALUES
("Kit Básico Festa Infantil", "Mesas, cadeiras e decoração básica", 250.00),
("Kit Som e Luz", "Caixa de som e painel de LED", 380.00),
("Kit Premium", "Itens de alta qualidade", 600.00);


INSERT INTO Kit_Itens (idKit, idArtigo, quantidade) VALUES
(1, 1, 2),
(1, 2, 16),
(1, 5, 4),
(2, 3, 1),
(2, 4, 2),
(3, 6, 4),
(3, 3, 1),
(3, 4, 2);



ALTER TABLE locacoes
ADD COLUMN observacoes VARCHAR (255) ;


ALTER TABLE locacoes
MODIFY valorFinal DECIMAL ;

# ID LOCACAO COMEÇA APARTIR DO ID 11 (id11, id12, id13, id14, id15)
INSERT INTO Locacoes (valorCaucao, formaRetirada, idCliente, observacoes, idEvento, dataInicioPrev, dataFimPrev, status, valorPrevisto, valorFinal) VALUES
(500.00, "Entrega", 1, "Evento residencial", 1, "2025-11-10", "2025-11-11", "Concluído", 900.00, 920.00),
(800.00, "Retirada", 2, "Evento empresarial", 2, "2025-12-15", "2025-12-16", "Pago", 1200.00, 1200.00),
(600.00, "Entrega", 3, "Casamento completo", 3, "2026-01-20", "2026-01-21", "Pendente", 1800.00,NULL ),
(300.00, "Entrega", 4, "Feira de equipamentos", 4, "2025-09-01", "2025-09-05", "Concluído", 1500.00, 1500.00),
(400.00, "Retirada", 5, "Aniversário pequeno", 5, "2025-07-10", "2025-07-11", "Cancelado", 500.00, 0.00);



# ID PAGAMENTOS COMEÇA APARTIR DO ID 13 (id13, id14, id15, id16)
INSERT INTO Pagamentos (idLocacao, data, valor, forma, status, referenciaTransacao) VALUES
(11, "2025-11-05", 920.00, "pix", "Confirmado", "PIX-20251105-001"),
(12, "2025-12-10", 1200.00, "cartao_credito", "Confirmado", "CCRED-20251210-002"),
(11, "2026-01-15", 900.00, "cartao_debito", "Parcial", "DEB-20260115-003"),
(14, "2025-09-03", 1500.00, "pix", "Confirmado", "PIX-20250903-004");


select * from clientes;
select * from eventos;
select * from categorias;
select * from artigos;
select * from unidade_estoque;
select * from kits;
select * from kit_itens;
select * from locacoes;
select * from pagamentos;


















