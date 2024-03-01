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
	
	@GET
	@Path("/{resenyas_id}")
	public ResenyaDTO obtenerPorId(@PathParam("resenyas_id") Long resenyas_id) {
		return ResenyaAccesoDatos.obtenerPorId(resenyas_id);
	}
	
	@POST
	public ResenyaDTO insertar(ResenyaDTO resenya) {
		return ResenyaAccesoDatos.insertar(resenya);
	}
	
	@PUT
	@Path("/{resenyas_id}")
	public ResenyaDTO modificar(@PathParam("resenyas_id") Long resenyas_id, ResenyaDTO resenya) {
		return ResenyaAccesoDatos.modificar(resenyas_id, resenya);
	}
	
	@DELETE
	@Path("/{resenyas_id}")
	public void borrar(@PathParam("resenyas_id") Long resenyas_id) {
		ResenyaAccesoDatos.borrar(resenyas_id);
	}
}
