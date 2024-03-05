package com.ipartek.formacion.cursos.rest;

import java.util.ArrayList;

import com.ipartek.formacion.cursos.accesodatos.ProfeAccesoDatos;
import com.ipartek.formacion.cursos.dtos.ProfeDTO;
import com.ipartek.formacion.cursos.dtos.ProfeDTO3;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.PathParam;

@Path("/profesores")
public class ProfeRest {
	@GET
	public ArrayList<ProfeDTO> obtenerTodos() {
		return ProfeAccesoDatos.obtenerTodos();
	}
	
	@GET
	@Path("/{codigo}")
	public ProfeDTO obtenerPorId(@PathParam("codigo") Long codigo) {
		return ProfeAccesoDatos.obtenerPorId(codigo);
	}
	@GET
	@Path("/n/{codigo}")
	public ProfeDTO3 obtenerPorIdProfe(@PathParam("codigo") Long codigo) {
		return ProfeAccesoDatos.obtenerPorIdProfe(codigo);
	}

}
