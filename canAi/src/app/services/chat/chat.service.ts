import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Injectable } from '@angular/core';
import { Observable, tap } from 'rxjs';


interface chatService {
  edad: string;
  menopausia: string;
  tumor_tamaño: string;
  nodo_capa: string;
  grado_maligno: number;
  seno: string;
  lado: string;
  irradiar: string;
}

@Injectable({
  providedIn: 'root'
})


export class ChatService {

  private apiUrl = 'http://localhost:8000/predict/';  // URL del backend

  constructor(private http: HttpClient) { }

  // Método para enviar datos al backend
  checkCancer(data: ChatService): Observable<any> {
    // Define las cabeceras necesarias para la solicitud
    const headers = new HttpHeaders({
      'Content-Type': 'application/json'
    });

    // Envía los datos al backend y maneja la respuesta
    return this.http.post<any>(this.apiUrl, data, { headers }).pipe(
      tap(response => {
        // Aquí puedes manejar la respuesta como desees
        console.log('Predicción recibida:', response);
      })
    );
  }
}