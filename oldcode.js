var Map = { street:
  { go: 
    { 'to work': 'i dont really need that',
      'to a friends house': 'i cant go there, its too soon.',
      home: 'i guess im already there' },
    dont: 
    { 'go anywhere and wait': 'finally a good idea!',
      'do nothing': 'nothing so painful' },
    download: 
    { 'some shit': 
{ t: 'i get some acid playing in my ears in a minute',
 c: [ 111, 'street', 'go', 'acid party' ] },
      'the link': 'i type my password in, and after a second im looking at my stats' } } }

var Index = ["street"];
//console.log(Map["street"]["download"]["some shit"].text);
update(search(Index, Map, ""));

//MAIN FUNCTION

document.getElementById("log").onkeyup=function(e){
    var lc = document.getElementById("log").value;
    var searchHit;
    if(e.keyCode == 8 && Index.length>1){
      document.getElementById("log").value = Index[1] +" ";
      Index.splice(-1,1);
      searchHit=search(Index, Map, Index[Index.length-1]);
      update(searchHit);
    }else{

    switch(Index.length){

      case 1:
console.log("MAIN i=1");
      searchHit = search(Index, Map, lc);
      if(searchHit.length==1){

      }
      update(searchHit);
      break;

      case 2:
console.log("MAIN i=2")
      lc = lc.substr(Index[1].length +1, lc.length);
      searchHit = search(Index, Map, lc);
console.log(lc);
      update(searchHit);     
      break;

      case 3:
      if(e.keyCode == 13){
      document.getElementById("log").value = "";
        update(search(Index, Map, ""));
      }
      break;
    }
  }
}
function update(retur){

  document.getElementById("hub").innerHTML = "";

  if(retur.length == 1){
    switch(Index.length){
      case 1:
      document.getElementById("log").value = retur[0]; //+" "
      Index[1] = retur[0];
      document.getElementById("hub").innerHTML = "> [Space]";
      break

      case 2:
      console.log("upd 2")
      document.getElementById("log").value = Index[1]+" "+retur[0];
      document.getElementById("log").maxLength = document.getElementById("log").value.length;
      Index[2]=retur[0];
      document.getElementById("hub").innerHTML = "[Enter]";
      break;

      case 3:
      console.log("updcase3");
      if(Map[Index[0]][Index[1]][Index[2]].hasOwnProperty("c")){
        switch(Map[Index[0]][Index[1]][Index[2]].c[0]){
          case 111:
          document.getElementById("page").innerHTML = document.getElementById("page").innerHTML + " " + Map[Index[0]][Index[1]][Index[2]].t;
          break;

        }
      }else{
      document.getElementById("page").innerHTML = document.getElementById("page").innerHTML + "<br>" + search(Index, Map, "")[0];
      delete Map[Index[0]][Index[1]][Index[2]];
      Index = [Index[0]];
      document.getElementById("log").maxLength = 100;
      console.log(Index);
      update(search(Index, Map, ""));
      }
      break;



    }
  }
  else{
    for(var i=0; i<retur.length; i++){
      document.getElementById("hub").innerHTML = document.getElementById("hub").innerHTML + "<br>" +retur[i];
    }
  }
}
function wordHandler(index, map){

}
function search(index, map, lc){
  var retur = [];
  switch(index.length){
  
  case 1://looking for scene and verblist
  if(lc==""){
    for (scene in map) {
      if(scene==index[0]){
        for(verb in map[scene]){
          retur.push(verb.toString());
        }
      }
    }
  }else{
    for (scene in map) {
      if(scene==index[0]){
        for(verb in map[scene]){
          if(verb.substr(0, lc.length)==lc){
            retur.push(verb.toString());
          }
        }
      }
    }
  }
  break;

  case 2: //looking for wordlist
  if(lc.substr(0, lc.length)==Index[1]){

    for (verb in map[index[0]]) {
      if(verb.substr(0,index[1].length)==index[1]){
        for(word in map[index[0]][verb]){
          retur.push(word);
        }
      }
    }
  }else{
    for (verb in map[index[0]]) {
      if(verb.substr(0,index[1].length)==index[1]){
        for(word in map[index[0]][verb]){
          if(word.substr(0, lc.length)==lc){

          retur.push(word);
          }
        }
      }
    }
  }
  break;

    case 3: //looking for wordstext
    console.log("case3")
    for (verb in map[index[0]]) {
      if(verb==index[1]){
        for(word in map[index[0]][verb]){
          if(word==index[2]){
            /*if(map[index[0]][index[1]][index[2]].hasOwnProperty("t")){
              retur.push(map[index[0]][verb][word].t);
            }
            else{}*/
              retur.push(map[index[0]][verb][word]);
            
          
          }
        }
      }
    }
    break;
  }
  console.log(retur);
    return retur;
}

