from flask import Flask, jsonify, request #panggil flask dan jsonify
from flask_mysqldb import MySQL

app = Flask(__name__) #bikin objek

#config mysql
app.config ['MYSQL_HOST'] = 'localhost'
app.config ['MYSQL_USER'] = 'root'
app.config ['MYSQL_PASSWORD'] = ''
app.config ['MYSQL_DB'] = 'laporan_rest'
mysql = MySQL(app)



@app.route('/') #halaman utama
def coba(): #bebas menulis nama fungsinyaa /// bisa main, root, dll
    return 'Selamat datang di tutorial RESTful API'

@app.route('/laporan', methods = ['GET','POST'])
def laporan():
    if request.method == 'GET':
        cursor = mysql.connection.cursor()
        cursor.execute("SELECT * FROM laporan_keuangan")
        #dosen = cursor.fetchall() #menyimpan ke dalam var dosen
        #return jsonify(dosen)

        #ambil columns name from cursor.decription
        column_names = [i[0] for i in cursor.description] 
        #fetch data and format inti list of dictionaries
        data = []
        for row in cursor.fetchall():
            data.append(dict(zip(column_names, row)))
        return jsonify(data)

        cursor.close()

    elif request.method == 'POST' :
        # akan GET data dari request (postman)
        #akan menambah nama/jurusan/univ
        tipe= request.json ['tipe']
        jenis = request.json ['jenis']
        nama_kendaraan = request.json ['nama_kendaraan']
        harga_satuan = request.json ['harga_satuan']
        potongan_harga = request.json ['potongan_harga']
        nett = request.json ['nett']
        total_pemasukan = request.json ['total_pemasukan']
        tanggal = request.json ['tanggal']
        bulan = request.json ['bulan']
        tahun = request.json ['tahun']

        #open connection to db
        cursor = mysql.connection.cursor()
        #sql = "INSERT INTO DOSEN (nama, univ, jurusan) VALUES = (%s, %s, %s)"
        sql = "INSERT INTO laporan_keuangan (tipe, jenis, nama_kendaraan, harga_satuan, potongan_harga, nett, total_pemasukan, tanggal, bulan, tahun) VALUES (%s, %s, %s, %s, %s, %s, %s,%s, %s, %s)"
        val = (tipe, jenis, nama_kendaraan, harga_satuan, potongan_harga, nett, total_pemasukan, tanggal, bulan, tahun)
        cursor.execute(sql, val)

        #ketika POST DELETE, UPDATE harus commit ke db, klo ga ga bakal masuq
        mysql.connection.commit()

        return jsonify ({'message': 'data added succesfully!'}) #menambahkan pesan jika berhasil
        cursor.close() #setiap buka koneksi harus ditutup

#membuat endpoint GET /laporan/id untuk mengambil berdasarkan id dan tanggal/bulan/tahun
@app.route('/laporancz', methods=['GET'])
def laporanid():
    if 'id' in request.args:
        cursor = mysql.connection.cursor()
        sql = "SELECT * FROM laporan_keuangan WHERE id_laporan = %s"
        val = (request.args['id'],)
        cursor.execute(sql, val)
        #ambil columns name from cursor.decription
        column_names = [i[0] for i in cursor.description]
        #fetch data and format inti list of dictionaries
        data = []
        for row in cursor.fetchall():
            data.append(dict(zip(column_names, row)))

        cursor.close()
        return jsonify(data)
    
    elif 'tgl' in request.args:
        cursor = mysql.connection.cursor()
        sql = "SELECT * FROM laporan_keuangan WHERE tanggal = %s"
        val = (request.args['tgl'],)
        cursor.execute(sql, val)
        #ambil columns name from cursor.decription
        column_names = [i[0] for i in cursor.description]
        #fetch data and format inti list of dictionaries
        data = []
        for row in cursor.fetchall():
            data.append(dict(zip(column_names, row)))

        cursor.close()
        return jsonify(data)

    elif 'bln' in request.args:
        cursor = mysql.connection.cursor()
        sql = "SELECT * FROM laporan_keuangan WHERE bulan = %s"
        val = (request.args['bln'],)
        cursor.execute(sql, val)
        #ambil columns name from cursor.decription
        column_names = [i[0] for i in cursor.description]
        #fetch data and format inti list of dictionaries
        data = []
        for row in cursor.fetchall():
            data.append(dict(zip(column_names, row)))

        cursor.close()
        return jsonify(data)
    
    elif 'thn' in request.args:
        cursor = mysql.connection.cursor()
        sql = "SELECT * FROM laporan_keuangan WHERE tahun = %s"
        val = (request.args['thn'],)
        cursor.execute(sql, val)
        #ambil columns name from cursor.decription
        column_names = [i[0] for i in cursor.description]
        #fetch data and format inti list of dictionaries
        data = []
        for row in cursor.fetchall():
            data.append(dict(zip(column_names, row)))

        cursor.close()
        return jsonify(data)

    else:
        return 'Parameter tidak ditemukan'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8000, debug=True)

