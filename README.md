SeedBox Technical Test

Dans le but de ne pas éterniser la livraison du test technique, j'ai fait abstraction de
la couche de sécurité au niveau de l'API.

L'application possède 2 BD. 

BD 1: Gére les utilisateurs et la méchanique de oAuth2 à travers le module Passport de Laravel. 
   - oAuth2 n'est pas fonctionnel en raison de mon manque de connaissance actuel sur ce genre de méchanique.

BD 2: Les "serveurs".

La zone administrative est protéger par la méchanique d'autentification de Laravel.

Dans l'optique où oAuth serait fonctionnel, une méthodologie de Encrypted JSON Web Token aurait pu/du être utilisé.
Pour simplifié le développement local je ne me suis pas attardé sur la connection HTTPS qui serait essentielle en production.

<h1>Requirements</h1>
<b>Environnement</b>
<ul>
<li>PHP 7.1.*</li>
<li>Composer</li>
<li>NodeJS</li>
<li>npm</li>
</ul>
<b>Requirements for Laravel 5.8</b>
<ul>
<li>PHP >= 7.1.3</li>
<li>BCMath PHP Extension</li>
<li>Ctype PHP Extension</li>
<li>JSON PHP Extension</li>
<li>Mbstring PHP Extension</li>
<li>OpenSSL PHP Extension</li>
<li>PDO PHP Extension</li>
<li>Tokenizer PHP Extension</li>
<li>XML PHP Extension</li>
</ul>

<h1> Instruction </h1>
<ol>
<li>Cloner le repository vers un environnement.</li>
<li>Changer la valeur de APP_URL dans .env au besoin.</li>
<li>Changer les valeurs de connection de BD dans .env au besoin.</li>
<li>composer Install</li>
<li>npm install</li>
<li>npm run dev</li>
</ol>