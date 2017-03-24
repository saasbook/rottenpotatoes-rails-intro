Feature: Delete Movie
 
  As a RottenPotatoes developer
  So that I can make all the CRUD actions available, allowing flexible use of the website
  I want to be able to delete a movie of my choice

Background: movies have been added to database

  Given the following movies exist:
  | title                        | rating | release_date |
  | Aladdin                      | G      | 25-Nov-1992  |
  | The Terminator               | R      | 26-Oct-1984  |
  | When Harry Met Sally         | R      | 21-Jul-1989  |
  | The Help                     | PG-13  | 10-Aug-2011  |
  | Chocolat                     | PG-13  | 5-Jan-2001   |
  | Superfluous Away Team Member | R      | 16-Dec-1954  | 
  | Amelie                       | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey        | G      | 6-Apr-1968   |
  | The Incredibles              | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark      | PG     | 12-Jun-1981  |
  | Chicken Run                  | G      | 21-Jun-2000  |

  And I go to the details page for "Superfluous Away Team Member"
 
 @javascript
Scenario: delete movie and confirm
  And I confirm popup with message "Are you sure?"
  Then I should be on the home page
  Then I should see "Movie 'Superfluous Away Team Member' deleted."
  And I should not see "Superfluous Away Team Member" in the list of movies

@javascript
Scenario: delete movie but cancel
  And I dismiss popup with message "Are you sure?"
  Then I should be on the details page for "Superfluous Away Team Member"
  When I follow "Back to movies list"
  Then I should see "Superfluous Away Team Member" in the list of movies
