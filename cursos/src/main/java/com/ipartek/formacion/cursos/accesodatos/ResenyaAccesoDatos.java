package com.ipartek.formacion.cursos.accesodatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.cursos.dtos.ResenyaDTO;

public class ResenyaAccesoDatos {
	private static final String SQL_SELECT = "SELECT * FROM alumno_has_resenyas";
	private static final String SQL_SELECT_ID = SQL_SELECT + " WHERE resenyas_id = ?";
	private static final String SQL_INSERT = "INSERT INTO alumno_has_resenyas (alumno_codigo, curso_codigo, resenya) VALUES (?, ? ,?)";
	private static final String SQL_UPDATE = "UPDATE alumno_has_resenyas SET alumno_codigo=?, curso_codigo=?, resenya=? WHERE resenyas_id=?";
	private static final String SQL_DELETE = "DELETE FROM alumno_has_resenyas ahr WHERE ahr.resenyas_id=?";

	public static ArrayList<ResenyaDTO> obtenerTodos() {
		var profesores = new ArrayList<ResenyaDTO>();

		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT);
				ResultSet rs = pst.executeQuery()) {
			ResenyaDTO profe;

			while (rs.next()) {
				profe = new ResenyaDTO(rs.getLong("alumno_codigo"), rs.getLong("curso_codigo"), rs.getString("resenya"),
						rs.getLong("resenyas_id"));

				profesores.add(profe);
			}

			return profesores;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

	public static ResenyaDTO obtenerPorId(Long resenyas_id) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_ID);) {
			pst.setLong(1, resenyas_id);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				return new ResenyaDTO(rs.getLong("alumno_codigo"), rs.getLong("curso_codigo"), rs.getString("resenya"), rs.getLong("resenyas_id"));
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

	public static ResenyaDTO insertar(ResenyaDTO resenya) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_INSERT);) {
			pst.setLong(1, resenya.alumno_codigo());
			pst.setLong(2, resenya.curso_codigo());
			pst.setString(3, resenya.resenya());
			pst.executeUpdate();

			return resenya;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la insert", e);
		}
	}

	public static ResenyaDTO modificar(Long resenyas_id, ResenyaDTO resenya) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_UPDATE);) {
			pst.setLong(1, resenya.alumno_codigo());
			pst.setLong(2, resenya.curso_codigo());
			pst.setString(3, resenya.resenya());
			pst.setLong(4, resenya.resenyas_id());
			pst.executeUpdate();

			return resenya;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la update", e);
		}
	}

	public static void borrar(Long codigo) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_DELETE);) {
			pst.setLong(1, codigo);

			pst.executeUpdate();
		} catch (SQLException e) {
			throw new RuntimeException("Error en la delete", e);
		}
	}
}
