# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# 1. Clean the database 🗑️
puts "Cleaning database..."
Message.destroy_all
Chat.destroy_all
News.destroy_all
User.destroy_all

# 2. Create the instances 🏗️
puts "Creating news..."

# Trame
# content = <<~CONTENT
#   ## Explication

#   ## Sources

# CONTENT

# News.create!(
#   name: "",
#   verdict: "",
#   truth_percentage: 0,
#   category: "",
#   confidence_level: "",
#   tags: [],
#   trending: false,
#   origin: "",
#   content: content
# )


# News 1
content = <<~CONTENT
  ## EXPLICATION

  Non, on en a beaucoup plus. La classification en 5 sens (vue, ouïe, toucher, odorat, goût) vient d'Aristote et s'est imposée par tradition philosophique et religieuse au Moyen Âge, mais elle ne tient pas face à la science moderne. Les chercheurs en distinguent aujourd'hui une vingtaine, voire plus selon les classifications : l'équilibre (système vestibulaire), la proprioception (perception de la position de son corps), la thermoception (température), la nociception (douleur), la sensation de faim, de soif, l'interoception (signaux internes du corps), etc. Le mythe perdure tellement qu'on parle encore d'un "sixième sens" pour désigner l'intuition — alors qu'on en utilise déjà bien plus que cinq sans s'en rendre compte.

  ## SOURCES

  • Wikipedia — Sense (en.wikipedia.org/wiki/Sense)
  • Wikipedia — Five wits (en.wikipedia.org/wiki/Five_wits)
  • Wikipedia — Special senses (en.wikipedia.org/wiki/Special_senses)
CONTENT

News.create!(
  name: "Les humains ont 5 sens",
  verdict: "FAUX",
  truth_percentage: 15,
  category: "Science",
  confidence_level: "Élevée",
  tags: ["sens", "biologie", "cerveau", "idée-reçue", "anatomie"],
  trending: true,
  origin: "Classification antique (Aristote, Ve siècle av. J.-C.), restée dominante en Europe au Moyen Âge via la philosophie classique et la littérature chrétienne.",
  content: content
)

# News 2
content = <<~CONTENT
  ## EXPLICATION

  Totalement faux, et ironiquement le mythe lui-même est un cas d'école de désinformation. Biologiquement, c'est absurde : les araignées n'ont aucun intérêt à grimper sur un humain qui respire, ronfle et bouge — pour elles, on est juste un gros rocher vivant et menaçant. Si une araignée s'aventurait sur ton visage, la sensation de ses pattes te réveillerait probablement. Les entomologistes et la National Sleep Foundation s'accordent : c'est tout au plus un événement aléatoire qui peut arriver une fois dans une vie, certainement pas 8 fois par an. Le chiffre "8" a été inventé de toutes pièces et n'a aucune base scientifique.
  ## SOURCES
  • Scientific American — Fact or Fiction? People Swallow 8 Spiders a Year While They Sleep
• Britannica — Do We Really Swallow Spiders In Our Sleep?
• Snopes — Do People Swallow Eight Spiders Per Year?
• Discover Magazine — Humans Don't Eat 8 Spiders Per Year in Their Sleep
CONTENT

News.create!(
name: "On avale en moyenne 8 araignées par an pendant notre sommeil",
verdict: "FAUX",
truth_percentage: 5,
category: "Science",
confidence_level: "Élevée",
tags: ["araignées", "sommeil", "mythe-viral", "internet", "urban-legend"],
trending: true,
origin: "Mythe internet popularisé dans les années 1990, dont l'origine exacte reste inconnue selon les chercheurs.",
content: content
)




# News 3
content = <<~CONTENT
  ## EXPLICATION
  Mythe complet. Einstein a été un excellent élève, particulièrement en maths et en physique. Sur son bulletin du Polytechnique de Zurich, il avait 6/6 (la meilleure note possible en Suisse) en algèbre, géométrie et physique. Avant 15 ans, il maîtrisait déjà le calcul différentiel et intégral. La confusion vient d'une mauvaise lecture du système de notation suisse — où 6 est la meilleure note, pas la pire — et d'une chronique de 1935 qu'Einstein lui-même a démentie en répondant : "Je n'ai jamais échoué en mathématiques." Le mythe survit parce qu'il rassure les mauvais élèves : "si Einstein était nul, je peux devenir un génie aussi."
## SOURCES
• The Washington Post — Was Albert Einstein really a bad student who failed math?
• WTAMU Science Q&A — How did Albert Einstein flunk math and still end up so smart?
• Fact/Myth — Einstein Was a Poor Student
CONTENT
News.create!(
  name: "Albert Einstein était nul à l'école",
  verdict: "FAUX",
  truth_percentage: 10,
  category: "Histoire",
  confidence_level: "Élevée",
  tags: ["einstein", "école", "mythe", "intelligence", "science"],
  trending: true,
  origin: "Mythe popularisé par une chronique Ripley's Believe It or Not! de 1935, démenti de son vivant par Einstein lui-même.",
  content: content
)

# News 4
content = <<~CONTENT
  ## EXPLICATION
  Faux, et c'est confirmé par les astronautes eux-mêmes. La Grande Muraille fait environ 6 à 9 mètres de large seulement — vue depuis l'espace, elle ressemblerait à un cheveu humain observé à 3 km de distance. Pire, elle est faite de pierres de la même couleur que le sol environnant, donc même quand elle est techniquement dans le champ de vision, elle se confond avec le paysage. Yang Liwei, le premier astronaute chinois, a confirmé en 2003 ne pas l'avoir vue depuis l'orbite — au point que les manuels scolaires chinois ont commencé à retirer cette affirmation. Neil Armstrong, Buzz Aldrin et la NASA elle-même ont tous démenti le mythe. En revanche, de nombreux ouvrages humains (autoroutes, aéroports, ponts, le barrage des Trois-Gorges) sont eux bien visibles depuis l'orbite basse.
## SOURCES
• NASA — Great Wall (nasa.gov/image-article/great-wall)
• Scientific American — No, You Can't See the Great Wall of China from Space
• BBC Sky at Night — Can you see the Great Wall of China from space?
CONTENT
News.create!(
  name: "La Grande Muraille de Chine est visible depuis l'espace à l'œil nu",
  verdict: "FAUX",
  truth_percentage: 8,
  category: "Histoire",
  confidence_level: "Élevée",
  tags: ["grande-muraille", "espace", "lune", "astronautes", "mythe"],
  trending: true,
  origin: "Mythe documenté pour la première fois en 1754 dans un écrit de l'antiquaire anglais William Stukeley, propagé bien avant l'ère spatiale.",
  content: content
)


#news 5
content = <<~CONTENT
  ## EXPLICATION
  Faux, et de plus de 1500 ans. Les Grecs anciens savaient déjà que la Terre est sphérique dès le Ve siècle av. J.-C. (Pythagore, puis Aristote, puis Ératosthène qui en a même calculé la circonférence vers 240 av. J.-C. avec une précision étonnante). Cette connaissance n'a jamais été perdue : tous les grands savants du Moyen Âge en Europe l'acceptaient comme un fait établi. Quand Colomb part en 1492, personne d'éduqué ne pense que la Terre est plate. Le vrai débat avec ses commanditaires portait sur la taille de la Terre : Colomb la croyait beaucoup plus petite qu'elle ne l'est (et il avait tort — il aurait dû mourir en mer sans les Amériques sur le chemin). Le mythe d'un Colomb pionnier de la sphéricité vient surtout d'un roman de Washington Irving en 1828, repris au 19e siècle pour des raisons idéologiques.
## SOURCES
• Wikipedia — Myth of the flat Earth (en.wikipedia.org/wiki/Myth_of_the_flat_Earth)
• Wikipedia — Spherical Earth (en.wikipedia.org/wiki/Spherical_Earth)
• Wikipedia — Timeline of Earth estimates (en.wikipedia.org/wiki/Timeline_of_Earth_estimates)
CONTENT
News.create!(
  name: "Christophe Colomb a découvert que la Terre est ronde",
  verdict: "FAUX",
  truth_percentage: 5,
  category: "Histoire",
  confidence_level: "Élevée",
  tags: ["christophe-colomb", "terre-ronde", "antiquité", "idée-reçue", "géographie"],
  trending: true,
  origin: "Mythe popularisé entre 1870 et 1920, notamment par les écrits de Washington Irving (1828), John William Draper et Andrew Dickson White, dans le contexte des débats sur l'évolution.",
  content: content
)

# News 6
content = <<~CONTENT
  ## EXPLICATION
  Partiellement vrai. Claude Mythos existe bel et bien — c'est le nouveau modèle frontière d'Anthropic annoncé en avril 2026, et il a effectivement marqué l'industrie. Mais il n'est PAS sorti en grand public : l'accès est restreint au "Project Glasswing", un programme avec un groupe limité de partenaires industriels critiques et de développeurs open source, sous des conditions qui restreignent son usage à la cybersécurité. Anthropic a choisi cette sortie limitée parce que les capacités offensives du modèle (identification de vulnérabilités zero-day, génération d'exploits fonctionnels dans 83 % des cas en test) sont jugées trop puissantes pour une mise à disposition publique. Dire qu'il "a secoué le monde de la tech" est vrai au sens où l'industrie cybersécurité recalibre ses standards, mais l'image d'une "sortie grand public" est trompeuse.
## SOURCES
• Anthropic — Project Glasswing (anthropic.com/glasswing)
• Google Cloud Blog — Claude Mythos Preview on Vertex AI
• BleepingComputer — Anthropic's restricted Claude Mythos model may be coming to Claude Code
• ArmorCode — Anthropic's Claude Mythos and What it Means for Security
CONTENT
News.create!(
  name: "Claude Mythos est sorti et a secoué le monde de la tech",
  verdict: "PARTIELLEMENT VRAI",
  truth_percentage: 60,
  category: "Tech & IA",
  confidence_level: "Élevée",
  tags: ["anthropic", "claude-mythos", "ia", "cybersécurité", "glasswing"],
  trending: true,
  origin: "Annoncé officiellement par Anthropic le 7-8 avril 2026, après une fuite accidentelle d'informations le 26 mars 2026 via une mauvaise configuration de leur CMS.",
  content: content
)

# News 7
content = <<~CONTENT
  ## EXPLICATION
  Trompeur, car le chiffre existe vraiment mais son sens est régulièrement mal interprété. Goldman Sachs estime que 300 millions d'emplois dans le monde sont exposés à l'automatisation par l'IA, mais "exposé à l'automatisation" ne veut PAS dire "supprimé". Le rapport précise que pour ces métiers, seule une part (25 % à 50 %) des tâches pourrait être automatisée, ce qui modifie les rôles plutôt que les supprimer. De plus, l'horizon n'est pas "2030" mais une décennie complète, et l'analyse rappelle que l'innovation technologique a historiquement créé autant d'emplois qu'elle en a détruits. Une mise à jour Goldman Sachs de mars 2026 confirme d'ailleurs qu'aucun effet majeur n'est encore visible sur les marchés du travail, et que la transition pourrait être progressive avec un déplacement de 6-7 % des travailleurs sur 10 ans.
## SOURCES
• Goldman Sachs — How Will AI Affect the US Labor Market? (mars 2026)
• Goldman Sachs — Generative AI could raise global GDP by 7% (rapport original 2023)
• Fortune — Goldman Sachs AI labor market analysis
CONTENT
News.create!(
  name: "Les IA vont remplacer 300 millions d'emplois d'ici 2030",
  verdict: "PLUTÔT FAUX",
  truth_percentage: 35,
  category: "Tech & IA",
  confidence_level: "Moyenne",
  tags: ["ia", "emploi", "automatisation", "goldman-sachs", "prédiction"],
  trending: true,
  origin: "Rapport de Goldman Sachs publié en mars 2023 par les économistes Joseph Briggs et Devesh Kodnani, largement diffusé puis souvent déformé.",
  content: content
)

# News 8
content = <<~CONTENT
  ## EXPLICATION
  Partiellement vrai, mais l'image qu'on en retient est fausse. OpenAI a bien annoncé que GPT-4 avait obtenu un score plaçant le modèle dans le 90e percentile à l'Uniform Bar Exam, et le score brut (298/400) est réel. Le problème, démontré par une étude du chercheur MIT Eric Martínez en 2024, est que ce 90e percentile était calculé par rapport à un groupe constitué majoritairement de candidats qui avaient déjà échoué une ou plusieurs fois et qui obtiennent en général des scores bien inférieurs à la moyenne. Comparé aux candidats normaux, GPT-4 se situe plutôt autour du 68e percentile ; comparé aux avocats effectivement diplômés, autour du 48e percentile, et seulement au 15e percentile sur les dissertations. Donc oui, GPT-4 passe le barreau — mais "top 10 %" est massivement exagéré.
## SOURCES
• Eric Martínez (MIT) — Re-evaluating GPT-4's bar exam performance (Artificial Intelligence and Law, 2024)
• Live Science — GPT-4 didn't ace the bar exam after all, MIT research suggests
• Fast Company — Did OpenAI's GPT-4 really pass the bar exam?
• New York State Bar Association — Why ChatGPT-4's Score on the Bar Exam May Not Be So Impressive
CONTENT
News.create!(
  name: "GPT-4 a réussi l'examen du barreau dans le top 10%",
  verdict: "PARTIELLEMENT VRAI",
  truth_percentage: 45,
  category: "Tech & IA",
  confidence_level: "Élevée",
  tags: ["gpt-4", "openai", "barreau", "ia", "étude-mit"],
  trending: true,
  origin: "Affirmation lancée par OpenAI lors du lancement de GPT-4 en mars 2023, contestée par une étude du MIT (Eric Martínez) publiée en mars 2024.",
  content: content
)

# News 9

content = <<~CONTENT
  ## EXPLICATION
  Faux pour une consommation normale. La caféine est effectivement un léger diurétique (elle augmente un peu la production d'urine), mais l'eau contenue dans le café compense largement cet effet. Pour des consommations modérées — jusqu'à 3-4 tasses par jour — le bilan hydrique reste positif. La British Dietetic Association confirme que le café et le thé contribuent normalement à l'hydratation quotidienne. L'effet diurétique n'apparaît significativement qu'à très forte dose chez des personnes non habituées à la caféine, et même là, on parle de quelques millilitres de différence, pas d'une déshydratation. Donc tu peux boire ton expresso tranquille, il ne va pas te dessécher.
## SOURCES
• Wikipedia — Health effects of coffee (en.wikipedia.org/wiki/Health_effects_of_coffee)
• Wikipedia — Health effects of tea (recommandations British Dietetic Association)
• Wikipedia — Caffeine use for sport (en.wikipedia.org/wiki/Caffeine_use_for_sport)
CONTENT
News.create!(
   name: "Le café te déshydrate",
   verdict: "FAUX",
   truth_percentage: 18,
   category: "Santé",
   confidence_level: "Élevée",
   tags: ["café", "caféine", "hydratation", "mythe", "alimentation"],
   trending: true,
   origin: "Mythe issu d'une étude de 1928 sur des sujets non habitués à la caféine, mal généralisée pendant des décennies.",
   content: content
)

# News 10
content = <<~CONTENT
  ## EXPLICATION
  Faux, et c'est même souvent l'inverse. Le micro-ondes chauffe les aliments par agitation des molécules d'eau, sans rayonnement ionisant — il ne "casse" pas les nutriments par magie. Ce qui détruit les vitamines (notamment la vitamine C et les vitamines B), c'est principalement la chaleur, le temps de cuisson, et le contact avec l'eau qui dissout les nutriments hydrosolubles. Or le micro-ondes utilise généralement peu d'eau et cuit rapidement, donc il préserve souvent mieux les nutriments que l'ébullition ou les longues cuissons. Des études comparatives sur les légumes montrent que le micro-ondes fait mieux que l'eau bouillante sur la rétention de vitamine C. Le seul vrai inconvén  ent est un chauffage parfois inégal, mais ça concerne la sécurité bactérienne, pas les nutriments.
## SOURCES
• Wikipedia — Microwave oven
• Wikipedia — Frozen vegetables (études comparatives sur la rétention de nutriments)
• Wikipedia — Microwave volumetric heating
CONTENT
News.create!(
  name: "Le micro-ondes détruit les nutriments des aliments",
  verdict: "FAUX",
  truth_percentage: 15,
  category: "Santé",
  confidence_level: "Élevée",
  tags: ["micro-ondes", "nutriments", "cuisson", "mythe", "alimentation"],
  trending: true,
  origin: "Mythe popularisé dans les années 1970-1980 avec la généralisation des fours à micro-ondes domestiques, alimenté par des peurs autour des \"ondes\".",
  content: content
)

# News 11
content = <<~CONTENT
  ## EXPLICATION
  Vrai, et c'est même plus fou qu'il n'y paraît. La pieuvre possède bien 3 cœurs : 2 cœurs branchiaux qui pompent le sang vers les branchies pour qu'il s'oxygène, et 1 cœur systémique qui distribue ensuite ce sang oxygéné dans tout le corps. Petit détail fascinant : le cœur systémique s'arrête de battre quand la pieuvre nage, ce qui l'épuise — voilà pourquoi elle préfère ramper. Pour les "9 cerveaux", c'est une formulation un peu raccourcie mais juste : la pieuvre a un cerveau central, plus un ganglion nerveux massif dans chacun de ses 8 bras, soit 9 structures nerveuses au total. Environ deux tiers de ses ≈500 millions de neurones sont dans ses bras, qui peuvent goûter, décider et réagir de façon semi-autonome — même un bras coupé continue à réagir. Bonus : son sang est bleu, à cause de l'hémocyanine au cuivre.
## SOURCES
• Smithsonian Magazine — Ten Wild Facts About Octopuses
• Natural History Museum London (cité dans plusieurs sources biologiques)
• Study.com — Octopus Circulatory System, Hearts & Brains
CONTENT
News.create!(
   name: "Les pieuvres ont 9 cerveaux et 3 cœurs",
   verdict: "VRAI",
   truth_percentage: 95,
   category: "Science",
   confidence_level: "Élevée",
   tags: ["pieuvre", "anatomie", "biologie", "cephalopode", "animaux"],
   trending: true,
   origin: "Fait anatomique documenté par la biologie marine moderne ; longtemps connu mais devenu viral sur les réseaux sociaux dans les années 2010.",
   content: content
)

# News 12
content = <<~CONTENT
  ## EXPLICATION
Vrai, et c'est purement une affaire de classification botanique. En botanique, une baie est un fruit charnu produit à partir d'une seule fleur contenant un seul ovaire. Cette définition inclut donc les raisins, les tomates, les concombres, les aubergines, les kakis... et oui, les bananes. La fraise, elle, est un "fruit composé accessoire" : la partie rouge charnue est en réalité un réceptacle floral gonflé, et les vraies "graines" sur la surface sont en fait de minuscules fruits secs appelés akènes — chacun contenant une graine. Donc d'un point de vue strictement botanique, une fraise n'est même pas un seul fruit mais un agrégat. Le mot "baie" qu'on utilise en cuisine (myrtilles, framboises, fraises) n'a rien à voir avec la définition scientifique.
## SOURCES
• Wikipedia — Berry (botany)
• Wikipedia — Strawberry / Fragaria
• Wikipedia — Banana
CONTENT
News.create!(
   name: "La banane est techniquement une baie, mais la fraise n'en est pas une",
   verdict: "VRAI",
   truth_percentage: 100,
   category: "Science",
   confidence_level: "Élevée",
   tags: ["banane", "fraise", "botanique", "baie", "classification"],
   trending: true,
   origin: "Distinction botanique formelle établie depuis les classifications classiques du XIXe siècle, devenue virale via les \"mind-blowing facts\" sur internet dans les années 2010.",
   content: content
)









# 3. Display a message 🎉
puts "Finished! Created #{News.count} news."

# rails db:seed
