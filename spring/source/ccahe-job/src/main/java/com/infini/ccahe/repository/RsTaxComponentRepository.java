package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsTaxComponent;

public interface RsTaxComponentRepository extends CrudRepository<RsTaxComponent, Long> {
	@Query(value = "SELECT * FROM rs_tax_component WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsTaxComponent> findAllByCacheId(@Param("cacheId") String cacheId);
}
