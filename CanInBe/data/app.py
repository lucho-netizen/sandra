from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import joblib
from fastapi.middleware.cors import CORSMiddleware


# Define la estructura de los datos de entrada
class CancerPredictionRequest(BaseModel):
    edad: str
    menopausia: str
    tumor_tamaño: str
    nodo_capa: str
    grado_maligno: int
    seno: str
    lado: str
    irradiar: str

# Carga el modelo y los codificadores
try:
    model = joblib.load('modelo_cancer.pkl')
    label_encoders = joblib.load('label_encoders.pkl')
except FileNotFoundError:
    raise RuntimeError("El archivo del modelo o los codificadores no se encuentran.")
except Exception as e:
    raise RuntimeError(f"Error al cargar el modelo: {e}")

# Crea la instancia de FastAPI
app = FastAPI()
# Configura CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:4200"],  # Permite solicitudes desde esta URL
    allow_credentials=True,
    allow_methods=["*"],  # Permite todos los métodos HTTP
    allow_headers=["*"],  # Permite todos los encabezados
)


@app.post("/predict/")
async def predict_cancer(data: CancerPredictionRequest):
    try:
        print("Datos recibidos:", data.dict())

        # Extrae las características del request
        features = [data.edad, data.menopausia, data.tumor_tamaño, data.nodo_capa, data.grado_maligno, data.seno, data.lado, data.irradiar]
        
        # Preprocesa los datos
        preprocessed_features = []
        for i, feature in enumerate(features):
            if label_encoders[i] is not None:
                preprocessed_features.append(label_encoders[i].transform([feature])[0])
            else:
                preprocessed_features.append(feature)

        # Realiza la predicción
        prediction = model.predict([preprocessed_features])[0]

        # Devuelve el resultado
        result = "Cancer detected" if prediction == "recurrence-events" else "No cancer detected"
        return {"prediction": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
