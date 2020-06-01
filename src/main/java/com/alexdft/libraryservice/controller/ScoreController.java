package com.alexdft.libraryservice.controller;

import com.alexdft.libraryservice.entity.Score;
import com.alexdft.libraryservice.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ScoreController {

    private ScoreService scoreService;

    @Autowired
    public ScoreController(ScoreService scoreService) {
        this.scoreService=scoreService;
    }

    @PostMapping("/addScore")
    public String addScore(@ModelAttribute("score") Score score) {
        scoreService.addScore(score);
        return "redirect:/bookList";
    }

    @RequestMapping("/deleteScore")
    public String deleteScore(@RequestParam("scoreId") int id) {
        scoreService.deleteScore(id);
        return "redirect:/bookList";
    }
}
