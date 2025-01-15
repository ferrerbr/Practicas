import pandas as pd

input_file = "ventas-x-ciudad.xlsx"  
output_file = "archivo.csv"


    
df = pd.read_excel(input_file)

df.to_csv(output_file, index=False)
print(f"El archivo se ha convertido y guardado como {output_file}")
print(df.head())

ventas_por_ciudad = df.groupby('Ciudad')['Ventas'].sum()
print(ventas_por_ciudad)

 
