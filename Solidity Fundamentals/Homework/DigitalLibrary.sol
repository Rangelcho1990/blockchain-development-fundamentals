// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract DigitalLibrary{
    enum EBookStatus { Active, Outdated, Archived }

    struct EBook {
        uint256 id;
        string title; // The title of the e-book.
        string author; // The author of the e-book.
        uint256 publicationDate; // The date of publication.
        uint256 expirationDate; // The date when the e-book becomes outdated.
        EBookStatus status; // The status of the e-book, which can be Active, Outdated, or Archived.
        address primaryLibrarian; // The address of the main librarian responsible for managing the e-book.
        uint256 readCount; // Tracks the number of times the e-book’s expiration status has been checked.
    }

    EBook[] public books;
    uint256 public defaultExpirationDate = block.timestamp + 180 days;

    function createEBook(string calldata titleInput, string calldata  authorInput, uint256 publicationDateInput) external returns (uint256) {
        require(bytes(titleInput).length != 0, "Title cannot be empty");
        require(bytes(titleInput).length <= 100, "Title cannot be longer than 100 characters.");

        require(bytes(authorInput).length != 0, "Author cannot be empty");
        require(bytes(authorInput).length <= 100, "Author cannot be longer than 100 characters.");

        require(publicationDateInput > 0, "Not avalid date.");

        EBook memory newBook = EBook({
            id: books.length,
            title: titleInput,
            author: authorInput,
            publicationDate: publicationDateInput,
            expirationDate: defaultExpirationDate,
            status: EBookStatus.Active,
            primaryLibrarian: msg.sender,
            readCount: 0
        });

        books.push(newBook);

        return books.length-1;
    }
}
