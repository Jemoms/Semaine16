villes = [
 {
   nom: "Paris",
   latitude: 48.856578,
   longitude: 2.351828
 }, {
   nom: "Nantes",
   latitude: 47.21806,
   longitude: -1.55278
 }, {
   nom: "Lyon",
   latitude: 45.759723,
   longitude: 4.842223
 }, {
   nom: "Bruxelles",
   latitude: 50.846667,
   longitude: 4.3525
 }, {
   nom: "Bordeaux",
   latitude: 44.837912,
   longitude: -0.579541
 }, {
   nom: "Toulouse",
   latitude: 43.604482,
   longitude: 1.443962
 }, {
   nom: "Montpellier",
   latitude: 43.611944,
   longitude: 3.877222
 }, {
   nom: "Marseille",
   latitude: 43.296346,
   longitude: 5.369889
 }, {
   nom: "Tours",
   latitude: 47.393611,
   longitude: 0.689167
 }, {
   nom: "Lille",
   latitude: 50.637222,
   longitude: 3.063333
 }, {
   nom: "Strasbourg",
   latitude: 48.573392,
   longitude: 7.752353
 }
]


i=0																#initialisation
resultat=[]														#initialisation



#-----------Affichage du menu de selection de la ville de départ-------------------

villes.each do |ville|											#Pour chaque ville du tableau villes
	puts i.to_s + ". " + ville[:nom]							#Affichage de l'index, ainsi que le nom de la ville
	i+=1														#Incrémentation de l'index pour la prochaine ville du tableau
end

puts "Quelle est l'index de la ville de départ?"				#Demande à l'utilisateur de choisir l'index de la ville de départ
index=gets.chomp.to_i											#On récupère l'index de la ville de départ




#---------------------------Calcul du resultat-------------------------------------

while (villes!=[])                                     			#tant qu'il reste des villes

	ville1=villes[index]													#Au départ, ville1 sera la ville de départ que l'utilisateur a séléctionné, après la première boucle, ville1 devient la ville qui était la plus proche de la ville de départ, et ainsi de suite									
	resultat.push(ville1[:nom]) 											#Je mets cette ville dans resultat 
	villes-=[ville1]														#Je retire cette ville du tableau des villes restantes, de façon à ne pas calculer une distance avec elle même
	distances=[]															#Je reset mon tableau distances (qui sert à stocker toutes les distances entre ville1 et le reste des villes)
	
	
	villes.each do |ville2|																							#Pour chaque ville restante :
		distance=Math.sqrt((ville1[:longitude]-ville2[:longitude])**2 + (ville1[:latitude]-ville2[:latitude])**2)	#Je calcule la distance avec ville1 
		distances.push(distance)																					#Je range cette distance dans le tableau distances
	end																												#J'obtiens alors un tableau qui regroupe les distances entre ville1 et le reste des villes
																													#Pour obtenir la ville la plus proche de ville1, je dois donc récupérer la plus petite distance et son index.
	
	reference=99999999																								#Initialisation d'une distance de reference 
	j=0																												#Initialisation de l'itérateur
	distances.each do |distance|																					#Pour chaque distance stockée dans distances :
		if (distance<reference)																						#	Si la distance est inférieure à la référence 
			reference=distance																						#		La référence devient la distance (ainsi, la référence contiendra la plus petite distance du tableau distances)
			index=j																									# 		L'index utilisé pour ma prochaine ville à comparer sera l'index du tableau distances pour lequel la distance est la plus petite
		end
		j+=1																										#Incrémentation de l'itérateur
	end	
	
end

puts "----- Itinéraire recommandé : -----"
puts resultat																										#Affichage du résultat
puts "-----------------------------------"