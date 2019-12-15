package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsSegment;

public interface RsSegmentRepository extends CrudRepository<RsSegment, Long> {
	@Query(value = "SELECT * FROM rs_segment WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsSegment> findAllByCacheId(@Param("cacheId") String cacheId);
}
