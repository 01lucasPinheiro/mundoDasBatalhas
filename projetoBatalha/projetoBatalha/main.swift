//
//  main.swift
//  projetoBatalha
//
//  Created by LUCAS PINHEIRO DA COSTA PEDROSA on 14/11/25.
//

import Foundation

var nomeJogador = ""
var executando = true
var danoPersonagem = 5
var vidaPersonagem = 10
var moedas = 0


print("⚔️Bem vindo ao mundo das batalhas ⚔️")
print("Qaul o seu nome: ")
nomeJogador = readLine() ?? ""

func ataque(dano: Int = 5)->Int{
    return Int.random(in: 0...dano)
}

func verificarVencedor(vidaHeroi: Int, vidaMonstro: Int)->Bool{
    if vidaHeroi <= 0{
        print("Você foi derrotado ☠️")
        print("\n")
        return false
    }
    if vidaMonstro <= 0{
        print("Você venceu 🏆 e vai receber 50 moedas 💵")
        print("\n")
        return false
    }
    return true
}

func luta(nome: String, danoPersonagem: Int, vidahe: Int)-> Int{
    //let danoGlobim = 4
    var vidaGoblin = 10
    var vidaCombate = vidahe
    var ataqueRealizado = 0
    var lutaExecutando = true
    print("dano personagem: \(danoPersonagem)")
    print("Durante a luta digite apenas o número da ação que deseja realizar")
    print("O duelo vai começar")
    print("\(nome) vs goblin")
    
    while lutaExecutando{
        print("\n")
        print("vida \(nome): \(vidaCombate) ❤️")
        print("vida goblin: \(vidaGoblin) ❤️")
        print("1-Atacar")
        print("2-Defender")
        let escolhaLuta = readLine() ?? ""
        
        if escolhaLuta == "1"{
            ataqueRealizado = ataque(dano: danoPersonagem)
            vidaGoblin -= ataqueRealizado
            print("Dano causado ao goblin: \(ataqueRealizado)")
            lutaExecutando = verificarVencedor(vidaHeroi: vidahe, vidaMonstro: vidaGoblin)
            if !lutaExecutando{
                break
            }
        }
        if escolhaLuta == "2"{
            print("Você defendeu")
        }
        else{
            ataqueRealizado = ataque()
            vidaCombate -= ataqueRealizado
            print("O goblin causou \(ataqueRealizado) de dano")
            lutaExecutando = verificarVencedor(vidaHeroi: vidaCombate, vidaMonstro: vidaGoblin)
        }
    }
    if vidaGoblin <= 0{
        return 50
    }
    else{
        return 0
    }
}

func verificarCompra(dinheiro: Int, valorItem: Int)->Bool{
    if(dinheiro >= valorItem){
        return true
    }
    return false
}

func lojaArmadura(moedaLoja: Int, vidaAtual: Int, forcaAtual: Int) -> (vida: Int, moedaRetorno: Int, forcaRetorno: Int){
    
    let armaduras:[String: Int] =
    [
        "1": 50,
        "2": 100,
        "3": 200,
        "4": 60,
        "5": 80,
        "6": 200
    ]
    var moedaAtual = moedaLoja
    print("🛡️Bem vindo a loja de armaduras🛡️")
    print("Seu saldo: \(moedaLoja)")
    print("Digite o número do item que deseja adquirir")
    print("1-Armadura de couro, vida máxima: 12, preço: 50 moedas")
    print("2-Armadura de bronze, vida máxima: 15, preço: 100 moedas")
    print("3-Armadura de ferro, vida máxima: 20, preço 200 moedas")
    print("4-Espada de madeira, dano máximo: 7, preço 60 moedas")
    print("5-Espada de pedra, dano máximo: 8 preço 80 moedas ")
    print("6-Espada de ferro, dano máximo: 10 preço 200 moedas ")
    
    
    let escolhaLoja = readLine() ?? ""
    if (armaduras[escolhaLoja] != nil){
        let precoArmadura = armaduras[escolhaLoja]! //deve ser let ?
        switch escolhaLoja{
        case "1":
            if(verificarCompra(dinheiro: moedaLoja, valorItem: precoArmadura)){
                moedaAtual -= precoArmadura
                return (vida: 12, moedaRetorno: moedaAtual, forcaRetorno: forcaAtual)
            }
        case "2":
            if(verificarCompra(dinheiro: moedaLoja, valorItem: precoArmadura)){
                moedaAtual -= precoArmadura
                return (vida: 15, moedaRetorno: moedaAtual, forcaRetorno: forcaAtual)
            }
        case "3":
            if(verificarCompra(dinheiro: moedaLoja, valorItem: precoArmadura)){
                moedaAtual -= precoArmadura
                return (vida: 20, moedaRetorno: moedaAtual, forcaRetorno: forcaAtual)
            }
        case "4":
            if(verificarCompra(dinheiro: moedaLoja, valorItem: precoArmadura)){
                moedaAtual -= precoArmadura
                return (vida: vidaAtual, moedaRetorno: moedaAtual, forcaRetorno: 7)
            }
        case "5":
            if(verificarCompra(dinheiro: moedaLoja, valorItem: precoArmadura)){
                moedaAtual -= precoArmadura
                return (vida: vidaAtual, moedaRetorno: moedaAtual, forcaRetorno: 8)
            }
        case "6":
            if(verificarCompra(dinheiro: moedaLoja, valorItem: precoArmadura)){
                moedaAtual -= precoArmadura
                return (vida: vidaAtual, moedaRetorno: moedaAtual, forcaRetorno: 10)
            }
         default:
                print("Compra não realizada")
        }
    }
    print("Compra não realizada item indisponivel ou saldo insuficiente. \n ")
    return (vida: vidaAtual, moedaRetorno: moedaAtual, forcaRetorno: forcaAtual)
}

while executando{
    
    print("Digite a opção que deseja:")
    print("1-Batalha")
    print("2-Loja de armaduras")
    print("3-Sair do jogo")
    print("Esolha sua opção")
    let escolhaMenu = readLine() ?? ""
    
    
    switch escolhaMenu{
    case "1":
        moedas += luta(nome: nomeJogador, danoPersonagem: danoPersonagem, vidahe: vidaPersonagem)
    case "2":
        print("\n")
        let retornoLoja = lojaArmadura(moedaLoja: moedas, vidaAtual: vidaPersonagem, forcaAtual: danoPersonagem)
        vidaPersonagem = retornoLoja.vida
        moedas = retornoLoja.moedaRetorno
        danoPersonagem = retornoLoja.forcaRetorno
        
        print("Sua vida máxima agora é \(vidaPersonagem) ❤️")
        print("Seu dano máximo agora é \(danoPersonagem) 🗡️")
        print("Total de moedas após a compra é \(moedas) 💵")
        print("\n")
    case "3":
        executando = false
    default:
        print("opção invalida")
    }
}
