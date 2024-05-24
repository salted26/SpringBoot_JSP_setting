package com.salted.board.controller;

import com.salted.board.entity.BoardEntity;
import com.salted.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.time.LocalDate;
import java.util.List;

@Controller
public class BoardController {

    // service
    @Autowired
    private BoardService boardService;
    // DAO - repository
    // DTO - Entity

    @GetMapping("/board")
    public String board(Model model) {
        List<BoardEntity> list = boardService.selectAll();
        model.addAttribute("list", list);
        return "board/list";
    }

    @GetMapping("/board/list")
    public String boardList() {
        return "redirect:/board";
    }

    @GetMapping("/board/detail/{bno}")
    public String boardDetail(Model model, @PathVariable Long bno) {
        // 게시글 조회
        BoardEntity boardEntity = boardService.selectOne(bno);

        // 카운트 추가
        int counts = boardEntity.getCounts()+1;
        boardEntity.setCounts(counts);
        boardService.modify(boardEntity);

        model.addAttribute("board", boardEntity);
        return "board/detail";
    }

    @GetMapping("/board/write")
    public String boardWrite() {
        return "board/write";
    }

    @PostMapping("/board/write")
    public String boardWritePost(@ModelAttribute BoardEntity boardEntity,
                                 @RequestParam MultipartFile file) {

        if(file !=null && !file.equals("")) {
            uploadFile(file, boardEntity);
        }

        boardService.write(boardEntity);

        return "redirect:/board";
    }

    @GetMapping("/board/modify/{bno}")
    public String boardModify(Model model, @PathVariable Long bno) {
        BoardEntity boardEntity = boardService.selectOne(bno);
        model.addAttribute("board", boardEntity);
        return "board/modify";
    }

    @PostMapping("/board/modify")
    public String boardModifyPost(@ModelAttribute BoardEntity boardEntity,
                                  @RequestParam("bno") Long bno, MultipartFile file) {
        BoardEntity oriBoardEntity = boardService.selectOne(boardEntity.getBno());
        if (boardEntity.getBno() == oriBoardEntity.getBno()) {
            if( oriBoardEntity.getFile_name() != file.getOriginalFilename() ) {
                uploadFile(file, boardEntity);
            }
            boardService.modify(boardEntity);
        }
        return "redirect:/board/detail/"+bno;
    }

    @GetMapping("/board/delete/{bno}")
    public String boardDelete(@PathVariable Long bno) {
        boardService.delete(bno);
        return "redirect:/board";
    }


    // 파일 업로드
    private BoardEntity uploadFile(MultipartFile file, BoardEntity boardEntity) {
        LocalDate localDate = LocalDate.now();
        String fileName = localDate + file.getOriginalFilename();
        String filePath = "D:\\Dev\\workspaces\\board_ver.jsp\\images\\"+fileName;

        File dest = new File(filePath);
        try{
            Files.copy(file.getInputStream(), dest.toPath());
            boardEntity.setFile_name(fileName);
            boardEntity.setFileYN("Y");
        } catch (IOException e) {
            e.printStackTrace();
        }

        return boardEntity;
    }

}
