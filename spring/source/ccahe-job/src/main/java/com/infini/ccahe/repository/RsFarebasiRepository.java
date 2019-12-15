package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsFarebasi;

public interface RsFarebasiRepository extends CrudRepository<RsFarebasi, Long> {
	@Query(value = "SELECT * FROM rs_farebasis WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsFarebasi> findAllByCacheId(@Param("cacheId") String cacheId);
}
