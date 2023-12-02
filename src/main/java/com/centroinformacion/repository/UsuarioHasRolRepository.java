package com.centroinformacion.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.centroinformacion.entity.UsuarioHasRol;
import com.centroinformacion.entity.UsuarioHasRolPK;

public interface UsuarioHasRolRepository extends
		JpaRepository<UsuarioHasRol, UsuarioHasRolPK>{

}
