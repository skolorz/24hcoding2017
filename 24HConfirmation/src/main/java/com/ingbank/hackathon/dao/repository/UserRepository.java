package com.ingbank.hackathon.dao.repository;

import com.ingbank.hackathon.dao.domain.Users;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends CrudRepository<Users, Long> {

    Optional<Users> findByToken(String token);

    @Query("from Users where is_admin = false order by status, teamName")
    List<Users> findAllSorted();

    @Query("SELECT COUNT(u) from Users u where u.status = 'CONFIRMED' group by u.teamName having COUNT(u) > 0")
    int findAllGrouped();

}
