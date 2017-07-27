package com.ingbank.hackathon.dao.repository;

import com.ingbank.hackathon.dao.domain.TransactionRequest;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource
public interface TransactionRequestRepository extends Repository<TransactionRequest, Long> {

    @Query(value = "SELECT * FROM mappedtransactionrequest A where trim(A.mchallenge_id) <> '' and A.mchallenge_id is not null order by A.createdat desc limit 20", nativeQuery = true)
    List<TransactionRequest> getTokens();

}
