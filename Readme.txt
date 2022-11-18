This project contains 4 folders and a main : Functions/model/screens/widgets
Functions : 3 function : One to consume the api of flags , One to consume the api of the first country population ( for home by default)
and one to consume the api of all populations;
Models : PopulationModel that contains a fucntion called filter to return the population of a specified country,
          favors that contains the attributes of a card ( name,idFlag,population,year) that allows you to add or delete a card to favoris
Screens:Home Screen : first Screen that shows into our app;
        CountryFilter: the screen you see when you click on filter with country ( list of country ) 
        favourites : the screen of cards that you added to favourites
        HomeFiltred : it was supposed to be merged with home but i had some problems with it so its the screen when you choose a country in filter .
Widgets : the appBar shown in the app , 
          the bottom shown in the app,
          the card widget 