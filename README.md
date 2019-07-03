# Diffable-Data-Source
This project is an extension of the original project presented by @Kilo_Loco on his YouTube channel.

https://www.youtube.com/watch?v=o6hUFEXkf9w&feature=youtu.be

I have separated the dataSource into a new file and call the **createSnapshot** function only once at the time I call **configureDataSource**.

When a new record is added, I use the **appendItems** function from the API.

I have also extended the project to handle deletions using the **deleteItems** function from the API

#### Still need help on **moveItem**

Where I am struggling is moving items.  For some reason, I cannot get the **canMoveRowAt** delegate function for tableView to display the move bars and thus cannot move an item in the tableview and datasource.  

I am probably doing something wrong.

Please feel free to make a PullRequest pointing me in the right direction.