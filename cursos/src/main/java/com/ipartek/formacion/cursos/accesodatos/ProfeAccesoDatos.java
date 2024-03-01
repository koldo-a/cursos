package com.ipartek.formacion.cursos.accesodatos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ipartek.formacion.cursos.dtos.ProfeDTO;

public class ProfeAccesoDatos {
	private static final String SQL_SELECT = "SELECT codigo, nombre, apellidos FROM profesor";
	private static final String SQL_SELECT_ID = SQL_SELECT + " WHERE codigo = ?";

	public static ArrayList<ProfeDTO> obtenerTodos() {
		var profesores = new ArrayList<ProfeDTO>();

		try (Connection con = AccesoDatos.obtenerConexion();
				PreparedStatement pst = con.prepareStatement(SQL_SELECT);
				ResultSet rs = pst.executeQuery()) {
			ProfeDTO profe;

			while (rs.next()) {
				profe = new ProfeDTO(rs.getLong("codigo"), rs.getString("nombre"), rs.getString("apellidos")
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
				return new ProfeDTO(rs.getLong("codigo"), rs.getString("nombre"), rs.getString("apellidos"));
			} else {
				return null;
			}
		} catch (SQLException e) {
			throw new RuntimeException("Error en la select", e);
		}
	}

}
