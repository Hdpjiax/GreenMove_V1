package mx.edu.greenmove;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/*
 * ARCHIVO COMPARTIDO
 * Punto de entrada del backend.
 *
 * No colocar aquí lógica de usuarios, publicaciones o SQL.
 */
@SpringBootApplication
public class GreenmoveApplication {
    public static void main(String[] args) {
        SpringApplication.run(GreenmoveApplication.class, args);
    }
}
