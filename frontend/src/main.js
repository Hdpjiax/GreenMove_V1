/*
 * ARCHIVO COMPARTIDO
 *
 * Inicia Vue y carga estilos globales.
 * Más adelante registrará Ionic y el router.
 *
 * No colocar lógica de pantallas aquí.
 */
import { createApp } from 'vue'
import App from './App.vue'
import './styles/main.css'

createApp(App).mount('#app')
