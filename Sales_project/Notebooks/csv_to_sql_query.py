import pandas as pd

df = pd.read_csv(r'F:\Sales_project\data\suppliers.csv')

sql_types = {}
for col in df.columns:
    if pd.api.types.is_integer_dtype(df[col]):
        sql_types[col] = "INT"
    elif pd.api.types.is_float_dtype(df[col]):
        sql_types[col] = "FLOAT"
    elif pd.api.types.is_bool_dtype(df[col]):
        sql_types[col] = "BOOLEAN"
    elif pd.api.types.is_datetime64_any_dtype(df[col]) or pd.to_datetime(df[col], errors='coerce').notna().all():
        sql_types[col] = "DATE"
    else:
        sql_types[col] = "TEXT"

query = "CREATE TABLE Sales (\n" + \
        ",\n".join([f"{col} {typ}" for col, typ in sql_types.items()]) + \
        "\n);"

print(query)
