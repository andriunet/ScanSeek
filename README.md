# QR Scanner App

## Descripción
Esta aplicación permite escanear códigos QR utilizando la cámara del dispositivo y almacenar los datos escaneados de forma segura en una base de datos local. Además, cuenta con autenticación biométrica (Face ID / Huella Digital) y un mecanismo de respaldo con PIN en caso de que la autenticación biométrica no esté disponible.

## Características
- **Escaneo de códigos QR** con AVFoundation.
- **Autenticación biométrica** con Face ID o Touch ID.
- **Respaldo con PIN** en caso de fallo en la autenticación biométrica (PIN por defecto: `1234`).
- **Almacenamiento seguro** de credenciales con Keychain.
- **Base de datos local** para guardar los códigos escaneados.

## Tecnologías Utilizadas
- **Swift 5** y **SwiftUI**
- **AVFoundation** (para escaneo QR)
- **LocalAuthentication** (para Face ID y Touch ID)
- **Keychain** (para almacenamiento seguro)
- **CoreData / SQLite** (para persistencia de datos)

## Instalación
1. Clonar el repositorio:
   ```sh
   git clone https://github.com/andriunet/ScanSeek.git
   cd ScanSeek
   ```
2. Abrir el proyecto en Xcode:
   ```sh
   open ScanSeek.xcodeproj
   ```
3. Compilar y ejecutar en un simulador o dispositivo físico.

## Uso
1. Al abrir la aplicación, se solicitará autenticación biométrica.
2. Si la autenticación biométrica no está disponible o falla, se solicitará el ingreso de un PIN (por defecto `1234`).
3. Una vez autenticado, se activará automáticamente la cámara para escanear códigos QR.
4. Los datos escaneados se mostrarán en pantalla y se almacenarán en la base de datos local.

## Autores
- **Andrés Marín** - Desarrollador iOS

## Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

