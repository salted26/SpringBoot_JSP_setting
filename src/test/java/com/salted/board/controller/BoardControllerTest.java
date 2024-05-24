package com.salted.board.controller;

import com.salted.board.entity.BoardEntity;
import com.salted.board.service.BoardService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


@SpringBootTest
class BoardControllerTest {

    @Autowired
    private BoardService boardService;

    // 테스트 데이터 입력
    @Test
    public void input(){
        BoardEntity boardEntity = new BoardEntity();
        for(int i=1;i<100;i++){
            boardEntity.setTitle(i+"번째 게시물입니다");
            boardEntity.setContent(i+"번째 게시물입니다 내용입니다");
        }
    }

}