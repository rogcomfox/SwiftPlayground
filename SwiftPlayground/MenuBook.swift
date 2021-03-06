//
//  MenuBook.swift
//  SwiftPlayground
//  Copyright © 2020 Nusantarian. All rights reserved.
//

import Foundation

class MenuBook{
    
    var total = 0
    var item = ("","","")
    
    func run(){
        menu()
    }
    
    func getInput(message: String) -> String?{
        print(message, terminator: ":")
        return readLine()
    }
    
    func getInputInt(message: String) -> Int?{
        if let inputString = getInput(message: message){
            return Int(inputString)
        } else {
            return nil
        }
    }
    // Kelas Makanan berat
    enum HeavyMeal: Int, CaseIterable {
        case nasiGoreng = 1, indomie, kwetiau
    }
    
    // Kelas Makanan Ringan
    enum SideDish: Int, CaseIterable {
        case ikan = 1, telur, kerupuk
    }
    
    // Kelas Minuman
    enum Drinks: Int, CaseIterable {
        case esTeh = 1, esJeruk, airPutih
    }
    
    func showAllHeavyMeal(){
        var position = 1
        print("Makan berat")
        for heavyMeal in HeavyMeal.allCases {
            print("[\(position)] \(heavyMeal)")
            position += 1
        }
    }
    
    func showAllSideDish(){
        var position = 1
        print("Lauk")
        for sideDish in SideDish.allCases {
            print("[\(position)] \(sideDish)")
            position += 1
        }
    }
    
    func showAllDrink(){
        var position = 1
        print("Minuman")
        for drink in Drinks.allCases {
            print("[\(position)] \(drink)")
            position += 1
        }
    }
    
    func inputHeavyMeal(){
        if let position = getInputInt(message: "Pilihlah Makanan"){
            if let heavyMeal = HeavyMeal(rawValue: position){
                switch heavyMeal {
                case .indomie:
                    total += 6000
                    item.0 = "Indomie"
                case .kwetiau:
                    total += 10000
                    item.0 = "Kwetiau"
                case .nasiGoreng:
                    total += 12000
                    item.0 = "Nasi Goreng"
                }
            } else {
                print("Posisi \(position) tidak ditemukan")
            }
        } else {
            print("input tidak valid")
        }
    }
    
    func inputSideDish(){
        if let position = getInputInt(message: "Pilihlah lauk"){
            if let sideDish = SideDish(rawValue: position) {
                switch sideDish {
                case .ikan:
                    total += 5000
                    item.1 = "Ikan"
                case .kerupuk:
                    total += 500
                    item.1 = "Kerupuk"
                    
                case .telur:
                    total += 3000
                    item.1 = "Telur"
                }
            } else {
                print("Posisi \(position) tidak ditemukan")
            }
        }else{
            print("Input tidak valid")
        }
    }
    
    func inputDrinks(){
        if let position = getInputInt(message: "Pilihlah lauk"){
            if let drink = Drinks(rawValue: position) {
                switch drink {
                case .airPutih:
                    total += 0
                    item.2 = "Air Putih"
                case .esJeruk:
                    total += 2500
                    item.2 = "Es Jeruk"
                case .esTeh:
                    total += 2000
                    item.2 = "Es Teh"
                }
            } else {
                print("Posisi \(position) tidak ditemukan")
            }
        }else{
            print("Input tidak valid")
        }
    }
    
    func menu(){
        showAllHeavyMeal()
        inputHeavyMeal()
        print("--------------------------------------")
        showAllSideDish()
        inputSideDish()
        print("--------------------------------------")
        showAllDrink()
        inputDrinks()
        print("--------------------------------------")
        print("Anda memilih \(item.0), \(item.1), dan \(item.2) dengan total harga Rp. \(total)")
        print("--------------------------------------")
        print("Terima kasih, selamat datang kembali!")
    }
    
}
