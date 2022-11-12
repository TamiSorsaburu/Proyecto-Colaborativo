import mysql.connector


class conexion():

    def __init__(self) -> None:
        try:
            self.conexion=mysql.connector.connect(
                host="localhost", 
                port=3306, 
                user="root", 
                passwd="facu210", 
                database="betterled")

        except mysql.connector.error as descripcionError:
            print("¡No se conecto!", descripcionError)

# Función Inserción Multiple

    def InsertarMultiplesRegistros(self,data):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL="INSERT INTO Usuarios (usuarioID,detalle_ventaID,nombres,apellidos,num_documento,dir_u,tel_u,email,password_u) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                cursor.executemany(sentenciaSQL,data)
                self.conexion.commit()
                self.conexion.close()

            except Exception as descripcionError:
                print("Error en la inserción múltiple de datos:", descripcionError)


# Función Select
    def BuscarRegistros(self, nombre):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = f"select * from Servicios where nombre = '{nombre}'"
                cursor.execute(sentenciaSQL)
                resultadoSelect = cursor.fetchall()
                self.conexion.close()
                return resultadoSelect

            except Exception as descripcionError:
                print("Error en la lectura de datos: ", descripcionError)


# Consulta Update

    def ActualizarDatos(self,nombreNuevo,nombreActual):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = f"update Usuarios set nombres = '{nombreNuevo}' where nombres = '{nombreActual}'"
                cursor.execute(sentenciaSQL)
                self.conexion.commit()
                self.conexion.close()

            except Exception as descripcionError:
                print("Error en la actualización de datos: ", descripcionError)


# Función Delete

    def EliminarRegistros(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = f"DELETE from Usuarios WHERE usuarioID = '1';"
                cursor.execute(sentenciaSQL)
                self.conexion.commit()                
                self.conexion.close()

            except Exception as descripcionError:
                print("Error en la eliminación de datos:",descripcionError)

# Inner Join

    def MostrarRegistros(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sentenciaSQL = f"select usuarioID,nombres,apellidos, from Usuarios inner join Detalles_ventas on Usuarios.ID=Detalles_ventas.fecha_hora;"
                cursor.execute(sentenciaSQL)
                self.conexion.commit()               
                self.conexion.close()

            except Exception as descripcionError:
                print("Error en mostrar de datos:",descripcionError)



conexion1 = conexion()


# Servicios
# data = [
#         ('01','Istalación','7500'),
#         ('02','Softward','8000'),
#         ('03','Diseño','3000')
#         ]


# Ventas
# data = [
#         ('001','03','3000','001')
#         ('002','02','8000','002')
# ]

# Detalle_Venta
# data = [
#         ('001','001','3000','2022-03-05 11:34:00.000','03')
#         ('002','002','8000','2022-05-06 16:10:00.000','03')
# ]

# Usuarios
# data = [
#         ('01','001','Ludmila', 'Quinteros', '39649013', 'valles 219', '7392831491', 'quinterosludmi13@gmail.com','Ludmi378')
#         ('02','002','Marcelo', 'Gerez', '39272984', 'san justo 20', '37539524901', 'gerez53@gmail.com','Gerez546')
# ]


# Insert
# conexion1.InsertarMultiplesRegistros(data)


# Select
# print(conexion1.BuscarRegistros("Diseño"))


# Update
# conexion1.ActualizarDatos("Luciana","Ludmila")


# Delete
# conexion1.EliminarRegistros()


# Inner Join
# conexion1.MostrarRegistros()


