import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ChatService } from '../../../services/chat/chat.service';


@Component({
  selector: 'app-chatbot',
  templateUrl: './chatbot.component.html',
  styleUrl: '../../../../assets/css/chat.css'
})
export class ChatbotComponent {

  chatForm: FormGroup = this.fb.group({});
  prediction: string | undefined;

  constructor(
    private fb: FormBuilder,
    private chatService: ChatService,

  ) {
    this.chatForm = this.fb.group({
      edad: [''],
      menopausia: [''],
      tumor_tamaño: [''],
      nodo_capa: [''],
      grado_maligno: [0],
      seno: [''],
      lado: [''],
      irradiar: ['']
    });
  }

  // Método que se ejecuta al enviar el formulario
  submitForm() {
    if (this.chatForm.valid) {
      const formData = this.chatForm.value as ChatService;
      this.chatService.checkCancer(formData).subscribe({
        next: response => {
          console.log('Respuesta del backend:', response);
          this.prediction = response.prediction;
        },
        error: error => {
          console.error('Error al enviar la solicitud:', error);
          this.prediction = 'Error al obtener la predicción';  // Muestra un mensaje de error en la interfaz

        }
      });
    }
  }
}
