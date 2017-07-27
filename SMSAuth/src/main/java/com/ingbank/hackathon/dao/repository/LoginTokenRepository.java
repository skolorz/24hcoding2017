package com.ingbank.hackathon.dao.repository;

import com.ingbank.hackathon.dao.domain.LoginToken;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.Repository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import java.util.List;

@RepositoryRestResource
public interface LoginTokenRepository extends Repository<LoginToken, Long> {

    @Query(value = "SELECT * FROM logintoken A order by A.createdat desc limit 20", nativeQuery = true)
    List<LoginToken> getLoginTokens();

}
