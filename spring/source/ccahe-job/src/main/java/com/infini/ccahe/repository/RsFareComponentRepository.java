package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsFareComponent;

public interface RsFareComponentRepository extends CrudRepository<RsFareComponent, Long> {
	@Query(value = "SELECT * FROM rs_fare_component WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsFareComponent> findAllByCacheId(@Param("cacheId") String cacheId);
}
