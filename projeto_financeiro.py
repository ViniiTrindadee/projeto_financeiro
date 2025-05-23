import pandas as pd
from sqlalchemy import create_engine
import urllib


params = urllib.parse.quote_plus(
    "DRIVER={ODBC Driver 17 for SQL Server};"
    "SERVER=VINICIUS;"  
    "DATABASE=bd_financeiro;"  
    "Trusted_Connection=yes;"
)

# Cria o engine de conexão
engine = create_engine(f"mssql+pyodbc:///?odbc_connect={params}", fast_executemany=True)

path = r"D:\projeto_financeiro\dados"  


clientes = pd.read_excel(f"{path}\\clientes.xlsx")
empresas = pd.read_excel(f"{path}\\empresas.xlsx")
despesas = pd.read_excel(f"{path}\\despesas.xlsx")
orcamentos = pd.read_excel(f"{path}\\orcamentos.xlsx")
receitas = pd.read_excel(f"{path}\\receitas.xlsx")
transferencias = pd.read_excel(f"{path}\\transferencias.xlsx")


for df in [empresas, despesas, receitas, transferencias]:
    if 'data' in df.columns:
        df['data'] = pd.to_datetime(df['data'], errors='coerce')
    if 'data_fundacao' in df.columns:
        df['data_fundacao'] = pd.to_datetime(df['data_fundacao'], errors='coerce')


try:
    clientes.to_sql('clientes', con=engine, if_exists='append', index=False)
    empresas.to_sql('empresas', con=engine, if_exists='append', index=False)
    despesas.to_sql('despesas', con=engine, if_exists='append', index=False)
    orcamentos.to_sql('orcamentos', con=engine, if_exists='append', index=False)
    receitas.to_sql('receitas', con=engine, if_exists='append', index=False)
    transferencias.to_sql('transferencias', con=engine, if_exists='append', index=False)

    print("✅ Dados carregados com sucesso no banco bd_financeiro!")

except Exception as e:
    print(f"❌ Erro ao carregar dados no SQL Server: {e}")
