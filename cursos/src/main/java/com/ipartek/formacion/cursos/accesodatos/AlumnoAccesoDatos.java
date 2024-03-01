package com.ipartek.formacion.cursos.accesodatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.cursos.dtos.AlumnoDTO;

public class AlumnoAccesoDatos {
	private static final String SQL_SELECT = "SELECT codigo, nombre, apellidos, telefono, email, dni FROM alumno";
	private static final String SQL_SELECT_ID = SQL_SELECT + " WHERE codigo = ?";
	private static final String SQL_INSERT = "INSERT INTO alumno (nombre, apellidos, telefono, email, dni) VALUES (?, ?, ?, ?, ?)";
	private static final String SQL_UPDATE = "UPDATE alumno SET nombre=?, apellidos=?, telefono=?, email=?, dni=? WHERE codigo=?";
	private static final String SQL_DELETE = "DELETE FROM alumno WHERE codigo=?";

	public static ArrayList<AlumnoDTO> obtenerTodos() {
		var alumnos = new ArrayList<AlumnoDTO>();

		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT);
				ResultSet rs = pst.executeQuery()) {
			AlumnoDTO alumno;

			while (rs.next()) {
				alumno = new AlumnoDTO(rs.getLong("codigo"), rs.getString("nombre"), rs.getString("apellidos"),
						rs.getString("telefono"), rs.getString("email"), rs.getString("dni"));

				alumnos.add(alumno);
			}

			return alumnos;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

	public static AlumnoDTO obtenerPorId(Long codigo) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT_ID);) {
			pst.setLong(1, codigo);

			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				return new AlumnoDTO(rs.getLong("codigo"), rs.getString("nombre"), rs.getString("apellidos"),
						rs.getString("telefono"), rs.getString("email"), rs.getString("dni"));
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

	public static AlumnoDTO insertar(AlumnoDTO alumno) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_INSERT);) {
			pst.setString(1, alumno.nombre());
			pst.setString(2, alumno.apellidos());
			pst.setString(3, alumno.telefono());
			pst.setString(4, alumno.email());
			pst.setString(5, alumno.dni());
			pst.executeUpdate();

			return alumno;
		} catch (SQLException e) {
			throw new RuntimeException("Error en la insert", e);
		}
	}

	public static AlumnoDTO modificar(Long codigo, AlumnoDTO alumno) {
		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_UPDATE);) {
			pst.setString(1, alumno.nombre());
			pst.setString(2, alumno.apellidos());
			pst.setString(3, alumno.telefono());
			pst.setString(4, alumno.email());
			pst.setString(5, alumno.dni());
			pst.setLong(6, codigo);

			pst.executeUpdate();

			return alumno;
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
