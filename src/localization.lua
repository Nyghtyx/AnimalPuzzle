--[[
    Animal Puzzle Game

    -- constants --

    Author: Ruben Sarabia Riquelme

    Text translated to the three different languages
]]

-- possible languages
LANGUAGES = {'english', 'spanish', 'portuguese'}

gTexts = {
    ['english'] = {
        ['farm'] = {'THE FARM'},
        ['garden'] = {'THE GARDEN'},
        ['savanna'] = {'THE SAVANNA'},
        ['welcome'] = {'Welcome!', 'Hello!'},
        ['stage-selection'] = {'Where do you want to go?'},
        ['play'] = {"Let's play!"},
        ['question'] = {'Who makes this sound?'},
        ['good-job'] = {'Good job!'},
        ['cat'] = {'The cat!'},
        ['chicken'] = {'The chicken!'},
        ['cow'] = {'The cow!'},
        ['dog'] = {'The dog!'},
        ['elephant'] = {'The elephant!'},
        ['giraffe'] = {'The giraffe!'},
        ['hippo'] = {'The hippo!'},
        ['horse'] = {'The horse!'},
        ['monkey'] = {'The monkey!'},
        ['mouse'] = {'The mouse!'},
        ['owl'] = {'The owl!'},
        ['pig'] = {'The pig!'},
        ['sheep'] = {'The sheep!'},
        ['squirrel'] = {'The squirrel!'},
        ['zebra'] = {'The zebra!'},
        ['woho'] = {'Wohoo! You guessed all of them!', 'Wohoo! You guessed all of them!'},
    },
    ['spanish'] = {
        ['farm'] = {'LA GRANJA'},
        ['garden'] = {'EL JARDÍN'},
        ['savanna'] = {'LA SAVANA'},
        ['welcome'] = {'Bienvenido!', 'Hola!'},
        ['stage-selection'] = {'Dónde quieres ir?'},
        ['play'] = {'Vamos a jugar!'},
        ['question'] = {'Quién hace este sonido?'},
        ['good-job'] = {'Buen trabajo!'},
        ['cat'] = {'El gato!'},
        ['chicken'] = {'La gallina!'},
        ['cow'] = {'La vaca!'},
        ['dog'] = {'El perro!'},
        ['elephant'] = {'El elefante!'},
        ['giraffe'] = {'La jirafa!'},
        ['hippo'] = {'El hipopótamo!'},
        ['horse'] = {'El caballo!'},
        ['monkey'] = {'El mono!'},
        ['mouse'] = {'El ratón!'},
        ['owl'] = {'El búho!'},
        ['pig'] = {'El cerdo!'},
        ['sheep'] = {'La oveja!'},
        ['squirrel'] = {'La ardilla!'},
        ['zebra'] = {'La cebra!'},
        ['woho'] = {'Wohoo! Los has acertado todos!', 'Wohoo! Los has acertado todos!'},
    },
    ['portuguese'] = {
        ['farm'] = {'A FAZENDA'},
        ['garden'] = {'O JARDIM'},
        ['savanna'] = {'A SAVANA'},       
        ['welcome'] = {'Bem-vindo!', 'Oi!'},
        ['stage-selection'] = {'Aonde você quer ir?'},
        ['play'] = {'Vamos jogar!'},
        ['question'] = {'Quem faz esse som?'},
        ['good-job'] = {'Bom trabalho!'},
        ['cat'] = {'O gato!'},
        ['chicken'] = {'A galinha!'},
        ['cow'] = {'A vaca!'},
        ['dog'] = {'O cachorro!'},
        ['elephant'] = {'O elefante!'},
        ['giraffe'] = {'A girafa!'},
        ['hippo'] = {'O hipopótamo!'},
        ['horse'] = {'O cavalo!'},
        ['monkey'] = {'O macaco!'},
        ['mouse'] = {'O rato!'},
        ['owl'] = {'A coruja!'},
        ['pig'] = {'O porco!'},
        ['sheep'] = {'A ovelha!'},
        ['squirrel'] = {'O esquilo!'},
        ['zebra'] = {'A zebra!'},
        ['woho'] = {'Wohoo! Você acertou todos!', 'Wohoo! Você acertou todos!'},
    }
}

gSpeech = {
    ['english'] = {
        ['welcome'] = {
            love.audio.newSource('sounds/dino//welcome/welcome.mp3', 'static'),
            love.audio.newSource('sounds/dino/welcome/hello.mp3', 'static')
        },
        ['stage-selection'] = {love.audio.newSource('sounds/dino/where/where-english.mp3', 'static')},
        ['farm'] = {love.audio.newSource('sounds/dino/stages/farm-english.mp3', 'static')},
        ['garden'] = {love.audio.newSource('sounds/dino/stages/garden-english.mp3', 'static')},
        ['savanna'] = {love.audio.newSource('sounds/dino/stages/savanna-english.mp3', 'static')},
        ['play'] = {love.audio.newSource('sounds/dino/play/play-english.mp3', 'static')},
        ['question'] = {love.audio.newSource('sounds/dino/question/question-english.mp3', 'static')},
        ['good-job'] = {love.audio.newSource('sounds/dino/question/goodjob-english.mp3', 'static')},
        ['cat'] = {love.audio.newSource('sounds/dino/animals/cat-english.mp3', 'static')},
        ['chicken'] = {love.audio.newSource('sounds/dino/animals/chicken-english.mp3', 'static')},
        ['cow'] = {love.audio.newSource('sounds/dino/animals/cow-english.mp3', 'static')},
        ['dog'] = {love.audio.newSource('sounds/dino/animals/dog-english.mp3', 'static')},
        ['elephant'] = {love.audio.newSource('sounds/dino/animals/elephant-english.mp3', 'static')},
        ['giraffe'] = {love.audio.newSource('sounds/dino/animals/giraffe-english.mp3', 'static')},
        ['hippo'] = {love.audio.newSource('sounds/dino/animals/hippo-english.mp3', 'static')},
        ['horse'] = {love.audio.newSource('sounds/dino/animals/horse-english.mp3', 'static')},
        ['monkey'] = {love.audio.newSource('sounds/dino/animals/monkey-english.mp3', 'static')},
        ['mouse'] = {love.audio.newSource('sounds/dino/animals/mouse-english.mp3', 'static')},
        ['owl'] = {love.audio.newSource('sounds/dino/animals/owl-english.mp3', 'static')},
        ['pig'] = {love.audio.newSource('sounds/dino/animals/pig-english.mp3', 'static')},
        ['sheep'] = {love.audio.newSource('sounds/dino/animals/sheep-english.mp3', 'static')},
        ['squirrel'] = {love.audio.newSource('sounds/dino/animals/squirrel-english.mp3', 'static')},
        ['zebra'] = {love.audio.newSource('sounds/dino/animals/zebra-english.mp3', 'static')},
        ['woho'] = {
            love.audio.newSource('sounds/dino/question/woho.mp3', 'static'), 
            love.audio.newSource('sounds/dino/question/all-guessed-english.mp3', 'static')
        },
    },
    ['spanish'] = {
        ['welcome'] = {
            love.audio.newSource('sounds/dino/welcome/bienvenido.mp3', 'static'),
            love.audio.newSource('sounds/dino/welcome/hola.mp3', 'static')
        },
        ['stage-selection'] = {love.audio.newSource('sounds/dino/where/where-spanish.mp3', 'static')},
        ['farm'] = {love.audio.newSource('sounds/dino/stages/farm-spanish.mp3', 'static')},
        ['garden'] = {love.audio.newSource('sounds/dino/stages/garden-spanish.mp3', 'static')},
        ['savanna'] = {love.audio.newSource('sounds/dino/stages/savanna-spanish.mp3', 'static')},
        ['play'] = {love.audio.newSource('sounds/dino/play/play-spanish.mp3', 'static')},
        ['question'] = {love.audio.newSource('sounds/dino/question/question-spanish.mp3', 'static')},
        ['good-job'] = {love.audio.newSource('sounds/dino/question/goodjob-spanish.mp3', 'static')},
        ['cat'] = {love.audio.newSource('sounds/dino/animals/cat-spanish.mp3', 'static')},
        ['chicken'] = {love.audio.newSource('sounds/dino/animals/chicken-spanish.mp3', 'static')},
        ['cow'] = {love.audio.newSource('sounds/dino/animals/cow-spanish.mp3', 'static')},
        ['dog'] = {love.audio.newSource('sounds/dino/animals/dog-spanish.mp3', 'static')},
        ['elephant'] = {love.audio.newSource('sounds/dino/animals/elephant-spanish.mp3', 'static')},
        ['giraffe'] = {love.audio.newSource('sounds/dino/animals/giraffe-spanish.mp3', 'static')},
        ['hippo'] = {love.audio.newSource('sounds/dino/animals/hippo-spanish.mp3', 'static')},
        ['horse'] = {love.audio.newSource('sounds/dino/animals/horse-spanish.mp3', 'static')},
        ['monkey'] = {love.audio.newSource('sounds/dino/animals/monkey-spanish.mp3', 'static')},
        ['mouse'] = {love.audio.newSource('sounds/dino/animals/mouse-spanish.mp3', 'static')},
        ['owl'] = {love.audio.newSource('sounds/dino/animals/owl-spanish.mp3', 'static')},
        ['pig'] = {love.audio.newSource('sounds/dino/animals/pig-spanish.mp3', 'static')},
        ['sheep'] = {love.audio.newSource('sounds/dino/animals/sheep-spanish.mp3', 'static')},
        ['squirrel'] = {love.audio.newSource('sounds/dino/animals/squirrel-spanish.mp3', 'static')},
        ['zebra'] = {love.audio.newSource('sounds/dino/animals/zebra-spanish.mp3', 'static')},
        ['woho'] = {
            love.audio.newSource('sounds/dino/question/woho.mp3', 'static'), 
            love.audio.newSource('sounds/dino/question/all-guessed-spanish.mp3', 'static')
        },
    },
    ['portuguese'] = {
        ['welcome'] = {
            love.audio.newSource('sounds/dino/welcome/bem-vindo.mp3', 'static'),
            love.audio.newSource('sounds/dino/welcome/oi.mp3', 'static')
        },
        ['stage-selection'] = {love.audio.newSource('sounds/dino/where/where-portuguese.mp3', 'static')},
        ['farm'] = {love.audio.newSource('sounds/dino/stages/farm-portuguese.mp3', 'static')},
        ['garden'] = {love.audio.newSource('sounds/dino/stages/garden-portuguese.mp3', 'static')},
        ['savanna'] = {love.audio.newSource('sounds/dino/stages/savanna-portuguese.mp3', 'static')},
        ['play'] = {love.audio.newSource('sounds/dino/play/play-portuguese.mp3', 'static')},
        ['question'] = {love.audio.newSource('sounds/dino/question/question-portuguese.mp3', 'static')},
        ['good-job'] = {love.audio.newSource('sounds/dino/question/goodjob-portuguese.mp3', 'static')},
        ['cat'] = {love.audio.newSource('sounds/dino/animals/cat-portuguese.mp3', 'static')},
        ['chicken'] = {love.audio.newSource('sounds/dino/animals/chicken-portuguese.mp3', 'static')},
        ['cow'] = {love.audio.newSource('sounds/dino/animals/cow-portuguese.mp3', 'static')},
        ['dog'] = {love.audio.newSource('sounds/dino/animals/dog-portuguese.mp3', 'static')},
        ['elephant'] = {love.audio.newSource('sounds/dino/animals/elephant-portuguese.mp3', 'static')},
        ['giraffe'] = {love.audio.newSource('sounds/dino/animals/giraffe-portuguese.mp3', 'static')},
        ['hippo'] = {love.audio.newSource('sounds/dino/animals/hippo-portuguese.mp3', 'static')},
        ['horse'] = {love.audio.newSource('sounds/dino/animals/horse-portuguese.mp3', 'static')},
        ['monkey'] = {love.audio.newSource('sounds/dino/animals/monkey-portuguese.mp3', 'static')},
        ['mouse'] = {love.audio.newSource('sounds/dino/animals/mouse-portuguese.mp3', 'static')},
        ['owl'] = {love.audio.newSource('sounds/dino/animals/owl-portuguese.mp3', 'static')},
        ['pig'] = {love.audio.newSource('sounds/dino/animals/pig-portuguese.mp3', 'static')},
        ['sheep'] = {love.audio.newSource('sounds/dino/animals/sheep-portuguese.mp3', 'static')},
        ['squirrel'] = {love.audio.newSource('sounds/dino/animals/squirrel-portuguese.mp3', 'static')},
        ['zebra'] = {love.audio.newSource('sounds/dino/animals/zebra-portuguese.mp3', 'static')},
        ['woho'] = {
            love.audio.newSource('sounds/dino/question/woho.mp3', 'static'), 
            love.audio.newSource('sounds/dino/question/all-guessed-portuguese.mp3', 'static')
        },
    },
    ['laugh'] = {love.audio.newSource('sounds/dino/laugh/laugh.mp3', 'static')}
}