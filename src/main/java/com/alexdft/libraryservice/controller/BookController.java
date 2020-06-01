package com.alexdft.libraryservice.controller;

import com.alexdft.libraryservice.entity.Book;
import com.alexdft.libraryservice.entity.Score;
import com.alexdft.libraryservice.service.BookService;
import com.alexdft.libraryservice.service.ScoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {

    private BookService bookService;
    private ScoreService scoreService;

    @Autowired
    public BookController(BookService bookService, ScoreService scoreService) {
        this.bookService=bookService;
        this.scoreService=scoreService;
    }

    @GetMapping("/")
    public String showHome() {
        return "home";
    }

    @GetMapping("/adminPanel")
    public String listBooks(Model theModel) {
        List<Book> bookList = bookService.getBooksSortedByTitle();
        theModel.addAttribute("allBooks", bookList);
        return "admin-panel";
    }

    @RequestMapping("/bookList")
    public String listBooksForUser(Model theModel) {
        List<Book> bookList = bookService.getBooksSortedByScore();
        List<Score> scoreList = scoreService.getScores();
        Score score = new Score();
        theModel.addAttribute("allBooks", bookList);
        theModel.addAttribute("allScores", scoreList);
        theModel.addAttribute("newScore", score);
        return "user-panel";
    }

    @GetMapping("/addForm")
    public String showFormForAdd(Model theModel) {
        Book book = new Book();
        theModel.addAttribute("newBook", book);
        return "add-book";
    }

    @GetMapping("/updateForm")
    public String showFormForUpdate(@RequestParam("bookId") int id, Model theModel) {
        Book book = bookService.getBook(id);
        theModel.addAttribute("newBook", book);
        return "add-book";
    }

    @PostMapping("/saveBook")
    public String saveBook(@ModelAttribute("newBook") Book book) {
        bookService.saveBook(book);
        return "redirect:/adminPanel";
    }

    @RequestMapping("/deleteBook")
    public String deleteBook(@RequestParam("bookId") int id) {
        bookService.deleteBook(id);
        return "redirect:/adminPanel";
    }
}