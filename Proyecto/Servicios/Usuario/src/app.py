from flask import Flask, jsonify, request
from flask_mysqldb import MySQL

app = Flask(__name__)


app.config['MYSQL_DATABASE_HOST'] = 'localhost'
app.config['MYSQL_DATABASE_PORT'] = 3306
app.config['MYSQL_DATABASE_USER'] = 'root' #depende del usuario que asignaron en heidiSQL
app.config['MYSQL_DATABASE_PASSWORD'] = '1234' #depende de la contraseña que asignaron en heidiSQL
app.config['MYSQL_DATABASE_DB'] = 'U_CommerceBD'

mysql = MySQL(app)

@app.route('/usuarios', methods=['GET'])
def listar_usuarios():
    try:
        cursor = mysql.connection.cursor()
        sql = "SELECT nombre, apellido, codigo, email, celular FROM Usuario"
        cursor.execute(sql)
        datos = cursor.fetchall()
        usuarios = []
        for fila in datos:
            usuario={'nombre':fila[0], 'apellido':fila[1], 'codigo':fila[2], 'email':fila[3]}
            usuarios.append(usuario)
        return jsonify({'usuarios':usuarios})
    except Exception as ex:
        return jsonify({'Mensaje':'Error'})

@app.route('/usuarios1', methods=['GET'])
def listar_usuarios1():
    cursor = mysql.connection.cursor()
    sql = "SELECT nombre, apellido, codigo, email, celular FROM Usuario"
    cursor.execute(sql)
    datos = cursor.fetchall()
    usuarios = []
    print(cursor)
    for fila in datos:
        usuario={'nombre':fila[0], 'apellido':fila[1], 'codigo':fila[2], 'email':fila[3]}
        usuarios.append(usuario)
    return jsonify({'usuarios':usuarios})

@app.route('/usuarios/<codigo>', methods=['GET'])
def leer_usuario(codigo):
    try:
        cursor = mysql.connection.cursor()
        sql = "SELECT nombre, apellido, codigo, email, celular FROM Usuario WHERE codigo = '{0}'".format(codigo)
        cursor.execute(sql)
        datos = cursor.fetchone()
        if datos != None:
            usuario={'nombre':datos[0], 'appellido':datos[1], 'codigo':datos[2], 'email':datos[3]}
            return jsonify({'usuario':usuario})
    except Exception as ex:
        return jsonify({'Mensaje':'Error'})


@app.route('/usuarios', methods=['POST'])
def registrar_usuario():
    try:
        print(request.json)
        return jsonify({'usuario':'usuario registrado'})
    except Exception as ex:
        return jsonify({'Mensaje':'Error'})

if __name__ == '__main__':
    app.run(debug=True)
