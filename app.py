from flask import Flask, jsonify
import psycopg2
import psycopg2.extras
import os

app = Flask(__name__)

def get_db_connection():
    return psycopg2.connect(
        host=os.environ.get('DB_HOST', 'db'),
        user=os.environ.get('DB_USER', 'postgres'),
        password=os.environ.get('DB_PASSWORD', 'senha123'),
        dbname=os.environ.get('DB_NAME', 'feiras_db'),
        cursor_factory=psycopg2.extras.RealDictCursor
    )

@app.route('/')
def index():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Consulta usando JOIN e convertendo o tipo POINT para texto (::text)
        query = """
            SELECT 
                f.nome AS nome_da_feira, 
                f.localizacao, 
                f.coordenadas::text AS coordenadas,
                f.data_hora_inicio, 
                f.descricao,
                o.nome_org AS organizador, 
                o.nome_instituicao AS instituicao
            FROM feira f
            JOIN organizador o ON f.id_organizador = o.id_organizador;
        """
        
        cursor.execute(query)
        feiras_completas = cursor.fetchall()
        
        cursor.close()
        conn.close()
        
        return jsonify(feiras_completas)
    
    except Exception as e:
        return jsonify({
            "erro": "Falha ao conectar no banco de dados",
            "detalhes": str(e)
        }), 500

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=5000)
