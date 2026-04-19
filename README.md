# Distro Downloader

Script bash para descargar ISOs de distribuciones Linux, categorizadas por gama (alta, media y baja).

## Uso

```bash
bash downloader.sh
```

El script te pedirá interactivamente:

1. **Modo de verificación**: Verifica que las URLs sean accesibles, sin descargar
2. **Categorías**: Elige cuáles ISOs descargar (High-End, Medium-End, Low-End)

## Comportamiento

- **Ubicación de descargas**: Se crea automáticamente una carpeta `distros/` en la **misma ubicación donde está el script**
- **Estructura**: Las ISO se organizan en subcarpetas por categoría:
  ```
  distro-downloader/
  ├── downloader.sh
  └── distros/
      ├── HighEnd/
      ├── MediumEnd/
      └── LowEnd/
  ```

## Características

- **Evita descargas duplicadas**: Si un archivo ya existe, lo salta
- **Manejo de errores**: Limpia automáticamente archivos incompletos en caso de interrupción
- **Soporte de redirecciones**: Maneja URLs con redirecciones HTTP
