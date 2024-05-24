package com.salted.board.repository;

import com.salted.board.entity.BoardEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
@EnableJpaRepositories
public interface BoardRepository extends JpaRepository<BoardEntity, Long> {

    /* 정렬과 페이징 */
    Optional<BoardEntity> findByTitle(String title);
    Optional<BoardEntity> findByUser_id(String user_id);

    Page<BoardEntity> findAllByOrderByCreatedAtDesc(Pageable pageable);
}
