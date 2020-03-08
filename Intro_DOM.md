To see the HTML of a page, add "view-source:" to the beginning of the url.

the keyword "window"  points to an object the represents Chrome's information about the browser window.

window.innerHeight;
// returns the inner height of the browser window.

Like all objects, window also has methods. We won't use them too much. We don't want to mess with the container of everything that is or operating system stuff.

document.URL 
  //=> http://www.flatironschool.com

document.write("Moof") 
  //=> Removes all existing DOM content, replaces it with "Moof"

document.getElementById() =>  returns a singular element  
document.getElementsByClassName() => return all elements that match 
document.getElementsByTagName() => return all elements that match 
document.querySelector()

Example Use... 
<main>
  <div>
    <div>
      <p>Hello!</p>
    </div>
  </div>
  <div>
    <div>
      <p>Hello!</p>
    </div>
  </div>
  <div>
    <div>
      <p>Hello!</p>
    </div>
  </div>
</main>

1. const main = document.getElementsByTagName('main')[0]
2. const div = main.children[1]
3. const p = div.getElementsByTagName('p')[0]
4. p.textContent = "Goodbye!"
