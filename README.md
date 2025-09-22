# 📱 Práctica 1 - Crea tu Pizza (Flutter)

Este proyecto es la **versión Flutter** de la práctica 1, donde se desarrolla una aplicación móvil para configurar pizzas de manera interactiva.  
Se implementa con **Kotlin (nativo)** y **Flutter (multiplataforma)**, mostrando navegación, estado compartido y tema oscuro.


## 🚀 Funcionalidades

La app incluye 5 pantallas principales, accesibles mediante un **NavigationBar**:

1. **Entrega (TextFields)**  
   - Formulario con `TextField` para nombre, dirección y notas para el repartidor.

2. **Ingredientes (Selección)**  
   - `RadioButton` para tamaño de pizza.  
   - `CheckBox` para toppings (Queso, Pepperoni, Piña).  
   - `Switch` para elegir masa delgada.  
   - Resumen en tiempo real.

3. **Confirmar (Botones)**  
   - Botón para **añadir al carrito**.  
   - `IconButton` para marcar como favorita.

4. **Carrito (ListView)**  
   - Muestra todas las pizzas confirmadas con un listado dinámico.

5. **Resumen (Información)**  
   - `Icon` de pizza.  
   - Resumen textual.  
   - `LinearProgressIndicator` que simula el tiempo de preparación.


## 🛠️ Tecnologías

- [Flutter](https://flutter.dev/) 3.x  
- [Dart](https://dart.dev/)  
- [Provider](https://pub.dev/packages/provider) para el manejo de estado  
- Material 3 + **tema oscuro** habilitado

## 📂 Estructura del proyecto

```
lib/
 ├─ main.dart        # Punto de entrada, NavigationBar
 ├─ models.dart      # Modelo Pizza, enums (tamaño, toppings)
 ├─ state.dart       # OrderModel con Provider
 ├─ pages.dart       # Pantallas principales (Entrega, Ingredientes, Confirmar, Carrito, Resumen)
pubspec.yaml
```

## ▶️ Ejecución

1. Clona el repositorio:
   ```bash
   git clone https://github.com/elsrdelanoche/practica1_flutter.git
   cd practica1_flutter
   ```

2. Instala dependencias:
   ```bash
   flutter pub get
   ```

3. Conecta un dispositivo Android con **depuración USB**.

4. Ejecuta la app:
   ```bash
   flutter run
   ```


## 📸 Capturas

### Entrega
<img width="404" height="897" alt="image" src="https://github.com/user-attachments/assets/df422e50-d31f-4a7a-8bc4-1c115e601a1b" />


### Ingredientes
<img width="404" height="897" alt="image" src="https://github.com/user-attachments/assets/e5d28132-bfd8-41d1-b830-5edb1e88495f" />


### Confirmar
<img width="404" height="897" alt="image" src="https://github.com/user-attachments/assets/4f47b994-8eff-4dd9-b988-943986318541" />


### Carrito
<img width="404" height="897" alt="image" src="https://github.com/user-attachments/assets/5835174e-4a07-4181-bc6e-2e239963f2e7" />


### Resumen
<img width="404" height="897" alt="image" src="https://github.com/user-attachments/assets/1b3298b7-3dfb-43fc-ac60-d98a9211da2e" />

