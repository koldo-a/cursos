package com.ipartek.formacion.cursos.dtos;

import java.util.List;

public record ProfeDTO3(Long codigo, String nombreCompleto, List<CursoDTO> curso) {
}
