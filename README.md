
# bdFesta — Banco de Dados para Locação de Itens de Eventos

Este projeto foi desenvolvido para **estudo prático de inserção de dados** em um banco relacional usando **MySQL**.  
O objetivo é simular um sistema de locação de itens para festas e eventos, com estrutura completa e dados realistas.

---

## 📌 Objetivo
- Praticar comandos essenciais do SQL:
  - `CREATE TABLE`
  - `INSERT INTO`
  - `ALTER TABLE`
  - `ADD COLUMN`
  - Consultas simples (`SELECT * FROM`)
- Trabalhar com **relacionamentos** usando **FOREIGN KEY**.
- Popular tabelas com dados consistentes para testes.

---

## 🗂️ Estrutura do Banco
- **13 tabelas criadas**, incluindo:
  - `clientes`, `eventos`, `locacoes`, `pagamentos`
  - `categorias`, `artigos`, `unidade_estoque`
  - `kits`, `kit_itens`
  - Tabelas auxiliares: `ocorrencias`, `entregas_devolucao`, `locacao_itens`, `alocacao_unidades`
- Relacionamentos com **chaves estrangeiras** para garantir integridade referencial.

---

## 🔑 Principais comandos utilizados
- Criação do banco e tabelas:
  ```sql
  CREATE DATABASE bdFesta;
  CREATE TABLE clientes (...);
