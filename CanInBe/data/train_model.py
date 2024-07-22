import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsClassifier
from sklearn.preprocessing import LabelEncoder
import joblib

# Leer los datos desde el archivo CSV
df = pd.read_csv('synthetic_cancer_data.csv')

# Imprime las primeras filas para referencia
print("Datos originales:")
print(df.head())

# Suponiendo que la última columna es la etiqueta
X = df.iloc[:, 1:].values  # Características
y = df.iloc[:, 0].values   # Etiquetas

# Preprocesar datos categóricos
label_encoders = []
for i in range(X.shape[1]):  # Para cada característica
    if isinstance(X[0, i], str):  # Si la característica es categórica
        le = LabelEncoder()
        X[:, i] = le.fit_transform(X[:, i])
        print(f"Etiquetas para la columna {i}: {le.classes_}")  # Imprime las etiquetas para depuración
        label_encoders.append(le)
    else:
        label_encoders.append(None)

# Dividir los datos en conjuntos de entrenamiento y prueba
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Entrenar el modelo
model = KNeighborsClassifier(n_neighbors=3)
model.fit(X_train, y_train)

# Guardar el modelo y los codificadores
joblib.dump(model, 'modelo_cancer.pkl')
joblib.dump(label_encoders, 'label_encoders.pkl')

print("Modelo y codificadores guardados")

print("Datos preprocesados:")
print(pd.DataFrame(X, columns=df.columns[1:]).head())
