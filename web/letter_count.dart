import 'dart:html';

void main() {
  TextAreaElement zoneTexte = document.query('#txtText');
  TextAreaElement listeLettres = document.query('#txtLetters');
  ButtonElement boutonFrequence = document.query('#btnFrequency');
  ButtonElement boutonClear = document.query('#btnClear');
  
  //EvenHandler bouton des fréquences
  boutonFrequence.onClick.listen((MouseEvent e){
    String texte = zoneTexte.value;
    
    if (texte != null && texte.length > 0){
      Map<String, int> frequences = CompterFrequenceLettres(texte);
      listeLettres.value = ConstruireTexteFrequence(TrierLettres(frequences), frequences);
    }
    else{
      listeLettres.value = "Aucun texte saisi!";
    }
    
  });
  
  //EventHandler bouton clear
  boutonClear.onClick.listen((MouseEvent e) {
    zoneTexte.value = "";
    listeLettres.value = "";
  });
  
}


Map<String, int> CompterFrequenceLettres(String texte){
  //Enlever d'abord tous les blancs
  texte = texte.replaceAll(' ', '');
  
  Map<String, int> frequences = new Map<String, int>();
  
  for(int i = 0; i < texte.length; i++){
    if (frequences.containsKey(texte[i])){
      frequences[texte[i]]++;
    }
    else{
      frequences[texte[i]] = 1;
    }
  }
  
  return frequences;
}


List TrierLettres(Map<String, int> frequences) {
  List lettresTriees = frequences.keys.toList();  
  lettresTriees.sort((m,n) => m.compareTo(n));
  return lettresTriees;
}


String ConstruireTexteFrequence(List lettres, Map<String, int> frequences){
  
  StringBuffer sb = new StringBuffer("Les caractères ont la fréquence suivante: \n\n");
  
  for(var lettre in lettres){
    sb.write(lettre.toString() + ": " + frequences[lettre].toString() + "\n");
  }
  
  return sb.toString();
}

