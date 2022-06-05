# iOS App: Pokemon Backpack
## “Gotta catch them all” 

¡Hola mundo!

I was presented with the Challenge of builing a Pokemon Backpack. For me this is almost a full cycle as when I was taking my first steps into developing [I did a Pokedex calling a JSON in React](https://github.com/silviaespanagil/make-your-pokedex). But now I'm using the [PokéApi](https://pokeapi.co/) and changed React for Swift. 

This Swift app uses Combine to manage API calls in order to get a random Pokémon for each call. One the Pokémon trainer finds a Pokémon that is worth to catch, it can tap on the Pokéball just to save the Pokémon into its backpack. All catched Pokémons are stored in a Coredata Database and are displayed in the Backpack View. Here, the trainer can see all the catched Pokémons sorted by Id, and clicking on them will show a detailed information that includes the Poketype and the date it was catched. 

 <img src="https://user-images.githubusercontent.com/81619759/171901737-f6bcff98-f1f8-4cdb-a529-859775776171.png" alt="" width="250"/> <img src="https://user-images.githubusercontent.com/81619759/171901740-f465115d-4b2b-4ee1-85dc-1e90abb29153.png" alt="" width="250"/>  <img src="https://user-images.githubusercontent.com/81619759/171901745-ac943b97-d5e9-4f91-aeef-a2256527f8a6.png" alt="" width="250"/> 
 
## Initial Requirements 📋

- The app does not show Pokémons at start
- To search a Pokémon a random number between 1 and 1000 should be generated.
- Show the Pokémon in the screen showing name, weight and height as text, and sprite/front_default as image.
- You must be able to catch a Pokémon or leave it.
- If a Pokémon was already caught you can't catch it again and a message to the trainer should be shown.
- Catched Pokémons should get added to the backpack
- The Pokémons should be in the backpack forever so they must be there any time you start the app.
- The Backpack should show only image and name of the catched Pokémons sorted by Id
- Inform the trainer if there's any error 
- If you click on a catched Pokémon a detail should be displayed with the following information:
  * The *name* as text
  * The *sprintes/front_default* as image
  * The date and time when the Pokemon was catched
  * The *weight* as text
  * The *height* as text
  * The *base_experience* as text
  * The types of the Pokemon
- Tests
 
## Built with 🔨

- XCode
- SwiftUI
- Combine
- CoreData

## Development ⌨️
 
### API call 📞 
I worked with Combine to manage the API call. As one of the requirements was to generate a random number to make the call and retrieve a random Pokémon, I decided to create and id constant which value is an `Int.random(in: 1..<1000)` inside the `getPokemonEndpoint()` method. This way, everytime a Pokémon is asked for, the number generates and get into the endpoint.

<img width="210" alt="" src="https://user-images.githubusercontent.com/81619759/172050119-e169dcc0-fbb1-465f-b190-326a0b9b5ef5.png">

### Pokeworld view 🗺️
The Pokémons get via the API are rendered here. This view is empty at the beginning and shows a Gameboy Button to make the first search. Each Pokémon you encounter will be shown here and can be catched clicking on the Pokéball.

<img src="https://user-images.githubusercontent.com/81619759/172050018-ed8affd4-9512-4905-957b-1bd74f1982a0.png" alt="" width="210"/>  <img src="https://user-images.githubusercontent.com/81619759/172050032-44d63596-ccdb-4960-96c2-d7541269380c.png" alt="" width="210"/> 


### Persistance ☁️
So, you found an amazing Pokémon in the Pokeworld an catched it, then, here comes Persistance. I created a Database using CoreData with three methods, one to catch the Pokémon, one for checking is not already catched and the last one is for retrieving all the catched Pokémons to see them later in the Backpack.

So with `savePokémon(pokemon: Pokemon)` I save the Pokémon you just caught in the Database. The `existPokemon(pokemon: Pokemon)-> Bool` is a method that returns a Boolean and checks if a Pokémon that is showns on the Pokeworld was already caught. This is important because, if the Pokémon you find in the world, was already caught, you won't be able to catch it again because...is already yours! Last but no least the `getCatchedPokemons() -> [Pokemon]` method that returns an array with all the Pokémons you have caught to check them in your Backpack.

### Backpack 🎒
As a proud trainer you want to see all Pokemóns you have found and caught so, they are all here waitting in the Backpack. This view shows a grid with a simplified card that only shows the picture and name of the Pokémon. But, if you click on any card you will be able to see detailed information and the date you have caught it. 

<img src="https://user-images.githubusercontent.com/81619759/171901748-e1c4ddaa-6b30-4b71-96b5-170b30168d10.png" alt="" width="210"/>  <img src="https://user-images.githubusercontent.com/81619759/171901750-5302e65e-77d5-4b3e-9756-7a4afcdb757a.png" alt="" width="210"/> 

### User feedback 💬
We want the user to understand some things that happen while using the app. So there are some features that are user centered that gives the user feedback about their actions or the app. 
   * **Help tool:** The toolbar has a little help button. Is your first time using the app? No problem! check it and learn how to use it. 
   * **Failed API call:** We all know nothing is perfect so, if in any moment while retrieving a Pokémon from the API the call fail, a message appears and the user can try catching a new Pokémon.
   * **Catching Pokémons:** If while looking for new Pokémons the user finds a creature that is already caught, a toast message appears letting it know the Pokémon is already caught and the Pokeball button in disabled and blured. And if the user find a new Pokémon and decides to catch it, a Gotcha! toast message will appear just to confirm them it was correctly caught.
   * 
<img src="https://user-images.githubusercontent.com/81619759/172049646-4348c65c-b054-4278-8ddb-4166237fc9d0.png" alt="" width="210"/> <img src="https://user-images.githubusercontent.com/81619759/172049650-9d98a9e0-2a5a-45d3-a84d-5241fcb97b32.png" alt="" width="210"/> <img src="https://user-images.githubusercontent.com/81619759/172049653-cdeb28e3-311b-4c51-8e02-35b6b8f19dfe.png" alt="" width="210"/> <img src="https://user-images.githubusercontent.com/81619759/172049670-068bde93-6453-4294-9004-ad27dc746ea0.png" alt="" width="210"/>

### States 🚦
The views are loaded using states: empty, loading, loaded and for the Pokeworld also failed. Each one of this states update the view content as expected. For the empty view I show a welcome message and Gameboy search button in the Pokeworld and an empty backpack in the Backpack View. This views have information so the user can keep interacting with the app.
The loading state renders an animated Pokeball with a searching message. The loaded view updates content to render the expected and sucessful view and the failed view, as stated before on this readme, shows a customize error message with the search button.

### Testing ✅
I know this works not only because it builds on the simulator but because is tested: remote and local tests passed. 

## Check out the app in motion 👀🎬

Uploading Simulator Screen Recording - iPhone 12 - 2022-06-03 at 17.41.33.mov…

## Want to fork this repo? 🐑

Please feel free and let me know what amazing things you have done.

 
