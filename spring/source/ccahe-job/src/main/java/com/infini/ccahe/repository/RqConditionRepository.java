package com.infini.ccahe.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.infini.ccahe.entity.RqCondition;

public interface RqConditionRepository extends CrudRepository<RqCondition, Long> {
	@Query(value = "SELECT * FROM rq_condition WHERE request_id=:requestId", nativeQuery = true)
	List<RqCondition> findByRequestId(@Param("requestId") String requestId);
}
