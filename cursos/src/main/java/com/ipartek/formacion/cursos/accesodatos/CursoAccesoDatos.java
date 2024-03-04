package com.ipartek.formacion.cursos.accesodatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.ipartek.formacion.cursos.dtos.CursoDTO;
import com.ipartek.formacion.cursos.dtos.CursoDTO2;
import com.ipartek.formacion.cursos.dtos.ProfeDTO;
import com.ipartek.formacion.cursos.dtos.ResenyaDTO;

public class CursoAccesoDatos {
	private static final Logger LOG = Logger.getLogger(CursoAccesoDatos.class.getName());
	
	private static final String SQL_SELECT_CURSOS = "SELECT DISTINCT * FROM curso c";
	private static final String SQL_SELECT = "SELECT * FROM curso c join profesor p ON c.profesor_codigo = p.codigo";
	private static final String SQL_SELECT_R = "SELECT * FROM curso c join profesor p ON c.profesor_codigo = p.codigo join alumno_has_resenyas ahr ON c.codigo = ahr.curso_codigo";
	private static final String SQL_SELECT_RESENYA = "SELECT * FROM curso c join alumno_has_resenyas ahr ON c.codigo = ahr.curso_codigo";
	private static final String SQL_SELECT_ID = SQL_SELECT + " WHERE c.codigo = ?";
	private static final String SQL_SELECT_ID_R = SQL_SELECT_R + " WHERE c.codigo = ?";
	private static final String SQL_SELECT_CODIGO = SQL_SELECT + " WHERE c.codigo=?";

	public static ArrayList<CursoDTO> obtenerTodos() {
		var cursos = new ArrayList<CursoDTO>();

		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT);
				ResultSet rs = pst.executeQuery()) {
			
			CursoDTO curso;
			ProfeDTO profe;

			while (rs.next()) {
				profe = new ProfeDTO(rs.getLong("p.codigo"), rs.getString("p.nombre"), rs.getString("p.apellidos")
						);
				curso = new CursoDTO(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), profe);
				
				LOG.info("SE HA CREADO EL CURSO: " + curso);
				
				cursos.add(curso);
			}

			return cursos;
		} catch (SQLException e) {
			LOG.log(Level.SEVERE, "NO SE HAN PODIDO OBTENER LOS LIBROS CON SUS AUTORES", e);
			throw new RuntimeException("Error en la select", e);
		}
	}
	public static ArrayList<CursoDTO2> obtenerTodosResenyas() {
		var cursos = new ArrayList<CursoDTO2>();
		
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_RESENYA);
				ResultSet rs = pst.executeQuery()) {
			
			CursoDTO2 curso;
			ResenyaDTO resenya;
			
			while (rs.next()) {
				resenya = new ResenyaDTO(null, null, rs.getString("ahr.resenya"), null
						);
				curso = new CursoDTO2(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), resenya);
				
				LOG.info("SE HA CREADO EL CURSO: " + curso);
				
				cursos.add(curso);
			}
			
			return cursos;
		} catch (SQLException e) {
			LOG.log(Level.SEVERE, "NO SE HAN PODIDO OBTENER LOS LIBROS CON SUS AUTORES", e);
			throw new RuntimeException("Error en la select", e);
		}
	}
	public static CursoDTO obtenerPorId(Long id) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_ID);) {
			pst.setLong(1, id);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				return new CursoDTO(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), null);
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}
	public static CursoDTO2 obtenerPorIdResenya(Long id) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_ID_R);) {
			pst.setLong(1, id);
			
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				
				ResenyaDTO resenya = new ResenyaDTO(null, null, rs.getString("ahr.resenya"), null);
				
				return new CursoDTO2(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), resenya);
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}
	
	public static ArrayList<CursoDTO> obtenerTodosCursos() {
	    ArrayList<CursoDTO> cursos = new ArrayList<CursoDTO>();

	    try (Connection con = AccesoDatos.obtenerConexion();
	         PreparedStatement pst = con.prepareStatement(SQL_SELECT_CURSOS);
	         ResultSet rs = pst.executeQuery()) {

	        while (rs.next()) {
	            CursoDTO curso = new CursoDTO(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), null);
	            
	            cursos.add(curso);
	        }
	        return cursos;
	    } catch (SQLException e) {
			LOG.log(Level.SEVERE, "NO SE HAN PODIDO OBTENER LOS LIBROS sin SUS AUTORES", e);
			throw new RuntimeException("Error en la select", e);
		}
	}
	
	public static ArrayList<CursoDTO> buscarPorCodigo(Long codigo) {
		var cursos = new ArrayList<CursoDTO>();

		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_CODIGO);
				) {
			pst.setLong(1, codigo);
			
			ResultSet rs = pst.executeQuery();
			
			CursoDTO curso;
			ProfeDTO profe;

			while (rs.next()) {
				profe = new ProfeDTO(rs.getLong("a.codigo"), rs.getString("a.nombre"), rs.getString("a.apellidos")
						);
				curso = new CursoDTO(rs.getLong("c.codigo"), rs.getString("c.nombre"), rs.getString("c.identificador"), rs.getInt("c.nhoras"), profe);
				LOG.info("SE HA CREADO EL CURSO: " + curso);
				
				cursos.add(curso);
			}

			return cursos;
		} catch (SQLException e) {
			LOG.log(Level.SEVERE, "NO SE HAN PODIDO OBTENER LOS LIBROS CON SUS AUTORES", e);
			throw new RuntimeException("Error en la select", e);
		}
	}
}
