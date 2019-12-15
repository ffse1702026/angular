package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RsHiddenStop;

public interface RsHiddenStopRepository extends CrudRepository<RsHiddenStop, Long> {
	@Query(value = "SELECT * FROM rs_hidden_stop WHERE cache_id=:cacheId", nativeQuery = true)
	List<RsHiddenStop> findAllByCacheId(@Param("cacheId") String cacheId);
}
