import pandas as pd
alumnos = {
    "Nombres":["Brenda","Brandon","Circe","Jose","Karen","Hassan","Luis", "Brandon","Brenda"],
    "Materia":["python","python","python","python","python","python","python","AWS","AWS"],
    "Calificaciones":[95,90,98,91,96,94,99,95,100]
}
df = pd.DataFrame(alumnos)

promedios = df.groupby("Nombres")["Calificaciones"].mean()
print(promedios)