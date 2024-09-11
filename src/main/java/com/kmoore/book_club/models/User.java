package com.kmoore.book_club.models;

import jakarta.persistence.*;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotEmpty(message = "Please enter your first name." )
    @Size(min = 2, max = 50, message = "First name must be at least 2 characters and not exceed 50 characters.")
    private String name;


    @NotEmpty
    @Email
    private String email;

    @NotEmpty
    @Size(min = 8, max = 255)
    private String password;

    @Transient
    @NotEmpty
    @Size(min = 8, max = 255)
    private String confirm;

    @Column(updatable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdAt;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;

    public User() { }

    public User (String name, String email, String password) {
        this.name = name;
        this.email = email;
        this.password = password;

    }

    public Long getId() {
        return id;
    }

    public @NotEmpty(message = "Please enter your first name.") @Size(min = 2, max = 50, message = "First name must be at least 2 characters and not exceed 50 characters.") String getName() {
        return name;
    }

    public void setName(@NotEmpty @Size(min = 2, max = 50) String name) {
        this.name = name;
    }


    public @NotEmpty @Email String getEmail() {
        return email;
    }

    public void setEmail(@NotEmpty @Email String email) {
        this.email = email;
    }

    public @NotEmpty @Size(min = 8, max = 255) String getPassword() {
        return password;
    }

    public void setPassword(@NotEmpty @Size(min = 8, max = 255) String password) {
        this.password = password;
    }
    public @Size(min = 8, max = 255) String getConfirm() {
        return confirm;
    }

    public void setConfirm(@NotEmpty @Size(min = 8, max = 255) String confirm) {
        this.confirm = confirm;
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

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
