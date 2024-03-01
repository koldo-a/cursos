package com.ipartek.formacion.cursos.rest;

import java.util.ArrayList;

import com.ipartek.formacion.cursos.accesodatos.AlumnoAccesoDatos;
import com.ipartek.formacion.cursos.dtos.AlumnoDTO;

import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@Path("/alumnos")
public class AlumnoRest {
	@GET
	public ArrayList<AlumnoDTO> obtenerTodos() {
		return AlumnoAccesoDatos.obtenerTodos();
	}
	
	@GET
	@Path("/{codigo}")
	public AlumnoDTO obtenerPorId(@PathParam("codigo") Long codigo) {
		return AlumnoAccesoDatos.obtenerPorId(codigo);
	}
	
	@POST
	public AlumnoDTO insertar(AlumnoDTO alumno) {
		return AlumnoAccesoDatos.insertar(alumno);
	}
	
	@PUT
	@Path("/{codigo}")
	public AlumnoDTO modificar(@PathParam("codigo") Long codigo, AlumnoDTO alumno) {
		return AlumnoAccesoDatos.modificar(codigo, alumno);
	}
	
	@DELETE
	@Path("/{codigo}")
	public void borrar(@PathParam("codigo") Long codigo) {
		AlumnoAccesoDatos.borrar(codigo);
	}
	
}
