package pl.coderslab.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.entity.Club;

import java.util.List;

public interface ClubRepository extends JpaRepository<Club, Long> {
    List<Club> findAllByType(String type);
    Club findFirstById(Long id);
    @Query("select b from Club b where b.type = ?1 and b.validated = true")
    List<Club> findValidatedByType(String type);
}
