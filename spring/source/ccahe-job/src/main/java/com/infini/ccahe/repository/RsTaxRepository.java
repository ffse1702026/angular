package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsTax;

public interface RsTaxRepository extends CrudRepository<RsTax, Long> {
	@Query(value = "SELECT * FROM rs_tax WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsTax> findAllByCacheId(@Param("cacheId") String cacheId);
}
