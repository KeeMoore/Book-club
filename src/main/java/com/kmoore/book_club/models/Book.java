package com.kmoore.book_club.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
@Entity
@Table(name = "books")
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Book title cannot not be empty.")
    @Size(min = 2, max = 255, message = "Book title must be between 2 and 255 characters.")
    private String title;

    @NotEmpty(message = "Book author cannot be blank.")
    @Size(min = 2, max = 255, message = "Book author must be between 2 and 255 characters.")
    private String author;

    @NotEmpty(message = "My thoughts section cannot be blank.")
    @Size(min = 2, max = 255, message = "Thoughts section must be between 2 and 255 characters.")
    private String thoughts;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;
    public Book() {
    }

    public Book(String title, String author, String thoughts, Date createdAt, Date updatedAt, User user) {
        this.title = title;
        this.author = author;
        this.thoughts = thoughts;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public @NotEmpty @Size(min = 2, max = 255) String getTitle() {
        return title;
    }

    public void setTitle(@NotEmpty @Size(min = 2, max = 255) String title) {
        this.title = title;
    }

    public @NotEmpty @Size(min = 2, max = 255) String getAuthor() {
        return author;
    }

    public void setAuthor(@NotEmpty @Size(min = 2, max = 255) String author) {
        this.author = author;
    }

    public @NotEmpty @Size(min = 2, max = 255) String getThoughts() {
        return thoughts;
    }

    public void setThoughts(@NotEmpty @Size(min = 2, max = 255) String thoughts) {
        this.thoughts = thoughts;
    }


    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }


}

