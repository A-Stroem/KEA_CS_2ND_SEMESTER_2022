# 1. Show the members under the name "Jens S." who were born before 1970 that became members of the library in 2013.
SELECT *
FROM tmember
WHERE cName = 'Jens S.'
  AND DATE(dBirth) < "1970-01-01"
  AND DATE(dNewMember) >= "2013-01-01";

# 2. Show those books that have not been published by the publishing companies with ID 15 and 32,
# except if they were published before 2000.
SELECT *
FROM tbook
WHERE nPublishingYear < 2000
HAVING nPublishingCompanyID != 15
    OR 32;

# 3. Show the name and surname of the members who have a phone number, but no address.
SELECT cName, cSurname
FROM tmember
WHERE cPhoneNo IS NOT NULL
  AND cAddress IS NULL;

# 4. Show the authors with surname "Byatt" whose name starts by an "A" (uppercase) and contains an "S" (uppercase).
SELECT *
FROM tauthor
WHERE cName LIKE 'A%' 'S%'
HAVING cSurname = 'Byatt';

# 5. Show the number of books published in 2007 by the publishing company with ID 32.
SELECT *
FROM tbook
WHERE nPublishingYear = 2007
HAVING nPublishingCompanyID = 32;

# 6. For each day of the year 2014, show the number of books loaned by the member with CPR "0305393207";
SELECT *
FROM tloan
WHERE cCPR = 0305393207
  AND YEAR(dLoan) = 2014;

# 7. Modify the previous clause so that only those days where the member was loaned more than one book appear.
SELECT dLoan, COUNT(dLoan) AS 'Amount of loans'
FROM tloan
WHERE cCPR = 0305393207
  AND YEAR(dLoan) = 2014
GROUP BY dLoan
HAVING COUNT(*) > 1;

# 8. Show all library members from the newest to the oldest. Those who became members on the same day
# will be sorted alphabetically (by surname and name) within that day.
SELECT *
FROM tmember
ORDER BY dNewMember DESC, cSurname, cName;

# 9. Show the title of all books published by the publishing company
# with ID 32 along with their theme or themes.
SELECT tbook.cTitle, ttheme.cName
FROM tbook,
     tbooktheme,
     ttheme
WHERE nPublishingCompanyID = 32;

# 10. Show the name and surname of every author along with the
# number of books authored by them,
# but only for authors who have registered books
# on the database.
SELECT cName, cSurname, COUNT(tbook.cTitle)
FROM tauthor,
     tbook,
     tauthorship
WHERE tauthor.nAuthorID = tauthorship.nAuthorID
  AND tauthorship.nBookID = tbook.nBookID
  AND cTitle IS NOT NULL
GROUP BY cNAme, cSurname;

# 11. Show the name and surname of all the authors with
# published books along with the lowest publishing year
# for their books.
SELECT cName, cSurname, MIN(nPublishingYear) AS MinimumYear
FROM tauthor,
     tauthorship,
     tbook
WHERE tauthor.nAuthorID = tauthorship.nAuthorID
  AND tauthorship.nBookID = tbook.nBookID
  AND cTitle IS NOT NULL
group by cName, cSurname;

# 12. For each signature and loan date, show the title of the corresponding books
# and the name and surname of the member who had them loaned.
SELECT tloan.*, t.cSurname, t.cName, t3.cTitle
FROM tloan
         LEFT JOIN tmember t on tloan.cCPR = t.cCPR
         LEFT JOIN tbookcopy t2 on tloan.cSignature = t2.cSignature
         LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID;

# 13. Repeat exercises 9 to 12 using the modern JOIN notation.
#13.09
-- Can't get the same answer as "normal" #9 Don't know why
SELECT cTitle, ttheme.cName
FROM tbook
         LEFT JOIN tbooktheme
                   ON tbook.nBookID = tbooktheme.nBookID
         LEFT JOIN ttheme
                   ON tbooktheme.nThemeID = ttheme.nThemeID
WHERE nPublishingCompanyID = 32;

#13.10
SELECT cName, cSurname, COUNT(t.nAuthorID) AS 'Books'
FROM tauthor
         LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
GROUP BY tauthor.nAuthorID
ORDER BY COUNT(t.nAuthorID) DESC;

#13.11
SELECT cName, cSurname, MIN(t2.nPublishingYear)
FROM tauthor
         LEFT JOIN tauthorship t on tauthor.nAuthorID = t.nAuthorID
         LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
WHERE t2.nBookID IS NOT NULL
GROUP BY tauthor.cName, tauthor.cSurname;

# 14. Show all theme names along with the titles of their associated books.
# All themes must appear (even if there are no books for some particular themes). Sort by theme name.
SELECT cName, t2.cTitle
FROM ttheme
         LEFT JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
         LEFT JOIN tbook t2 on t.nBookID = t2.nBookID
ORDER BY cName ASC;

# 15. Show the name and surname of all members who joined the library in 2013
# along with the title of the books they took on loan during that same year.
# All members must be shown, even if they did not take any book on loan during 2013.
# Sort by member surname and name.
SELECT cName, cSurname, t3.cTitle
FROM tmember
         LEFT JOIN tloan t on tmember.cCPR = t.cCPR
         LEFT JOIN tbookcopy t2 on t.cSignature = t2.cSignature
         LEFT JOIN tbook t3 on t2.nBookID = t3.nBookID
WHERE YEAR(dNewMember) = 2013
ORDER BY cSurname, cName;

# 16. Show the name and surname of all authors along with their nationality or
# nationalities and the titles of their books.
# Every author must be shown, even though s/he has no registered books.
# Sort by author name and surname.
SELECT tauthor.cName, tauthor.cSurname, tcountry.cName, tbook.cTitle
FROM tauthor
         LEFT JOIN tnationality
                   ON tauthor.nAuthorID = tnationality.nAuthorID
         LEFT JOIN tcountry
                   ON tcountry.nCountryID = tnationality.nCountryID
         RIGHT JOIN tauthorship
                    ON tauthor.nAuthorID = tauthorship.nAuthorID
         LEFT JOIN tbook
                   ON tbook.nBookID = tauthorship.nBookID
ORDER BY tauthor.cName, cSurname;

# 17. Show the title of those books which have had different editions
# published in both 1970 and 1989.
SELECT cTitle, COUNT(*) AS Title
FROM tbook
WHERE nPublishingYear = 1970
   OR nPublishingYear = 1989
GROUP BY cTitle
HAVING COUNT(*)>1;


# 18. Show the surname and name of all members who joined the library in
# December 2013
# followed by the surname and name of those authors whose name is “William”.
SELECT cSurname, cName
FROM tmember
WHERE YEAR(dNewMember) = 2013
UNION
SELECT cSurname, cName
FROM tauthor
WHERE cName = 'William';

# 19. Show the name and surname of the first chronological member of the library using subqueries.
SELECT cName, cSurname
FROM tmember
WHERE dNewMember = (SELECT MIN(dNewMember) FROM tmember);

# 20. For each publishing year, show the number of book titles published by
# publishing companies
# from countries that constitute the nationality for at least three authors.
# Use subqueries.
SELECT nPublishingYear, COUNT(*) AS 'Books Published', cName
FROM tbook, (SELECT cName
             FROM tcountry
                      LEFT JOIN tnationality t on tcountry.nCountryID = t.nCountryID
             GROUP BY cName
             HAVING COUNT(*) >= 3) name
GROUP BY nPublishingYear, cName
ORDER BY nPublishingYear;

# 21. Show the name and country of all publishing companies with the headings "Name" and "Country".
SELECT tpublishingcompany.cName AS Name, t.cName AS Country
FROM tpublishingcompany
         LEFT JOIN tcountry t on tpublishingcompany.nCountryID = t.nCountryID;

# 22. Show the titles of the books published between 1926 and 1978
# that were not published by the publishing company with ID 32.
SELECT cTitle, nPublishingCompanyID, nPublishingYear
FROM tbook
WHERE nPublishingYear > 1926
  AND nPublishingYear < 1978
  AND nPublishingCompanyID != 32;

# 23. Show the name and surname of the members who joined the library after 2016 and have no address.
SELECT cName, cSurname
FROM tmember
WHERE DATE(dNewMember) > 2016
  AND cAddress IS NULL;

# 24. Show the country codes for countries with publishing companies.
# Exclude repeated values.
SELECT DISTINCT nCountryID FROM tpublishingcompany;

# 25. Show the titles of books whose title starts by
# "The Tale" and that are not published by "Lynch Inc".
SELECT cTitle
FROM tbook
         LEFT JOIN tpublishingcompany t on tbook.nPublishingCompanyID = t.nPublishingCompanyID
WHERE cTitle LIKE 'The Tale%' AND t.cName != 'Lynch Inc';

# 26. Show the list of themes for which the publishing company
# "Lynch Inc" has published books, excluding repeated values.
SELECT DISTINCT ttheme.cName, tpublishingcompany.cName
FROM tpublishingcompany, ttheme
WHERE tpublishingcompany.cName LIKE 'Lynch Inc';

# 27. Show the titles of those books which have never been loaned.
SELECT cTitle
FROM tbook
         LEFT JOIN tbookcopy t on tbook.nBookID = t.nBookID
WHERE t.cSignature IS NULL;

# 28. For each publishing company, show its number of existing books
# under the heading "No. of Books".
SELECT cName, COUNT(*) AS 'No. of Books'
FROM tpublishingcompany
         LEFT JOIN tbook t on tpublishingcompany.nPublishingCompanyID = t.nPublishingCompanyID
GROUP BY cName
ORDER BY COUNT(*) DESC;

# 29. Show the number of members who took some book on a loan
# during 2013.
SELECT COUNT(*) AS 'No. of members who loaned in 2013'
FROM tmember
         LEFT JOIN tloan t on tmember.cCPR = t.cCPR
WHERE YEAR(dLoan) = 2013;

# 30. For each book that has at least two authors, show its title and
# number of authors under the heading "No. of Authors".
SELECT cTitle, COUNT(*) AS 'No. of Authors'
FROM tbook
         LEFT JOIN tauthorship t on tbook.nBookID = t.nBookID
GROUP BY cTitle
HAVING COUNT(*) >1;