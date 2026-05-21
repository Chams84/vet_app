from flask import Flask, render_template, request, redirect, url_for
from database import con
from werkzeug.security import generate_password_hash
from werkzeug.security import check_password_hash

app = Flask(__name__)
connect = con()
cursor = connect.cursor()

@app.route('/')
def index():
	return render_template('index.html')

#Login-------------------------------------------------------------------------------------------------

@app.route('/login', methods=['GET','POST'])
def login_admin():
	if request.method == 'POST':
		eml = request.form['email']
		password = request.form['password']
		cursor.execute('select password from admin where email=%s',(eml,))
		log = cursor.fetchone()
		if log and check_password_hash(log[0],password):
			return redirect('/dashboard')
		else:
			return render_template('login.html', msg="Usuario o Contraseña incorrectos")
	return render_template('login.html')

#Dashboard-------------------------------------------------------------------------------------------------

@app.route('/dashboard')
def dash():
	return render_template('dashboard.html')

#Mascotas-------------------------------------------------------------------------------------------------

@app.route('/mascotas')
def pet_con():
	cursor.execute('select * from mascotas order by id asc')
	reg = cursor.fetchall()
	for i in reg:
       	        print("/".join(map(str,i)))
	return render_template('mascotas.html',data=reg)

@app.route('/reg_pet', methods=['POST'])
def pet_reg():
	nom = request.form['nombre']
	edad = request.form['edad']
	raza = request.form['raza']
	peso = request.form['peso']
	sexo = request.form['sexo']
	hmed = request.form['historial']

	cursor.execute('insert into mascotas (nombre,edad,raza,peso,sexo,h_medico) values (%s,%s,%s,%s,%s,%s)',(nom,edad,raza,peso,sexo,hmed,))
	connect.commit()
	return redirect('/mascotas')

@app.route('/up_pet',methods=['POST'])
def pet_up():
	pid = request.form['id']
	edad = request.form['edad']
	peso = request.form['peso']
	hmed = request.form['historial']
	cursor.execute('update mascotas set edad=%s, peso=%s, hmed=%s where id=%s',(edad,peso,hmed,pid,))
	connect.commit()
	return redirect('/mascotas')

@app.route('/del_pet',methods=['POST'])
def pet_del():
	pid = request.form['id']
	cursor.execute('delete from mascotas where id=%s',(pid))
	return redirect('/mascotas')

#Doctores-------------------------------------------------------------------------------------------------

@app.route('/doctores')
def doc_con():
	cursor.execute('select * from doctores order by id asc')
	reg = cursor.fetchall()
	for i in reg:
       	        print("/".join(map(str,i)))
	return render_template('doctores.html',data=reg)

@app.route('/reg_doc', methods=['POST'])
def doc_reg():
	nom = request.form['nombre']
	esp = request.form['especialidad']
	hor = request.form['horario']
	con = request.form['contacto']
	cursor.execute('insert into doctores (nombre,especialidad,horario,contacto) values (%s,%s,%s,%s)',(nom,esp,hor,con,))
	connect.commit()
	return redirect('/doctores')

@app.route('/up_doc',methods=['POST'])
def doc_up():
	pid = request.form['id']
	hor = request.form['horario']
	con = request.form['contacto']
	cursor.execute('update doctores set horario=%s, contacto=%s where id=%s',(hor,con,pid,))
	connect.commit()
	return redirect('/doctores')

@app.route('/del_doc',methods=['POST'])
def doc_del():
	pid = request.form['id']
	cursor.execute('delete from doctores where id=%s',(pid))
	return redirect('/doctores')

#Consultas-------------------------------------------------------------------------------------------------

@app.route('/consultas')
def app_con():
	cursor.execute('select consultas.id, consultas.horario, mascotas.nombre, doctores.nombre from consultas inner join doctores on consultas.id_doctor = doctores.id inner join mascotas on consultas.id_mascota = mascotas.id order by id asc')
	reg = cursor.fetchall()
	for i in reg:
       	        print("/".join(map(str,i)))
	return render_template('consultas.html',data=reg)

@app.route('/reg_app', methods=['POST'])
def app_reg():
	hor = request.form['horario']
	doc = request.form['doc']
	pet = request.form['pet']
	cursor.execute('insert into consultas (horario,id_doctor,id_mascota) values (%s,%s,%s)',(hor,doc,pet,))
	connect.commit()
	return redirect('/consultas')

@app.route('/up_app',methods=['POST'])
def app_up():
	pid = request.form['id']
	hor = request.form['horario']
	doc = request.form['doc']
	cursor.execute('update consultas set horario=%s, id_doctor=%s where id=%s',(hor,doc,pid,))
	connect.commit()
	return redirect('/consultas')

@app.route('/del_app',methods=['POST'])
def app_del():
	pid = request.form['id']
	cursor.execute('delete from consultas where id=%s',(pid))
	return redirect('/consultas')

#Registro(oculto)-----------------------------------------------------------------------------------------

@app.route('/registro', methods=['GET','POST'])
def reg_admin():
	if request.method == "POST":
		nom = request.form['nombre']
		eml = request.form['email']
		pwd = request.form['password']
		password_hash = generate_password_hash(pwd)
		cursor.execute('insert into admin (nombre,email,password) values (%s,%s,%s)',(nom,eml,password_hash))
		connect.commit()
	return render_template('register.html')

#PRUEBAS(borrar al terminar)-----------------------------------------------------------------------------

@app.route('/testing', methods=['GET','POST'])
def pruebas():
	return render_template('test.html')
