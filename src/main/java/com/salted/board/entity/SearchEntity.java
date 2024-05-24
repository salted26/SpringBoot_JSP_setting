package com.salted.board.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.ColumnDefault;

@Data
@Entity
public class SearchEntity {

    @Id
    private Long Id;

    private int page;           // 현재 페이지 번호
    private int recordSize;     // 페이지당 출력할 게시물의 개수
    private int pageSize;       // 화면 하단에 출력할 페이지 사이즈

    @Column(columnDefinition="TEXT")
    private String searchKeyword;

    @Column(columnDefinition="TEXT")
    private String searchType;

    public SearchEntity() {
        this.page = 1;
        this.recordSize = 10;
        this.pageSize = 5;
    }

    public int getOffset() {
        return (page - 1) * recordSize;
    }
}
