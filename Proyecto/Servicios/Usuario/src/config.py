class DevelomentConfig():
    DEBUG = True
    MYSQL_HOST = 'localhost'
    MYSQL_PORT = 3306
    MYSQL_USER = 'root' #depende del usuario que asignaron en heidiSQL
    MYSQL_PASSWORD = '1234' #depende de la contraseña que asignaron en heidiSQL
    MYSQL_DB = 'U_CommerceBD'

config = {
    'development': DevelomentConfig    
}