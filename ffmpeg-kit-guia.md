# Guía de Compilación Personalizada de ffmpeg-kit para iOS con SPM

Esta guía detalla el proceso para compilar una versión personalizada de `ffmpeg-kit` para iOS, habilitando librerías externas como `libx264`, y distribuirla a través de Swift Package Manager usando un fork personal en GitHub.

## Paso 1: Preparación del Entorno (Prerrequisitos)

Asegúrate de tener Xcode y sus herramientas de línea de comandos instaladas. Luego, instala las siguientes dependencias usando [Homebrew](https://brew.sh/).

```bash
# Instala Homebrew si aún no lo tienes
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instala las herramientas de compilación necesarias
brew install pkg-config
brew install automake
brew install libtool
brew install nasm
```

## Paso 2: Compilación de `ffmpeg-kit`

Una vez que el entorno está listo, puedes compilar la librería desde la raíz del repositorio de `ffmpeg-kit`.

1.  **Ejecuta el script de compilación**: Usa `./ios.sh` y añade las banderas correspondientes a las librerías que necesites.
    *   `--xcframework`: Obligatorio para generar los binarios en el formato correcto para SPM.
    *   `--enable-gpl`: Necesario si vas a incluir librerías con licencia GPL, como `x264`.
    *   `--enable-x264`: Habilita la librería `libx264`, necesaria para usar la opción de compresión `-crf`.

    El comando completo que usamos fue:
    ```bash
    ./ios.sh --xcframework --enable-gpl --enable-x264
    ```

2.  **Verifica la salida**: Si la compilación es exitosa, los binarios (`.xcframework`) se encontrarán en la carpeta `prebuilt/bundle-apple-xcframework-ios/`.

## Paso 3: Preparación para Swift Package Manager (SPM)

Para que SPM pueda consumir estos binarios, deben estar comprimidos y alojados en una URL pública y estable, preferiblemente una "Release" de GitHub.

### 3.1. Comprimir los XCFrameworks

Navega a la carpeta de los binarios y comprime cada uno en un archivo `.zip`.

```bash
# 1. Ve a la carpeta de los binarios
cd prebuilt/bundle-apple-xcframework-ios/

# 2. Comprime cada framework
zip -r ffmpegkit.xcframework.zip ffmpegkit.xcframework
zip -r libavcodec.xcframework.zip libavcodec.xcframework
zip -r libavdevice.xcframework.zip libavdevice.xcframework
# ... y así sucesivamente para los 8 frameworks ...

# 3. Vuelve a la raíz del proyecto
cd ../../..
```

### 3.2. Crear una Release en GitHub

1.  En tu fork del repositorio en GitHub, ve a la sección **"Releases"** y crea una **"new release"**.
2.  Asígnale un tag (ej: `v6.0.0-custom-x264`).
3.  Sube los 8 archivos `.zip` que acabas de crear como artefactos binarios de la release.
4.  Publica la release.

### 3.3. Crear y Configurar `Package.swift`

Crea un archivo llamado `Package.swift` en la raíz de tu repositorio con el siguiente contenido. Este archivo le dice a SPM dónde encontrar cada binario.

```swift
// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "ffmpeg-kit-ios",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ffmpegkit",
            targets: [
                "ffmpegkit", "libavcodec", "libavdevice",
                "libavfilter", "libavformat", "libavutil",
                "libswresample", "libswscale"
            ])
    ],
    targets: [
        .binaryTarget(
            name: "ffmpegkit",
            url: "URL_AQUI", // Reemplazar
            checksum: "CHECKSUM_AQUI" // Reemplazar
        ),
        .binaryTarget(
            name: "libavcodec",
            url: "URL_AQUI", // Reemplazar
            checksum: "CHECKSUM_AQUI" // Reemplazar
        ),
        // ... Repetir para los 8 frameworks ...
    ]
)
```

### 3.4. Calcular Checksums y Actualizar `Package.swift`

1.  **Obtén la URL** de cada `.zip` desde la página de la release de GitHub (clic derecho > "Copiar dirección del enlace").
2.  **Calcula el checksum** SHA256 para cada `.zip` localmente:
    ```bash
    swift package compute-checksum nombre-del-archivo.xcframework.zip
    ```
3.  **Edita `Package.swift`** y reemplaza cada par de `"URL_AQUI"` y `"CHECKSUM_AQUI"` con los valores correctos para cada uno de los 8 `binaryTarget`.

## Paso 4: Integración en Xcode

1.  **Sube `Package.swift` a Git**: Haz commit y push del archivo `Package.swift` actualizado a tu repositorio.
    ```bash
    git add Package.swift
    git commit -m "feat: Add SPM support for custom x264 build"
    git push
    ```
2.  **Añade el Paquete a Xcode**:
    *   En Xcode, ve a `File` > `Add Packages...`.
    *   Pega la URL de tu fork de GitHub.
    *   **Importante**: En la regla de dependencia ("Dependency Rule"), elige **"Branch"** y especifica la rama donde hiciste los cambios (ej: `main`).

## Paso 5: Troubleshooting (Resolución de Problemas)

Si Xcode no carga la nueva versión del paquete y sigues viendo errores antiguos (como `Unrecognized option 'crf'`), es probable que sea un problema de caché.

1.  **Verifica el Commit**: En la pestaña "Package Dependencies" de Xcode, comprueba que el hash del commit que se muestra para tu paquete es el más reciente. Si no lo es, Xcode está usando una versión antigua.
2.  **Fuerza la Actualización**:
    *   **Opción A (Recomendada)**: En el Project Navigator, haz clic derecho sobre el paquete y selecciona **"Update Package"**.
    *   **Opción B (Infalible)**: Elimina el paquete del proyecto (`-`) y vuelve a añadirlo, asegurándote de seleccionar la regla de dependencia por **"Branch"**.
    *   **Opción C (Último recurso)**: Cierra Xcode, ve al menú `File` > `Swift Packages` > `Reset Package Caches` y limpia el proyecto (`Product > Clean Build Folder`).

Siguiendo esta guía, deberías poder replicar el proceso en el futuro sin problemas.
