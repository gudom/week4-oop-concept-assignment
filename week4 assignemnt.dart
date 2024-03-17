//import 'dart:io';

// Define Book class
class Book {
  final String title;
  final String author;

  Book(this.title, this.author);

  void displayInfo() {
    print('Title: $title');
    print('Author: $author');
  }
}

// Define Member class
class Member {
  final String name;
  final int memberId;

  Member(this.name, this.memberId);

  void displayInfo() {
    print('Name: $name');
    print('Member ID: $memberId');
  }
}

// Define Library class
class Library {
  final List<Book> books;
  final List<Member> members;

  Library(this.books, this.members);

  void lendBook(Member member, Book book) {
    if (books.contains(book)) {
      print('${member.name} borrowed ${book.title}');
      books.remove(book);
    } else {
      print('${book.title} is not available for borrowing.');
    }
  }

  void returnBook(Member member, Book book) {
    print('${member.name} returned ${book.title}');
    books.add(book);
  }

  void displayAvailableBooks() {
    if (books.isEmpty) {
      print('No books available in the library.');
    } else {
      print('Available Books:');
      books.forEach((book) => book.displayInfo());
    }
  }
}

void main() {
  // Initialize books
  final book1 = Book('The Great Gatsby', 'F. Scott Fitzgerald');
  final book2 = Book('To Kill a Mockingbird', 'Harper Lee');
  final book3 = Book('1984', 'George Orwell');

  // Initialize members
  final member1 = Member('Alice', 1001);
  final member2 = Member('Bob', 1002);

  // Create library and add books
  final library = Library([book1, book2, book3], []);

  // Demonstrate borrowing and returning books
  library.displayAvailableBooks();
  library.lendBook(member1, book1);
  library.lendBook(member2, book2);
  library.displayAvailableBooks();
  library.returnBook(member1, book1);
  library.displayAvailableBooks();
}
