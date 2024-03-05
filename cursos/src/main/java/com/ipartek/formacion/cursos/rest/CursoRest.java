package com.ipartek.formacion.cursos.rest;

import java.util.ArrayList;

import com.ipartek.formacion.cursos.accesodatos.CursoAccesoDatos;
import com.ipartek.formacion.cursos.dtos.CursoDTO;
import com.ipartek.formacion.cursos.dtos.CursoDTO2;
import com.ipartek.formacion.cursos.dtos.CursoDTO3;
import com.ipartek.formacion.cursos.dtos.CursoDTO4;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@Path("/cursos")
public class CursoRest {
	@GET
	public ArrayList<CursoDTO4> obtenerTodos() {
		return CursoAccesoDatos.obtenerTodos();
	}
//	@GET
//	public ArrayList<CursoDTO> obtenerTodos() {
//		return CursoAccesoDatos.obtenerTodos();
//	}
	
	@GET
	@Path("/{codigo}")
	public CursoDTO obtenerPorId(@PathParam("codigo") Long codigo) {
		return CursoAccesoDatos.obtenerPorId(codigo);
	}
	
	@GET
	@Path("/r/{codigo}")
	public CursoDTO3 obtenerPorIdResenya(@PathParam("codigo") Long codigo) {
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
		
}
