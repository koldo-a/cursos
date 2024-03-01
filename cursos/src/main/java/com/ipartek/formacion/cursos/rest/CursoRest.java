package com.ipartek.formacion.cursos.rest;

import java.util.ArrayList;

import com.ipartek.formacion.cursos.accesodatos.CursoAccesoDatos;
import com.ipartek.formacion.cursos.dtos.CursoDTO;
import com.ipartek.formacion.cursos.dtos.CursoDTO2;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;
import jakarta.ws.rs.QueryParam;

@Path("/cursos")
public class CursoRest {
	@GET
	public ArrayList<CursoDTO> obtenerTodos() {
		return CursoAccesoDatos.obtenerTodos();
	}
	
//	@GET
//	@Path("/{codigo}")
//	public CursoDTO obtenerPorId(@PathParam("codigo") Long codigo) {
//		return CursoAccesoDatos.obtenerPorId(codigo);
//	}
	
	@GET
	@Path("/{codigo}")
	public CursoDTO2 obtenerPorIdResenya(@PathParam("codigo") Long codigo) {
		return CursoAccesoDatos.obtenerPorIdResenya(codigo);
	}
	
	@GET
	@Path("/todos")
	public ArrayList<CursoDTO> obtenerTodosCursos() {
		return CursoAccesoDatos.obtenerTodosCursos();
	}
	
	@GET
	@Path("/resenyas")
	public ArrayList<CursoDTO2> obtenerTodosResenyas() {
		return CursoAccesoDatos.obtenerTodosResenyas();
	}
	
	@GET
	@Path("/buscar")
	public ArrayList<CursoDTO> obtenerTodos(@QueryParam("codigo") Long codigo) {
		return CursoAccesoDatos.buscarPorCodigo(codigo);
	}
	
}