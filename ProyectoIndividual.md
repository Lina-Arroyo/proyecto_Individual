                                PROCESO ETL PI (PHYTON- PANDAS- MYSQL)

DIAGRAMA DE FLUJO <br>
<img src = 'Diagrama.png'>

TECNOLOGIAS USADAS
* Python - Visual Studio Code
* SQL - MySql Workbench

DESCRIPCION DEL TRABAJO A REALIZAR

PASO 1 </br>
En este paso vamos a cargar todos los datasets en crudo para en los siguientes paso empezar a transformalos y hacer su extraccion

PASO 2 </br>
En este paso vamos a visualizar la informacion general de los datasets, sus valores nulos, tipo de datos, etc. Para saber por donde iniciar con la limpieza y transformacion de estos datasets

PASO 3 </br>
En este paso vamos a transformar los datos, imputaremos los datos faltantes, cambiaremos el tipo de dato de las columnas, y normalizaremos algunos de los datos para hacer una mejor lectura y analisis de los datos

PASO 4 </br>
En este paso vamos a exportar los dataframes a un tipo de archivo .csv para cargarlo en nuestro gestor de bases de datos MySql 

PASO 5 </br>
En este paso crearemos nuestra base de datos, tablas, insertaremos valores a cada tabla, realizaremos las relaciones en MySQL para comenzar nuestra carga incremental

PASO 6 </br>
En este paso vamos a crear una nueva tabla con SQLALCHEMY con el dataframe precios_20200419_20200426, esta seria nuestra carga incremental

PASO 7 </br>
Realizamos la consulta requerida en este modelo de negocios = ¿Cuál es el precio promedio de la sucursal 9-1-688

PLUS</br>
Tanto en python como en MySql hay unos plus que permitiran automatizar un poco el proceso de carga de datos.

    RESULTADO
Como resultado de este proceso de ETL tendremos en una sola base de datos las tablas con las cargas iniciales de cada dataset y una tabla de ventas con la carga incial y adicional una carga incremental con datos limpios, transformados y normalizados que estan listos para ser analizados.