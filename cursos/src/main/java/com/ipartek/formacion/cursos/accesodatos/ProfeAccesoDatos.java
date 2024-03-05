package com.ipartek.formacion.cursos.accesodatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ipartek.formacion.cursos.dtos.CursoDTO;
import com.ipartek.formacion.cursos.dtos.ProfeDTO;
import com.ipartek.formacion.cursos.dtos.ProfeDTO3;

public class ProfeAccesoDatos {
	private static final String SQL_SELECT = "SELECT p.codigo, p.nombre, p.apellidos FROM profesor p";
	private static final String SQL_SELECT_ID = SQL_SELECT + " WHERE p.codigo = ?";
	private static final String SQL_SELECT_ID_P = "SELECT p.codigo, p.nombre, p.apellidos, c.codigo, c.nombre, c.identificador, c.nHoras FROM profesor p join curso c ON c.profesor_codigo=p.codigo WHERE p.codigo = ?";

	public static ArrayList<ProfeDTO> obtenerTodos() {
		var profesores = new ArrayList<ProfeDTO>();

		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT);
				ResultSet rs = pst.executeQuery()) {
			ProfeDTO profe;

			while (rs.next()) {
				profe = new ProfeDTO(rs.getLong("p.codigo"), rs.getString("p.nombre"), rs.getString("p.apellidos")
						);

				profesores.add(profe);
			}

			return profesores;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

	public static ProfeDTO obtenerPorId(Long codigo) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_ID);) {
			pst.setLong(1, codigo);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				return new ProfeDTO(rs.getLong("p.codigo"), rs.getString("p.nombre"), rs.getString("p.apellidos"));
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

	public static ProfeDTO3 obtenerPorIdProfe(Long codigo) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_ID_P);) {
			pst.setLong(1, codigo);
			
			ProfeDTO3 profe = null;
	        List<CursoDTO> cursosProfe = new ArrayList<>();
	        
			ResultSet rs = pst.executeQuery();
	        while (rs.next()) {
	            if (profe == null) {
	                // Crea el curso solo una vez
				var nombreCompleto = rs.getString("p.nombre") + " " + rs.getString("p.apellidos");
				profe = new ProfeDTO3(rs.getLong("p.codigo"), nombreCompleto, null);
	            }
	            
	            CursoDTO curso = new CursoDTO(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), null);
	        
	            cursosProfe.add(curso);
	        }
	        
	        profe = new ProfeDTO3(profe.codigo(), profe.nombreCompleto(), cursosProfe);
	        return profe;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}
	
}
