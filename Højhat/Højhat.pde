int width = 400;
int height = 600;

strokeWeight(15);
size(400, 600); // Ændre canvas til 400, 400








// Tegn fjæs
// X, Y, Radius
fill(222, 162, 162);
circle(400 / 2, 600 / 2, 300); 


// Tegn øjne
// sorte øjne
fill(0, 0, 0);
rect(400 / 4, 600 / 3, 80, 80);  // Højre
rect(400 / 2 + 10, 600 /3, 80, 80);  // Venstre

// tegning af briller
line(65, 240, 100, 240);
line(330, 240, 290, 240);

// Tegning af sorte pupiler
strokeWeight(1);
fill(0,0,0);
rect(400 / 4 + 25, 600 / 3 + 25, 30, 30);  // Højre
rect(400 / 2 + 35, 600 /3 + 25, 30, 30);  // Venstre
strokeWeight(15);
// Tegning af næse
// Red
fill(255, 0, 0);
circle(400 / 2, 600 / 2,100); 

// Tegning af mund
fill(230, 0, 0);
arc(400 / 2, 370, 100, 100, 0, PI, OPEN);


// Tegning af hat

// Sort
fill(0, 0, 0);
// X1, Y1, X2, Y2
line(50, 180, 350, 180);

rect(80, 180, 240, -200);  // Venstre

// Tegning af tænder
strokeWeight(1);
fill(255, 255, 255);
rect(160, 360, 80, 20);  // Venstre
