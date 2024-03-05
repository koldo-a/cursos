package com.ipartek.formacion.cursos.dtos;

import java.util.List;

public record CursoDTO3(Long codigo, String nombre, String identificador, int nHoras, List<ResenyaDTO> resenya) {

}
