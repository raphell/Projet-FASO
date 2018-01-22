int TbaseX = 50 ;
int TbaseY = 470 ;

int HbaseX = 50 ;
int HbaseY = 940 ;

int LbaseX = 1000 ;
int LbaseY =  940;

PrintWriter fichierTxt ;
String[] infosTxt ;
int compteurTxt ;
int ligneMax ;
boolean debut = true ;
int jourDebut=1 ;

void setup(){
  size(displayWidth, displayHeight);
  
  
  quad(50,50,50,470,904,470,904,50);
  quad(50,520,50,940,904,940,904,520);
  quad(1000,520,1000,940,1854,940,1854,520);
  
  String valLegende ;
  int Legend ;
  
  for (int k=0 ; k<850 ; k=k+122){
   line(50+k,470,50+k,480); 
  }
  
  for (int k=0 ; k<850 ; k=k+122){
   line(50+k,940,50+k,950); 
  }
  
  for (int k=0 ; k<850 ; k=k+122){
   line(1000+k,940,1000+k,950); 
  }
  
  for (int i =0 ; i<=420 ; i=i+70){    //axe Y Temp
    Legend = i/7;
    valLegende = str(Legend);
    fill(0);
    text(valLegende,25,470-i);
    fill(255);
    line(50,470-i,40,470-i);
    stroke(125,125,125,125);
    line(904,470-i,40,470-i);
    stroke(0,0,0);
  }
  for (int i =0 ; i<=420 ; i=i+35){
    line(50,470-i,45,470-i);
  }
  
  for (int i =0 ; i<=420 ; i=i+42){    //axe Y Hum
    Legend = (i/42)*10;
    valLegende = str(Legend);
    fill(0);
    text(valLegende,25,940-i);
    fill(255);
    line(50,940-i,40,940-i);
    stroke(125,125,125,125);
    line(904,940-i,40,940-i);
    stroke(0,0,0);
  }
  for (int i =0 ; i<=420 ; i=i+21){
    line(50,940-i,45,940-i);
  }
  
  for (int i =0 ; i<=420 ; i=i+105){    //axe Y Lum
    Legend = (i/105)*500;
    valLegende = str(Legend);
    fill(0);
    text(valLegende,965,940-i);
    fill(255);
    line(1000,940-i,990,940-i);
    line(1850,940-i,990,940-i);
  }
  for (int i =0 ; i<=420 ; i=i+21){
    line(1000,940-i,995,940-i);
    stroke(125,125,125,125);
    line(1854,940-i,1000,940-i);
    stroke(0,0,0);
  }
  
  
  
  
  
  fill(0);
  text("Température : (°C)", 50, 40);
  text("Humidité : (%)", 50, 510);
  text("Luminosité : (Lux)", 1000, 510);
 
  
  
}

void draw(){
  
  int temp ,hum ,lum;
  int h ,m ,d ,mo ,y ,jourAff ;
  d = day() ;
  mo = month() ;
  y = year() ;
  float x1, x2, yt, yh, yl ;
  String nomFichTxt = y+"/"+mo+"/"+"ValeursSerre-"+"11.txt";
  infosTxt=loadStrings(nomFichTxt);
  ligneMax = infosTxt.length -1;
  println(ligneMax) ;
  
  for (int j=0 ; j<ligneMax ; j++){
    String valeurs[] = split(infosTxt[j],",");
    println("RELEVE : "+j) ;
    temp = int(valeurs[0]) ;
    hum = int(valeurs[1]);
    lum = int(valeurs[2]);
    h = int(valeurs[3]);
    m = int(valeurs[4]);
    d = int(valeurs[5]);
    mo = int(valeurs[3]);
    y = int(valeurs[7]);
    
    String truc = "t:"+temp+" h:"+hum+" l:"+lum ;
    println(truc);
    
    if (debut) {
      jourDebut = d ;
      debut = false ;
    }
    
    if (d>=jourDebut){                
      jourAff = d - jourDebut ;
    }
    else{
      if (mo==1||mo==3||mo==5||mo==7||mo==8||mo==10||mo==12){
        jourAff = 31 +d -jourDebut  ;
      }
      else if(mo==2){
        jourAff = 28 +d -jourDebut  ;
      }
      else{
        jourAff = 30 +d -jourDebut  ;
      }
    }
    
    x1 = 50 + jourAff*122 + h*(122/24);     
    x2 = 1000 + jourAff*122 + h*(122/24);
    yt = temp*7 ;
    yh = hum*4.2 ;
    yl = lum*0.42 ;
    
    ellipse(x1,470-yt, 2, 2);     //affiche le point de temp
    ellipse(x1,940-yh, 2, 2);     //affiche le point de hum
    ellipse(x2,940-yl, 2, 2);     //affiche le point de lum
  }

}