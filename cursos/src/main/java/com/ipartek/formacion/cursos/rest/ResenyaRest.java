package com.ipartek.formacion.cursos.rest;

import java.util.ArrayList;

import com.ipartek.formacion.cursos.accesodatos.ResenyaAccesoDatos;
import com.ipartek.formacion.cursos.dtos.ResenyaDTO;

import jakarta.ws.rs.DELETE;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.POST;
import jakarta.ws.rs.PUT;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@Path("/resenyas")
public class ResenyaRest {
	@GET
	public ArrayList<ResenyaDTO> obtenerTodos() {
		return ResenyaAccesoDatos.obtenerTodos();
	}
	
	@POST
	public ResenyaDTO insertar(ResenyaDTO resenya) {
		return ResenyaAccesoDatos.insertar(resenya);
	}
	
	@PUT
	@Path("/{codigo}")
	public ResenyaDTO modificar(@PathParam("codigo") Long codigo, ResenyaDTO resenya) {
		return ResenyaAccesoDatos.modificar(codigo, resenya);
	}
	
	@DELETE
	@Path("/{codigo}")
	public void borrar(@PathParam("codigo") Long codigo) {
		ResenyaAccesoDatos.borrar(codigo);
	}
}
