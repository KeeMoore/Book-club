package com.kmoore.book_club.controllers;

import com.kmoore.book_club.models.Book;
import com.kmoore.book_club.models.User;
import com.kmoore.book_club.services.BookService;
import com.kmoore.book_club.services.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;


@Controller
    public class BookController {

        @Autowired
        private final BookService bookService;
        private final UserService userService;

        public BookController(BookService bookService, UserService userService) {
            this.bookService = bookService;
            this.userService = userService;
        }

        @GetMapping("/books")
        public String allBooks(Model model, HttpSession session) {
            List<Book> books = this.bookService.getAllBooks();
            Long userId = (Long) session.getAttribute("userId");
            if (userId == null) {
                return "redirect:/";
            }

            User user = userService.findById(userId);

            if (user == null) {
                // user not logged in
                return "redirect:/index.jsp";
            }

            model.addAttribute("user", user);
            model.addAttribute("books", books);
            return "books.jsp";
        }

        @GetMapping("/books/new")
        public String addBook(@ModelAttribute("book") Book book, HttpSession session, Model model) {
            // the method that displays the new book form
            Long userId = (Long) session.getAttribute("userId");
            User user = userService.findById(userId);

            if (user == null) {
                // user not logged in
                return "redirect:/index.jsp";
            }

            model.addAttribute("user", user);
            return "addBook.jsp";
        }

        @PostMapping("/books/addBook")
        public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session, Model model) {
            if (result.hasErrors()) {
                Long userId = (Long) session.getAttribute("userId");
                User user = userService.findById(userId);

                if (user == null) {
                    // user not logged in
                    return "redirect:/index.jsp";
                }

                model.addAttribute("book", book);
                model.addAttribute("user", user);

                return "addBook.jsp";
            }

            Book savedBook = this.bookService.createBook(book);
            System.out.println("Book saved: " + savedBook);
            return "redirect:/books";
        }

        @GetMapping("/books/{bookId}")
        public String bookDetails(@PathVariable("bookId") Long bookId, Model model, HttpSession session) {
            Long userId = (Long) session.getAttribute("userId");
            User user = this.userService.findById(userId);

            if (user == null) {
                // user not logged in
                return "redirect:/index.jsp";
            }

            Book book = this.bookService.getBookById(bookId);
//            System.out.println(book.getUser().getFirstName());

            model.addAttribute("user", user);
            model.addAttribute("book", book);
            return "bookDetails.jsp";
        }

        @GetMapping("/books/{bookId}/edit")
        public String editBook(@PathVariable("bookId") Long bookId, Model model, HttpSession session) {
            Long userId = (Long) session.getAttribute("userId");
            User user = this.userService.findById(userId);
            Book book = this.bookService.getBookById(bookId);

            if (user == null) {
                // user not logged in
                return "redirect:/index.jsp";
            }

            model.addAttribute("user", user);
            model.addAttribute("book", book);
            return "editBook.jsp";
        }

        @PostMapping("/books/{id}/update")
        public String updateBook(@PathVariable("id") Long id, @Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session, Model model) {
            if (result.hasErrors()) {
                Long userId = (Long) session.getAttribute("userId");
                User user = this.userService.findById(userId);
                if (user == null) {
                    // user not logged in
                    return "redirect:/index.jsp";
                }
                model.addAttribute("book", book);
                model.addAttribute("user", user);
                return "editBook.jsp";
            }

            this.bookService.updateBook(book);
            return "redirect:/books/" + book.getId();
        }

        @PostMapping("/books/{bookId}/delete")
        public String deleteBook(@PathVariable("bookId") Long bookId, HttpSession session) {
            Long userId = (Long) session.getAttribute("userId");
            User user = this.userService.findById(userId);
            if (user == null) {
                // user not logged in
                return "redirect:/index.jsp";
            }

            this.bookService.deleteBookById(bookId);
            return "redirect:/books";
        }


//    @GetMapping("/{id}/edit")
//    public String showEditForm(@PathVariable("id") Long id, Model model) {
//        Book book = bookService.findById(id);
//        model.addAttribute("book", book);
//        return "editBook";
//    }
//
//    @PostMapping("/{id}/update")
//    public String updateBook(@PathVariable("id") Long id, @ModelAttribute("book") Book book, BindingResult result, Model model) {
//        if (result.hasErrors()) {
//            return "editBook";
//        }
//        bookService.updateBook(id, book);
//        return "redirect:/books";
//    }


    }


