package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsSegComponent;

public interface RsSegComponentRepository extends CrudRepository<RsSegComponent, Long> {
	@Query(value = "SELECT * FROM rs_seg_component WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsSegComponent> findAllByCacheId(@Param("cacheId") String cacheId);
}
