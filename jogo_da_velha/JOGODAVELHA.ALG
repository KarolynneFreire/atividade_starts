Algoritmo "jogodavelha"

//Alunos : Jonatha Fabricio Mendon�a de Albuquerque,
//Karolynne Susan Freire da Cunha, Lais Serafim do Nascimento,
//Let�cia Vit�ria Siqueira da Silva, Maria J�lia Alves da Rocha
// e Rog�rio Felipe Lima de Lucena Junior


Var
   linha, coluna, cont, linhaAux, opcao, chance, vez : inteiro
   bis, numrepetido, menu, contJogUm, contJogDois: inteiro
   joguinho: vetor [1..3,1..3] de caractere
   jogadorUm, jogadorDois, recbCaract, x:  caractere
   vencedor :logico

   //------------------Procedimentos-----------------------------

procedimento mensagemInicial()
inicio
   escreval ("###########################")
   escreval("      JOGO DA VELHA ")
   escreval ("###########################")
   escreval ()
   escreval ("O primeiro jogador que digitar o nome, sera: [X],")
   escreval("ja o segundo, sera: [0].")
   escreval ()
   escreval ()
   escreval (" ### DESEJAMOS BOA SORTE! ### ")
   escreval ()
   escreva("Jogador(a) 01, digite seu nome: ")
   leia(jogadorUm)
   escreva("Jogador(a) 02, digite seu nome: ")
   leia(jogadorDois)

   limpatela

   escreval("Bem vindos(as) ", jogadorUm, " e ", jogadorDois)
   escreval("Que comecem os jogos!")
   escreval()

fimprocedimento
//-----------------------------------------------------
procedimento preencherJogo()
Inicio

   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         cont <- cont + 1
         joguinho[linha, coluna] <- numpcarac(cont)
      fimpara
   fimpara
fimprocedimento

//-----------------------------------------------------
procedimento estruturaJogo()
Inicio

   escreval ("####################")
   escreval("   JOGO DA VELHA ")
   escreval ("-------------------")
   para linha de 1 ate 3 faca
      para coluna de 1 ate 3 faca
         escreva("| ")
         escreva(joguinho[linha,coluna]:4)
      fimpara
      escreva ("| ")
      escreval ()
      escreval ("-------------------")
   fimpara
   escreval ("####################")
fimprocedimento
//-----------------------------------------------------
procedimento jogarJogo()
Inicio

   x <- "X"
   vencedor<- falso
   chance <- 0
   vez<- 1

   repita

      escreval("Digite um numero para ", x ,": " )
      leia(opcao)

      se (opcao >= 1) e (opcao <= 9) entao
         se (opcao >= 1) e (opcao <= 3) entao
            linhaAux <- 1
            se (joguinho[linhaAux,opcao] = "X") ou(joguinho[linhaAux,opcao] = "0") entao
               numeroRepetido()
            senao
               joguinho [linhaAux,opcao] <- x
               vezJogador()
            fimse
         senao
            se (opcao >3) e (opcao <7) entao
               linhaAux <- 2
               se (joguinho[linhaAux,opcao-3] = "X") ou(joguinho[linhaAux,opcao-3] = "0") entao
                  numeroRepetido()
               senao
                  joguinho [linhaAux,opcao-3] <- x
                  vezJogador()
               fimse
            senao
               linhaAux <- 3
               se (joguinho[linhaAux,opcao-6] = "X") ou(joguinho[linhaAux,opcao-6] = "0") entao
                  numeroRepetido()
               senao
                  joguinho [linhaAux,opcao-6] <- x
                  vezJogador()
               fimse
            fimse
         fimse
      senao
         escreval("Opss! opcao invalida, aperte enter e digite novamente " )
         leia(recbCaract)
      fimse
      limpatela
      estruturaJogo()

   ate (vencedor = verdadeiro) ou (vez = 9)
   se (vencedor = verdadeiro) entao
      se (x="X") entao
         escreval (jogadorUm , " venceu!!!")
         contJogUm <- contJogUm + 1
      senao
         escreval (jogadorDois , " venceu!!!")
         contJogDois <- contJogDois + 1
      fimse
   senao
      escreval ("XIII! ",jogadorUm, " e ", jogadorDois," DEU VELHAAAA...")
   fimse
   jogarNovamente()
fimprocedimento
//-----------------------------------------------------
procedimento historico()
inicio
   se (contJogUm = 1) entao
      escreval(jogadorUm," ganhou", contJogUm, " vez!")
   senao
      escreval(jogadorUm," ganhou", contJogUm, " vezes!")
   fimse
   se (contJogDois = 1) entao
      escreval(jogadorDois," ganhou", contJogDois, " vez!")
   senao
      escreval(jogadorDois," ganhou", contJogDois, " vezes!")
   fimse
fimProcedimento
//-----------------------------------------------------
procedimento vezJogador()
Inicio

   vencedor <- verificarVencedor()
   chance <- chance + 1
   se (vencedor = falso) entao
      se (vez%2 <> 0) entao
         x <- "0"
      senao
         x <- "X"
      fimse
      vez <- vez +1
   fimse

fimprocedimento
//-----------------------------------------------------
procedimento numeroRepetido()
inicio
   escreval("Eita, esse numero ja foi digitado!")
   escreva("Aperte enter para continuar e preste mais atencao")
   leia(numrepetido)
fimprocedimento
//-----------------------------------------------------

procedimento jogarNovamente()
inicio
   repita
      escreval()
      historico()
      escreval()
      escreval("Desejam jogar novamente?")
      escreval()
      escreval("[1] Sim! ")
      escreval("[2] Nao! Caso voce saia, o placar voltara a zero")
      escreval()
      escreva("Opcao escolhida: ")
      leia(bis)

      limpatela

      escolha bis
      caso 1
         cont <- 0
         preencherJogo()
         estruturaJogo()
         jogarJogo()
      caso 2
         escreval("Poxa, ficaremos com saudades...")
         escreval("Aperte [1] para comecar novamente, ou [2] para sair")
      fimescolha
   ate(bis = 2)
fimprocedimento

//-------------------Funcao----------------------------
funcao verificarVencedor() : logico
var
   venceu : logico
Inicio
   venceu <- falso

   para linha de 1 ate 3  faca
      se ((joguinho[linha,1] = joguinho[linha,2] ) e (joguinho[linha,2] = joguinho[linha,3] )) entao
         venceu <- verdadeiro
      fimse
   fimpara

   para linha de 1 ate 3  faca
      se ((joguinho[1,linha] = joguinho[2,linha] ) e (joguinho[2,linha] = joguinho[3,linha] )) entao
         venceu <- verdadeiro
      fimse
   fimpara


   se ((joguinho[1,1] = joguinho[2,2] ) e (joguinho[2,2] = joguinho[3,3] )) entao
      venceu <- verdadeiro
   fimse

   se ((joguinho[1,3] = joguinho[2,2] ) e (joguinho[2,2] = joguinho[3,1] )) entao
      venceu <- verdadeiro
   fimse

   retorne venceu
fimfuncao

//-----------------------------------------------------
Inicio
   cont <- 0
   contJogUm <- 0
   contJogDois <- 0

   escreval("Iniciar jogo da velha")
   repita
      escreval ()
      escreval("[1] Para comecar jogo")
      escreval("[2] Sair")
      escreval()
      escreva("Opcao escolhida: ")
      leia(menu)

      limpatela

      se (menu <> 1) e (menu <> 2) entao
         escreval("Opcao invalida. Escolha uma opcao abaixo:")
      fimse
      escolha  menu
      caso 1
         cont <- 0
         mensagemInicial()
         preencherJogo()
         estruturaJogo()
         jogarJogo()
      caso 2
         escreval("Fim de jogo...")

      fimescolha
   ate (menu = 2)

Fimalgoritmo