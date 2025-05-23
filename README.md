## Tecnologias Utilizadas

-  Python (ETL e processamento dos dados)
-  Power BI (Dashboard e visualizações)
-  SQL Server (Banco de dados relacional)
-  SQL (Modelagem e criação do banco)
-  Bibliotecas: pandas, sqlalchemy, pyodbc


##  Como Executar o Projeto

### 1️⃣ Banco de Dados
- No SQL Server:
  - Executar o script `criacao_banco_tabela.sql` que se encontra na pasta `Banco de Dados`.
  - Esse script cria todas as tabelas do projeto com chaves primárias e relacionamentos.

### 2️⃣ Pipeline de Dados (ETL)
- Acessar a pasta `projeto_financeiro`.
- Executar o script `etl_carga_dados.py`, que realiza:
  - Leitura dos arquivos `.xlsx` presentes na pasta `dados`.
  - Tratamento, limpeza, formatação de tipos de dados e parse de datas.
  - Inserção dos dados diretamente no SQL Server.
  - Observação: O script utiliza conexão via ODBC (Driver SQL Server).

### 3️⃣ Power BI
- Abrir o arquivo `DashboardFinanceiro.pbix` dentro da pasta `Projeto_Financeiro`.
- O dashboard está conectado ao banco SQL Server.
- Atualize os dados para visualizar os dashboards com as informações inseridas.



## 📊 Dashboards Desenvolvidos

### 🔹 Visão Consolidada
- Receita Total
- Despesa Total
- Lucro Total
- Orçamento Previsto
- Evolução Mensal
- Desempenho por Categoria e Empresa

### 🔹 Desempenho Cliente
- Receita vs Lucro por Cliente (Top 5 ou Top 10)
- Análise percentual de concentração de Receita (Top 5 vs Outros)
- Desempenho financeiro dos maiores clientes ao longo dos meses

### 🔹 Despesas por Cliente
- Top 5 Clientes que mais geram despesas
- Comparativo Receita vs Despesa

### 🔹 Transferências entre Empresas
- Top 5 Empresas que mais enviam transferências
- Top 5 Empresas que mais recebem transferências
- Evolução mensal dos saldos de transferência
- Saldo de transferências por empresa


## Desenvolvedor

- **Vinicius da Silva**

## Observações
- Todos os scripts SQL, ETL e dashboards estão devidamente organizados por pasta.
- O projeto é funcional, basta rodar o ETL e abrir o Power BI para análise.
